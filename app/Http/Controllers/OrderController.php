<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\Address;
use App\Models\Country;
use App\Models\Product;
use App\Models\CartItem;
use App\Models\OrderDetail;
use App\Models\ProductSize;
use Illuminate\Support\Str;
use App\Models\ProductColor;
use App\Models\ProductColorSize;
use App\Http\Requests\OrderRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{
    //payment
    public function allOrders()
    {
        $user = Auth::user();
        if ($user) {
            if ($user->user_type == 1) {
                $cart = Cart::where('user_id', $user->id)->first();
                $cart_items = CartItem::where('cart_id', $cart->id)->get();
                $products = [];
                foreach ($cart_items as $cart_item) {
                    $productcs_id = ProductColorSize::find($cart_item->product_color_size_id);
                    $color_id = $productcs_id->product_color_id;
                    $productColor = ProductColor::where('id', $color_id)->first();
                    $product_check = Product::where('id',$productColor->product_id)->first();
                    if($product_check->delete_status == 'Yes'){
                        $cart_item->delete();
                    }else{
                        $products[]= $product_check;
                    }
                }
                $countries = Country::orderBy('name', 'asc')->get();
                return view('pages.Forms.all_order', compact('countries', 'products', 'cart_items'));
            } else {
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function allOrdersHandle(OrderRequest $request)
    {
        $user = Auth::user();
        if ($user) {
            if ($user->user_type == 1) {
                $cart = Cart::where('user_id', $user->id)->first();
                $cart_item = CartItem::where('cart_id', $cart->id)->get();
                $order_code = '#' . Str::random(6);
                $sub_total = $cart_item->sum('price');
                $quantity = $cart_item->sum('quantity');
                $tax = 0.10;
                $shipping = 150;
                if ($quantity < 5) {
                    $discount = 10;
                } else {
                    $discount = 25;
                }
                $discount_total = $sub_total - ($sub_total * ($discount / 100));
                $tax_total = $sub_total * $tax;
                $total = $shipping + $tax_total + $discount_total;
                $address = Address::updateOrCreate(
                    [
                        'user_id' => $user->id,
                    ],
                    [
                        'unit_number' => $request->unit_number,
                        'street_number' => $request->street_number,
                        'address_line1' => $request->address_line1,
                        'address_line2' => $request->address_line2,
                        'city' => $request->city,
                        'state' => $request->state,
                        'user_id' => $user->id,
                        'country_id' => $request->country_id,
                    ]
                );
                $order = Order::create([
                    'order_code' => $order_code,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'quantity' => $quantity,
                    'sub_total' => $sub_total,
                    'discount' => $discount,
                    'tax' => $tax_total,
                    'shipping' => $shipping,
                    'total' => $total,
                    'status' => 'Processing',
                    'user_id' => $user->id,
                    'address_id' => $address->id,
                ]);
                foreach ($cart_item as $item) {
                    $productcs = ProductColorSize::find($item->product_color_size_id);
                    $quantity_after_order = $productcs->quantity - $item->quantity;
                    $productcs->update([
                        'quantity' => $quantity_after_order
                    ]);
                    $order_details = OrderDetail::create([
                        'order_id' => $order->id,
                        'product_color_size_id' => $productcs->id,
                        'quantity' => $item->quantity,
                    ]);
                    $cart_item->each->delete();
                }
                return redirect()->route('order details', ['order_id' => encrypt($order->id)]);
            } else {
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function oneOrder($cartItem_id, $productcs_id)
    {
        $user = Auth::user();
        if ($user) {
            if ($user->user_type == 1) {
                $user_cart = $user->userCart;
                $cart_item = CartItem::where('id', $cartItem_id)
                    ->where('cart_id', $user_cart->id)
                    ->where('product_color_size_id', $productcs_id)
                    ->first();
                if ($cart_item) {
                    $productCS = ProductColorSize::find($productcs_id);
                    $color_id = $productCS->product_color_id;
                    $productColor = ProductColor::where('id', $color_id)->first();
                    $product = Product::where('id', $productColor->product_id)->where('delete_status','No')->first();
                    $countries = Country::orderBy('name', 'asc')->get();
                    return view('pages.Forms.one_order', compact('countries', 'product', 'cart_item'));
                } else {
                    return redirect()->route('Error')->with('error', "This product's not exist in your cart");
                }
            } else {
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function oneOrderHandle(OrderRequest $request, $cartItem_id, $productcs_id)
    {
        $user = Auth::user();
        if ($user) {
            if ($user->user_type == 1) {
                $user_cart = $user->userCart;
                $cart_item = CartItem::where('id', $cartItem_id)
                    ->where('cart_id', $user_cart->id)
                    ->where('product_color_size_id', $productcs_id)
                    ->first();
                if ($cart_item) {
                    $order_code = '#' . Str::random(6);
                    $sub_total = $cart_item->price;
                    $quantity = $cart_item->quantity;
                    $tax = 0.1;
                    $shipping = 150;
                    if ($quantity < 2) {
                        $discount = 5;
                    } else {
                        $discount = 10;
                    }
                    $discount_total = $sub_total - ($sub_total * ($discount / 100));
                    $tax_total = $sub_total * $tax;
                    $total = $shipping + $tax_total + $discount_total;
                    $address = Address::updateOrCreate(
                        [
                            'user_id' => $user->id,
                        ],
                        [
                            'unit_number' => $request->unit_number,
                            'street_number' => $request->street_number,
                            'address_line1' => $request->address_line1,
                            'address_line2' => $request->address_line2,
                            'city' => $request->city,
                            'state' => $request->state,
                            'user_id' => $user->id,
                            'country_id' => $request->country_id,
                        ]
                    );
                    $order = Order::create([
                        'order_code' => $order_code,
                        'email' => $request->email,
                        'phone' => $request->phone,
                        'quantity' => $quantity,
                        'sub_total' => $sub_total,
                        'discount' => $discount,
                        'tax' => $tax_total,
                        'shipping' => $shipping,
                        'total' => $total,
                        'status' => 'Processing',
                        'user_id' => $user->id,
                        'address_id' => $address->id,
                    ]);
                    $productcs = ProductColorSize::find($cart_item->product_color_size_id);
                    $quantity_after_order = $productcs->quantity - $quantity;
                    $productcs->update([
                        'quantity' => $quantity_after_order
                    ]);
                    $order_details = OrderDetail::create([
                        'order_id' => $order->id,
                        'product_color_size_id' => $productcs->id,
                        'quantity' => $quantity,
                    ]);
                    $cart_item->delete();
                    return redirect()->route('order details', ['order_id' => encrypt($order->id)]);
                } else {
                    return redirect()->route('Error')->with('error', "This product's not exist in your cart");
                }
            } else {
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function showOrderDetails($order_id)
    {
        $user = Auth::user();
        if ($user) {
            if ($user->user_type == 1) {
                $address = Address::where('user_id', $user->id)->first();
                $order = Order::where('id',decrypt($order_id))
                    ->where('user_id', $user->id)
                    ->where('address_id', $address->id)
                    ->first();
                if ($order) {
                    $order_details = OrderDetail::where('order_id', $order->id)->get();
                    // dd($order->OrderOrderDetails);
                    // foreach ($order->orderProductCS as $productcs) {
                    //     $color = $productcs->ProCSProColor->color;
                    //     dd($color);
                    //     $size = $productcs->ProCSProSize->size;
                    //     $color->colorProduct->name;
                    // }
                    return view('pages.Profile.order_details', compact('order_details', 'order'));
                } else {
                    return redirect()->route('Error')->with('error', "Something's going wrong");
                }
            } else {
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function payment($order_id){
        $user = Auth::user();
        if ($user) {
            if ($user->user_type == 1) {
                $address = Address::where('user_id', $user->id)->first();
                $order = Order::where('id', decrypt($order_id))
                    ->where('user_id', $user->id)
                    ->where('address_id', $address->id)
                    ->first();
                if ($order) {
                    Mail::send('pages.Mails.your_receipt', ['order' => $order], function ($message) use ($order) {
                        $message->to($order->email);
                        $message->subject('Receipt');
                    });
                    return view('pages.Payment.develped_payment');
                } else {
                    return redirect()->route('Error')->with('error', "Something's going wrong");
                }
            } else {
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
}