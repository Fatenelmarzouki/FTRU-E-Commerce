<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddToCartRequest;
use App\Http\Requests\EditCartRequest;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\ProductColorSize;
use App\Models\ProductSize;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function addToCart(AddToCartRequest $request)
    {
        $user = Auth::user();
        if ($user) {
            $product = Product::where('id',$request->product_id)->where('delete_status','No')->first();
            if ($product) {
                $user_cart = Cart::where("user_id", $user->id)->first();
                $user_cart_id = null;
                if ($user_cart) {
                    $user_cart_id = $user_cart->id;
                } else {
                    $cart = Cart::create([
                        "user_id" => $user->id,
                    ]);
                    $user_cart_id = $cart->id;
                }
                $color = ProductColor::where("color", $request->color)->where("product_id", $product->id)->first();
                $size = ProductSize::where("size", $request->size)->where("product_id", $product->id)->first();
                $productSC = ProductColorSize::where('product_color_id', $color->id)->where('product_size_id', $size->id)->first();
                if ($productSC) {
                    $qty = $request->quantity;
                    if ($qty <= $productSC->quantity) {
                        $check = CartItem::where('product_color_size_id', $productSC->id)->first();
                        if ($check) {
                            return redirect()->back()->with('error', 'This product is already exist in your cart');
                        } else {
                            if($product->main_discount != null){
                                $price=$product->main_price - ($product->main_price *  ($product->main_discount/100));
                            }else{
                                $price = $product->main_price;
                            }
                            $cart_item = CartItem::create([
                                'quantity' => $qty,
                                'price' => $price * $qty,
                                'cart_id' => $user_cart_id,
                                'product_color_size_id' => $productSC->id
                            ]);
                            return redirect()->back();
                        }
                    } else {
                        return redirect()->back()->with('error', 'Sorry,but you have filled up the limit for this product. There is no room for more.');
                    }
                } else {
                    return redirect()->back()->with('error', "This color doesn't available for this size");
                }
            } else {
                return redirect()->back()->with('error', 'Something is wrong please try again');
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function userCart()
    {
        $user = Auth::user();
        if ($user) {
            $cart = Cart::where('user_id', $user->id)->first();
            if ($cart) {
                $cart_item = CartItem::where('cart_id', $cart->id)->get();
                return view('pages.Profile.cart', compact('cart_item'));
            } else {
                return redirect()->back()->with('error', "You Don't have any product in your cart yet");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function deleteCart($cartitem_id)
    {
        $user = Auth::user();
        if ($user) {
            $user_cart = $user->userCart;
            $cart_item = CartItem::where('cart_id', $user_cart->id)->where('id', $cartitem_id)->first();
            if ($cart_item) {
                $cart_item->delete();
                return redirect()->back();
            } else {
                return redirect()->back()->with("error", "Something is wrong");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function deleteAllFromCart()
    {
        $user = Auth::user();
        if ($user) {
            if ($user->user_type == 1) {
                $user_cart = $user->userCart;
                $cart_items = CartItem::where('cart_id', $user_cart->id)->get();
                foreach ($cart_items as $item) {
                    $item->delete();
                }
                return redirect()->route('cart')->with('success', "you delete all products from your cart");
            } else {
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function editCart($cartitem_id, $product_id)
    {
        $user = Auth::user();
        if ($user) {
            $product = Product::where('id',$product_id)->where('delete_status','No')->first();
            if ($product) {
                $user_cart = $user->userCart;
                $cart_item = CartItem::where('cart_id', $user_cart->id)->where('id', $cartitem_id)->first();
                if ($cart_item) {
                    $productCS = ProductColorSize::where('id', $cart_item->product_color_size_id)->first();
                    return view('pages.Profile.edit_cart', compact('cart_item', 'product', 'productCS'));
                } else {
                    return redirect()->route('Error')->with("error", "Something is wrong");
                }
            } else {
                return redirect()->route('Error')->with('error', 'Something is wrong');
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function editCartHandle(EditCartRequest $request, $cartitem_id)
    {
        $cart_item = CartItem::where('id', $cartitem_id)->first();
        if ($cart_item) {
            $product = Product::where('id',$request->product_id)->where('delete_status','No')->first();
            if ($product) {
                $color = ProductColor::where("color", $request->color)->where("product_id", $product->id)->first();
                $size = ProductSize::where("size", $request->size)->where("product_id", $product->id)->first();
                $productSC = ProductColorSize::where('product_color_id', $color->id)->where('product_size_id', $size->id)->first();
                if ($productSC) {
                    $qty = $request->quantity;
                    if ($product->main_discount != null) {
                        $price = $product->main_price - ($product->main_price *  ($product->main_discount / 100));
                    } else {
                        $price = $product->main_price;
                    }
                    if ($qty <= $productSC->quantity) {
                        $cart_item->update([
                            'quantity' => $qty,
                            'price' => $price * $qty,
                            'product_color_size_id' => $productSC->id
                        ]);
                        return redirect()->route('cart');
                    } else {
                        return redirect()->back()->with('error', 'Sorry,but you have filled up the limit for this product. There is no room for more.');
                    }
                } else {
                    return redirect()->back()->with('error', "This color doesn't available for this size");
                }
            } else {
                return redirect()->back()->with('error', 'Something is wrong please try again');
            }
        } else {
            return redirect()->route('Error');
        }
    }
    // public function Cart()
    // {
    //     $user = Auth::user();
    //     if ($user) {
    //         $user_cart = $user->userCart;
    //         if ($user_cart) {
    //             $all_product = $user_cart->cartCItem;
    //             return view('pages.Profile.cart', compact('all_product'));
    //         } else {
    //             return redirect()->back()->with("error", "you don't have any product in your cart yet");
    //         }
    //     } else {
    //         return redirect()->route('login')->with("error", "you must login first");
    //     }
    // }
}