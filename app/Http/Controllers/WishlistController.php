<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use App\Models\ProductColor;
use App\Models\ProductColorSize;
use App\Models\ProductSize;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WishlistController extends Controller
{
    public function addToWishlist(Request $request)
    {
        $user = Auth::user();
        if ($user) {
            $product = Product::where('id', $request->product_id)->where('delete_status','No')->first();
            if ($product) {
                $check = Wishlist::where('product_id', $product->id)->first();
                if ($check) {
                    return redirect()->back();
                } else {
                    $userWish = Wishlist::create([
                        'user_id' => $user->id,
                        'product_id' => $product->id
                    ]);
                    return redirect()->back()->with('success','Added to Wishlist');
                }
            } else {
                return redirect()->back()->with('error', 'Something is wrong please try again');
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function userWishlist()
    {
        $user = Auth::user();
        if ($user) {
            $user_wishlist = $user->userWishlist;
            if ($user_wishlist) {
                return view('pages.Profile.wishlist', compact('user_wishlist'));
            } else {
                //check the message of error
                return redirect()->back()->with("error", "You Don't have any product in your cart yet");
            }
        } else {
            return redirect()->route('Login')->with("error", "You Must Login First");
        }
    }
    public function deleteWishlist($wishlist_id)
    {
        $user = Auth::user();
        if ($user) {
            $wishlist_item = Wishlist::where('user_id', $user->id)->where('id', $wishlist_id)->first();
            if ($wishlist_item) {
                $wishlist_item->delete();
                return redirect()->back();
            } else {
                return redirect()->back()->with("error", "Something is wrong");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function deleteAllFromWishlist(){
        $user=Auth::user();
        if($user){
            if($user->user_type == 1){
                $wishlist_items=Wishlist::where('user_id',$user->id)->get();
                foreach($wishlist_items as $item){
                    $item->delete();
                }
                return redirect()->route('wishlist')->with('success', "You delete all products from your wishlist");
            }else{
                return redirect()->route('Register')->with('error', "Create your Account First");
            }
        } else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function moveToCart(Request $request)
    {
        $user = Auth::user();
        if ($user) {
            $product = Product::where('id',decrypt($request->product_id))->where('delete_status','No')->first();
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
                        $check = CartItem::where('product_color_size_id', $productSC->id)->first();
                        if ($check) {
                            return redirect()->back()->with('error', 'This product is already exist in your cart');
                        } else {
                            $cart_item = CartItem::create([
                                'quantity' => 1,
                                'price' => $product->main_price ,
                                'cart_id' => $user_cart_id,
                                'product_color_size_id' => $productSC->id
                            ]);
                        $wishlist_item= Wishlist::where('user_id', $user->id)->where('product_id', $product->id)->first();
                        if ($wishlist_item) {
                            $wishlist_item->delete();
                            return redirect()->back();
                        } else {
                            return redirect()->back()->with("error", "Something is Wrong");
                        }
                    }
                }else {
                    return redirect()->back()->with('error', "This color doesn't available for this size");
                }
            } else {
                return redirect()->back()->with('error', 'Something is wrong please try again');
            }
        }else {
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }
    }
    public function addAllToCartFromWishlist()
    {
        $user = Auth::user();
        if ($user) {
            $wishlistItems = Wishlist::where('user_id', $user->id)->get();
            if ($wishlistItems) {
                foreach ($wishlistItems as $item) {
                    $product = Product::where("id", $item->product_id)->where('delete_status','No')->first();
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
                        $color = ProductColor::where("product_id", $product->id)->first();
                        $size = ProductSize::where("product_id", $product->id)->first();
                        $productSC = ProductColorSize::where("product_color_id", $color->id)->where("product_size_id", $size->id)->first();
                        if ($productSC) {
                            $qty = 1;
                            if ($productSC->quantity == 0 ) {
                                continue;
                            } else {
                                $check = CartItem::where("product_color_size_id", $productSC->id)->first();
                                if ($check) {
                                    $wishlist_id = Wishlist::where("product_id", $item->product_id)->where("user_id", $user->id)->first();
                                    $wishlist_id->delete();
                                    continue;
                                } else {
                                    $cart_item = CartItem::create([
                                        "quantity" => $qty,
                                        "price" => $product->main_price * $qty,
                                        "cart_id" => $user_cart_id,
                                        "product_color_size_id" => $productSC->id,
                                    ]);
                                    $wishlist_id = Wishlist::where("product_id", $item->product_id)->where("user_id", $user->id)->first();
                                    if ($wishlist_id) {
                                        $wishlist_id->delete();
                                    } else {
                                        return redirect()->back()->with("error", "Something is wrong try agian later");
                                    }
                                }
                            }
                        } else {
                            return redirect()->back()->with("error", "This Product Not Found");
                        }
                    } else {
                        return redirect()->back()->with("error", "Product Not Here");
                    }
                }
                return redirect()->back()->with("success", "All Products added sussefully");
            } else {
                return redirect()->back()->with("error", "No Data Here");
            }
        } else {
            return redirect()->route('Login')->with("error", "You Must Login First");
        }
    }

}
