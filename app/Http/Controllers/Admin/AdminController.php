<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use App\Models\Visitor;
use App\Models\CartItem;
use App\Models\Category;
use App\Models\OrderDetail;
use App\Models\ProductSize;
use App\Models\SubCategory;
use App\Models\ProductColor;
use Illuminate\Http\Request;
use App\Models\ProductColorSize;
use App\Http\Requests\LoginRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Admin\EditProductCS;
use App\Http\Requests\Admin\EditMainProduct;
use App\Http\Requests\Admin\EditOrderRequest;
use App\Http\Requests\Admin\AddProductRequest;
use App\Http\Requests\Admin\AddCategoryRequest;
use App\Http\Requests\Admin\AddSubCategoryRequest;
use App\Http\Requests\Admin\AddProductColorSizeRequest;

class AdminController extends Controller
{
    public function dashboard()
    {
        $orders = Order::orderBy('created_at', 'desc')
            // ->groupBy('user_id')
            ->take(5)
            ->get();
        $product = Product::all();
        $all_customer = User::where('user_type', '1')
            ->orderBy('created_at', 'desc')
            ->take(5)
            ->get();
        $users = User::where('user_type', '1')
            ->orderBy('created_at', 'desc')
            ->get();
        $visitor = Visitor::where('id', '1')->first();
        return view('Dashboard.dashboard', compact('product', 'all_customer', 'orders', 'visitor', 'users'));
    }
    public function loginForm()
    {
        return view('Dashboard.Forms.login');
    }
    public function handleAdminLogin(LoginRequest $request)
    {
        $is_login = Auth::attempt(["email" => $request->email, "password" => $request->password]);
        if ($is_login) {
            $admin = User::where("email", $request->email)->where("user_type", "=", "0")->first();
            if ($admin) {
                return redirect()->route('dash');
            } else {
                return redirect()->back()->with("error", "You don't allow to access this page");
            }
        } else {
            return redirect()->back()->with("error", "Wrong credentials invalid email or password");
        }
    }
    public function categoryForm()
    {
        return view('Dashboard.Forms.add_category');
    }
    public function addCategoryHandle(AddCategoryRequest $request)
    {
        $is_login = Auth::user();
        if ($is_login) {
            $admin = User::where('user_type', '0')->where('email', $is_login->email)->first();
            if ($admin) {
                Category::create([
                    'name' => $request->name,
                ]);
                return redirect()->back()->with('success', 'Category Created Successfuly');
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function subcategoryForm()
    {
        $categories = Category::all();
        return view('Dashboard.Forms.add_Subcategory', compact('categories'));
    }
    public function addSubcategoryHandle(AddSubCategoryRequest $request)
    {
        $is_login = Auth::user();
        if ($is_login) {
            $admin = User::where('user_type', '0')->where('email', $is_login->email)->first();
            if ($admin) {
                $name = $request->name;
                $check = SubCategory::where('name', 'like', "%$name%")
                    ->where('category_id', $request->category_id)
                    ->first();
                if ($check) {
                    return redirect()->back()->with('error', "This's Subcategory already Exist");
                } else {
                    SubCategory::create([
                        'name' => $request->name,
                        'category_id' => $request->category_id,
                    ]);
                    return redirect()->back()->with('success', 'Subcategory Created Successfuly');
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function allCategory()
    {
        $categories = Category::paginate(6);
        return view('Dashboard.Show All.all_category', compact('categories'));
    }
    public function oneCategory($category_id)
    {
        $category = Category::where('id', decrypt($category_id))->first();
        if ($category) {
            $categories = $category->categorySubcategory()->paginate(6);
            return view('Dashboard.Show All.one_category', compact('category', 'categories'));
        } else {
            return redirect()->route('dash')->with("error", "This Category is not exist");
        }
    }
    public function oneSubCategory($category_id, $subcategory_id)
    {
        $category = Category::where('id', decrypt($category_id))->first();
        if ($category) {
            $subcategory = SubCategory::where('id', decrypt($subcategory_id))->where('category_id', decrypt($category_id))->first();
            if ($subcategory) {
                $products = Product::where('sub_category_id', $subcategory->id)->paginate(6);
                return view('Dashboard.Show All.one_subcategory', compact('category', 'subcategory', 'products'));
            } else {
                return redirect()->back()->with("error", "This SubCategory is not exist");
            }
        } else {
            return redirect()->route('dash')->with("error", "This Category is not exist");
        }
    }
    public function productForm($category_id, $subcategory_id)
    {
        $category = Category::where('id', $category_id)->first();
        if ($category) {
            $subcategory = SubCategory::where('id', decrypt($subcategory_id))->where('category_id', $category_id)->first();
            if ($subcategory) {
                $productCount = Product::count();
                return view('Dashboard.Forms.add_Products', compact('category', 'subcategory', 'productCount'));
            } else {
                return redirect()->back()->with("error", "This SubCategory is not exist");
            }
        } else {
            return redirect()->route('dash')->with("error", "This Category is not exist");
        }
    }
    public function productFormHandle($category_id, $subcategory_id, AddProductRequest $request)
    {
        $is_login = Auth::user();
        if ($is_login) {
            $admin = User::where('user_type', '0')->where('email', $is_login->email)->first();
            if ($admin) {
                $category = Category::where('id', decrypt($category_id))->first();
                if ($category) {
                    $subcategory = SubCategory::where('id', decrypt($subcategory_id))
                        ->where('category_id', decrypt($category_id))
                        ->first();
                    if ($subcategory) {
                        $is_product_exist = Product::where("product_code", $request->product_code)->first();
                        if ($is_product_exist) {
                            return redirect()
                                ->back()
                                ->with('error', 'This Product already Exist');
                        } else {
                            $file_path = $category->name . "/" . $subcategory->name . " Products";
                            $product_image = Storage::putFile($file_path, $request->image);
                            $product = Product::create([
                                "name" => $request->name,
                                "image" => $product_image,
                                "main_price" => $request->main_price,
                                "main_discount" => $request->main_discount,
                                "product_code" => $request->product_code,
                                "status" => $request->status,
                                "sub_category_id" => $subcategory->id,
                            ]);
                            $color = ProductColor::create([
                                "color" => $request->color,
                                "product_id" => $product->id,
                            ]);
                            $size = ProductSize::create([
                                "size" => $request->size,
                                "product_id" => $product->id,
                            ]);
                            $product_color_size = ProductColorSize::create([
                                "quantity" => $request->quantity,
                                "image" => $product_image,
                                "product_color_id" => $color->id,
                                "product_size_id" => $size->id,
                            ]);
                            return redirect()
                                ->route('Show_one subcategory', ['category_id' => encrypt($category->id), 'subcategory_id' => encrypt($subcategory->id)])
                                ->with('success', 'Product Created Successfully');
                        }
                    } else {
                        return redirect()->back()->with("error", "This SubCategory is not exist");
                    }
                } else {
                    return redirect()->route('dash')->with("error", "This Category is not exist");
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function oneProduct($category_id, $subcategory_id, $product_id)
    {
        $category = Category::where('id', $category_id)->first();
        if ($category) {
            $subcategory = SubCategory::where('id', decrypt($subcategory_id))->where('category_id', $category->id)->first();
            if ($subcategory) {
                $product = Product::where('id', decrypt($product_id))->where('sub_category_id', $subcategory->id)->first();
                if ($product) {
                    return view('Dashboard.Show All.one_product', compact('category', 'subcategory', 'product'));
                } else {
                    return redirect()->back()->with("error", "This Product is not exist");
                }
            } else {
                return redirect()->back()->with("error", "This SubCategory is not exist");
            }
        } else {
            return redirect()->route('dash')->with("error", "This Category is not exist");
        }
    }
    public function productCSForm($category_id, $subcategory_id, $product_id)
    {
        $category = Category::where('id', $category_id)->first();
        if ($category) {
            $subcategory = SubCategory::where('id', decrypt($subcategory_id))
                ->where('category_id', $category->id)->first();
            if ($subcategory) {
                $product = Product::where('id', decrypt($product_id))->where('sub_category_id', $subcategory->id)->first();
                if ($product) {
                    return view('Dashboard.Forms.add_color_size', compact('category', 'subcategory', 'product'));
                } else {
                    return redirect()->back()->with("error", "This Product is not exist");
                }
            } else {
                return redirect()->back()->with("error", "This SubCategory is not exist");
            }
        } else {
            return redirect()->route('dash')->with("error", "This Category is not exist");
        }
    }
    // public function productCSHandle($category_id, $subcategory_id, $product_id, AddProductColorSizeRequest  $request)
    // {
    //     $is_login = Auth::user();
    //     if ($is_login) {
    //         $admin = User::where('user_type', '0')->where('email', $is_login->email)->first();
    //         if ($admin) {
    //             $category = Category::where('id', $category_id)->first();
    //             if ($category) {
    //                 $subcategory = SubCategory::where('id', decrypt($subcategory_id))
    //                     ->where('category_id', $category->id)
    //                     ->first();
    //                 if ($subcategory) {
    //                     $is_product_exist = Product::where("product_code", $request->product_code)
    //                         ->where('id', decrypt($product_id))
    //                         ->where('sub_category_id', $subcategory->id)->first();
    //                     if ($is_product_exist) {
    //                         $file_path = $category->name . "/" . $subcategory->name . " Products";
    //                         $product_image = Storage::putFile($file_path, $request->image);
    //                         $is_color = ProductColor::where('color', $request->color)
    //                             ->where('product_id', $is_product_exist->id)->first();
    //                         $is_size = ProductSize::where('size', $request->size)
    //                             ->where('product_id', $is_product_exist->id)->first();
    //                         if ($is_color) {
    //                             $size = ProductSize::create([
    //                                 "product_id" => $is_product_exist->id,
    //                                 "size" => $request->size,
    //                             ]);
    //                             $product_color_size = ProductColorSize::create([
    //                                 "quantity" => $request->quantity,
    //                                 "image" => $product_image,
    //                                 "product_color_id" => $is_color->id,
    //                                 "product_size_id" => $size->id,
    //                             ]);
    //                             return redirect()
    //                                 ->route(
    //                                     'Show_one product',
    //                                     ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)]
    //                                 )
    //                                 ->with('success', 'The Product added Successfully');
    //                         } elseif ($is_size) {
    //                             $color = ProductColor::create([
    //                                 "product_id" => $is_product_exist->id,
    //                                 "color" => $request->color,
    //                             ]);
    //                             $product_color_size = ProductColorSize::create([
    //                                 "quantity" => $request->quantity,
    //                                 "image" => $product_image,
    //                                 "product_color_id" => $color->id,
    //                                 "product_size_id" => $is_size->id,
    //                             ]);
    //                             return redirect()
    //                                 ->route(
    //                                     'Show_one product',
    //                                     ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)]
    //                                 )
    //                                 ->with('success', 'The Product added Successfully');
    //                         } elseif ($is_color && $is_size) {
    //                             $is_productCS_exist = ProductColorSize::where("product_size_id", $is_size->id)
    //                                 ->where("product_color_id", $is_color->id)->first();
    //                             if ($is_productCS_exist) {
    //                                 return redirect()
    //                                     ->route(
    //                                         'Show_one product',
    //                                         ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)]
    //                                     )
    //                                     ->with('error', 'This Product already Exist');
    //                             } else {
    //                                 $product_color_size = ProductColorSize::create([
    //                                     "quantity" => $request->quantity,
    //                                     "image" => $product_image,
    //                                     "product_color_id" => $is_color->id,
    //                                     "product_size_id" => $is_size->id,
    //                                 ]);
    //                                 return redirect()
    //                                     ->route(
    //                                         'Show_one product',
    //                                         ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)]
    //                                     )
    //                                     ->with('success', 'The Product added Successfully');
    //                             }
    //                         } elseif (!$is_color && !$is_size) {
    //                             $color = ProductColor::create([
    //                                 "product_id" => $is_product_exist->id,
    //                                 "color" => $request->color,
    //                             ]);
    //                             $size = ProductSize::create([
    //                                 "product_id" => $is_product_exist->id,
    //                                 "size" => $request->size,
    //                             ]);
    //                             $product_color_size = ProductColorSize::create([
    //                                 "quantity" => $request->quantity,
    //                                 "image" => $product_image,
    //                                 "product_color_id" => $color->id,
    //                                 "product_size_id" => $size->id,
    //                             ]);
    //                             return redirect()
    //                                 ->route(
    //                                     'Show_one product',
    //                                     ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)]
    //                                 )
    //                                 ->with('success', 'The Product added Successfully');
    //                         }
    //                     } else {
    //                         return redirect()
    //                             ->route('Add new product', ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id)])
    //                             ->with('error', 'This Product already Exist');
    //                     }
    //                 } else {
    //                     return redirect()->route('Error')->with("error", "Something's going Wrong");
    //                 }
    //             } else {
    //                 return redirect()->route('Error')->with("error", "Something's going Wrong");
    //             }
    //         } else {
    //             abort(404);
    //         }
    //     } else {
    //         return redirect()->route('adminlogin')->with('error', 'You Must Login First');
    //     }
    // }
    public function productCSHandle($category_id, $subcategory_id, $product_id, AddProductColorSizeRequest  $request)
    {
        $is_login = Auth::user();
        if ($is_login) {
            $admin = User::where('user_type', '0')->where('email', $is_login->email)->first();
            if ($admin) {
                $category = Category::where('id', $category_id)->first();
                if ($category) {
                    $subcategory = SubCategory::where('id', decrypt($subcategory_id))
                        ->where('category_id', $category->id)
                        ->first();
                    if ($subcategory) {
                        $is_product_exist = Product::where("product_code", $request->product_code)
                            ->where('id', decrypt($product_id))
                            ->where('sub_category_id', $subcategory->id)->first();
                        if ($is_product_exist) {
                            $file_path = $category->name . "/" . $subcategory->name . " Products";
                            $product_image = Storage::putFile($file_path, $request->image);
                            $is_color = ProductColor::where('color', $request->color)
                                ->where('product_id', $is_product_exist->id)->first();
                            $is_size = ProductSize::where('size', $request->size)
                                ->where('product_id', $is_product_exist->id)->first();
                            if ($is_color && $is_size) {
                                $is_productCS_exist = ProductColorSize::where("product_size_id", $is_size->id)
                                    ->where("product_color_id", $is_color->id)->first();
                                if ($is_productCS_exist) {
                                    return redirect()
                                        ->route('Show_one product', ["category_id" => $category->id, "subcategory_id" => encrypt($subcategory->id), "product_id" => encrypt($is_product_exist->id)])
                                        ->with('error', 'This Product is already Exist');
                                } else {
                                    $product_color_size = ProductColorSize::create([
                                        "product_sizes_id" => $is_size->id,
                                        "product_colors_id" => $is_color->id,
                                        "quantity" => $request->quantity,
                                        "image" => $product_image,
                                    ]);
                                    return redirect()
                                        ->route(
                                            'Show_one product',
                                            [
                                                "category_id" => $category->id,
                                                "subcategory_id" => encrypt($subcategory->id),
                                                "product_id" => encrypt($is_product_exist->id)
                                            ]
                                        )
                                        ->with('success', 'Product Created Successfully');
                                }
                            } elseif (!$is_color && !$is_size) {
                                $color = ProductColor::create([
                                    "product_id" => $is_product_exist->id,
                                    "color" => $request->color,
                                ]);
                                $size = ProductSize::create([
                                    "product_id" => $is_product_exist->id,
                                    "size" => $request->size,
                                ]);
                                $product_color_size = ProductColorSize::create([
                                    "product_sizes_id" => $size->id,
                                    "product_colors_id" => $color->id,
                                    "quantity" => $request->quantity,
                                    "image" => $product_image,
                                ]);
                                return redirect()
                                    ->route(
                                        'Show_one product',
                                        [
                                            "category_id" => $category->id,
                                            "subcategory_id" => encrypt($subcategory->id),
                                            "product_id" => encrypt($is_product_exist->id)
                                        ]
                                    )
                                    ->with('success', 'Product Created Successfully');
                            } elseif ($is_color) {
                                $size = ProductSize::create([
                                    "product_id" => $is_product_exist->id,
                                    "size" => $request->size,
                                ]);
                                $product_color_size = ProductColorSize::create([
                                    "product_sizes_id" => $size->id,
                                    "product_colors_id" => $is_color->id,
                                    "quantity" => $request->quantity,
                                    "image" => $product_image,
                                ]);
                                return redirect()
                                    ->route(
                                        'Show_one product',
                                        [
                                            "category_id" => $category->id,
                                            "subcategory_id" => encrypt($subcategory->id),
                                            "product_id" => encrypt($is_product_exist->id)
                                        ]
                                    )
                                    ->with('success', 'Product Created Successfully');
                            } elseif ($is_size) {
                                $color = ProductColor::create([
                                    "product_id" => $is_product_exist->id,
                                    "color" => $request->color,
                                ]);
                                $product_color_size = ProductColorSize::create([
                                    "product_sizes_id" => $is_size->id,
                                    "product_colors_id" => $color->id,
                                    "quantity" => $request->quantity,
                                    "image" => $product_image,
                                ]);
                                return redirect()
                                    ->route(
                                        'Show_one product',
                                        [
                                            "category_id" => $category->id,
                                            "subcategory_id" => encrypt($subcategory->id),
                                            "product_id" => encrypt($is_product_exist->id)
                                        ]
                                    )
                                    ->with('success', 'Product Created Successfully');
                            }
                        } else {
                            return redirect()
                                ->route(
                                    'Show_one subcategory',
                                    [
                                        'category_id' => encrypt($category->id),
                                        'subcategory_id' => encrypt($subcategory->id)
                                    ]
                                )
                                ->with('error', 'This Product is not Exist');
                        }
                    } else {
                        return redirect()->back()->with("error", "This SubCategory is not exist");
                    }
                } else {
                    return redirect()->route('dash')->with("error", "This Category is not exist");
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function allCustomer()
    {
        $all_customer = User::where('user_type', '1')->paginate(10);
        return view('Dashboard.Show All.all_customers', compact('all_customer'));
    }
    public function deleteOneProduct($category_id, $subcategory_id, $product_id)
    {
        $is_admin = Auth::user();
        if ($is_admin) {
            $admin = User::where('user_type', '0')->where('email', $is_admin->email)->first();
            if ($admin) {
                $category = Category::where('id', $category_id)->first();
                $subcat = SubCategory::where('id', decrypt($subcategory_id))->where('category_id', $category->id)->first();
                if ($subcat) {
                    $product = Product::where('id', decrypt($product_id))->where('sub_category_id', $subcat->id)->first();
                    $product_review = $product->productReview;
                    $product_wishlist = $product->productWishlist;
                    foreach ($product->productColor as $color) {
                        foreach ($color->colorSize as $productCS) {
                            $product_cartitems = CartItem::where('product_color_size_id', $productCS->pivot->id)->first();
                            $product_orderdetails = OrderDetail::where('product_color_size_id', $productCS->pivot->id)->first();
                            if ($product_cartitems) {
                                $product->update([
                                    'delete_status' => 'Yes'
                                ]);
                                return redirect()->route(
                                    'Show_one subcategory',
                                    [
                                        'category_id' => encrypt($category->id),
                                        'subcategory_id' => encrypt($subcat->id)
                                    ]
                                )->with('error', "This product is present in a cart item and will be deleted within one week");
                            }
                            if($product_orderdetails){
                                $order= Order::where('id', $product_orderdetails->order_id)->first();
                                if($order->status != 'Delivered'){
                                    return redirect()->route(
                                        'Show_one subcategory',
                                        [
                                            'category_id' => encrypt($category->id),
                                            'subcategory_id' => encrypt($subcat->id)
                                        ]
                                    )->with('error', "This product is order and its status is $order->status ");
                                }else{
                                    $product->update([
                                        'delete_status' => 'Yes'
                                    ]);
                                    return redirect()->route(
                                        'Show_one subcategory',
                                        [
                                            'category_id' => encrypt($category->id),
                                            'subcategory_id' => encrypt($subcat->id)
                                        ]
                                    )->with('error', "This product is present in a order and will be deleted within one week");
                                }
                            }
                            if ($productCS->pivot->image != null) {
                                Storage::delete($productCS->pivot->image);
                            }
                            $productCS->pivot->delete();
                        }
                        $color->delete();
                    }
                    foreach ($product->productSize as $size) {
                        $size->delete();
                    }
                    if ($product_review) {
                        foreach ($product_review as $proreview) {
                            $proreview->delete();
                        }
                    }
                    if ($product_wishlist) {
                        foreach ($product_wishlist as $prowishlist) {
                            $prowishlist->pivot->delete();
                        }
                    }
                    if ($product->image != null) {
                        Storage::delete($product->image);
                    }
                    $product->delete();
                    return redirect()->route(
                        'Show_one subcategory',
                        [
                            'category_id' => encrypt($category->id),
                            'subcategory_id' => encrypt($subcat->id)
                        ]
                    )->with('success', "Product's Deleted Successfully");
                } else {
                    return redirect()->back()->with("error", "This SubCategory is not exist");
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function deleteProductCS($category_id, $subcategory_id, $product_id, $productColor_id, $productSize_id, $productCS_id)
    {
        $is_admin = Auth::user();
        if ($is_admin) {
            $admin = User::where('user_type', '0')->where('email', $is_admin->email)->first();
            if ($admin) {
                $category = Category::where('id', $category_id)->first();
                $subcat = SubCategory::where('id', $subcategory_id)->where('category_id', $category->id)->first();
                if ($subcat) {
                    $product = Product::where('id', decrypt($product_id))->where('sub_category_id', $subcat->id)->first();
                    if ($product) {
                        $color = ProductColor::where('id', $productColor_id)->where('product_id', $product->id)->first();
                        $size = ProductSize::where('id', $productSize_id)->where('product_id', $product->id)->first();
                        if ($color && $size) {
                            $productCS = ProductColorSize::where('id', $productCS_id)
                                ->where("product_size_id", $size->id)
                                ->where("product_color_id", $color->id)->first();
                            if ($productCS) {
                                $product_cartitems = CartItem::where('product_color_size_id', $productCS->id)->first();
                                $product_orderdetails = OrderDetail::where('product_color_size_id', $productCS->id)->first();
                                if ($product_cartitems) {
                                    $product->update([
                                        'delete_status' => 'Yes'
                                    ]);
                                    return redirect()->route(
                                        'Show_one subcategory',
                                        [
                                            'category_id' => encrypt($category->id),
                                            'subcategory_id' => encrypt($subcat->id)
                                        ]
                                    )->with('error', "This product is present in a cart item and will be deleted within one week");
                                }
                                if ($product_orderdetails) {
                                    $order = Order::where('id', $product_orderdetails->order_id)->first();
                                    if ($order->status != 'Delivered') {
                                        return redirect()->route(
                                            'Show_one subcategory',
                                            [
                                                'category_id' => encrypt($category->id),
                                                'subcategory_id' => encrypt($subcat->id)
                                            ]
                                        )->with('error', "This product is order and its status is $order->status ");
                                    } else {
                                        $product->update([
                                            'delete_status' => 'Yes'
                                        ]);
                                        return redirect()->route(
                                            'Show_one subcategory',
                                            [
                                                'category_id' => encrypt($category->id),
                                                'subcategory_id' => encrypt($subcat->id)
                                            ]
                                        )->with('error', "This product is present in a order and will be deleted within one week");
                                    }
                                }
                                if ($productCS->image != null) {
                                    Storage::delete($productCS->image);
                                }
                                $productCS->delete();
                                $is_size_agian = ProductColorSize::where('product_size_id', $productSize_id)->first();
                                $is_color_agian = ProductColorSize::where('product_color_id', $productColor_id)->first();
                                if (!$is_color_agian && !$is_size_agian) {
                                    $size->delete();
                                    $color->delete();
                                } elseif (!$is_color_agian) {
                                    $color->delete();
                                } elseif (!$is_size_agian) {
                                    $size->delete();
                                }
                                return redirect()->route(
                                    'Show_one product',
                                    ['category_id' => $category->id, 'subcategory_id' => encrypt($subcat->id), 'product_id' => encrypt($product->id)]
                                )->with('success', 'ProductColorSize Deleted Successfully');
                            } else {
                                return redirect()->back()->with("error", "This Product Color Size is not exist");
                            }
                        } else {
                            return redirect()->back()->with("error", "This product is not available in the specified color and size");
                        }
                    } else {
                        return redirect()->back()->with("error", "This Product is not exist");
                    }
                } else {
                    return redirect()->back()->with("error", "This SubCategory is not exist");
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function editProductForm($category_id, $subcategory_id, $product_id)
    {
        $category = Category::where('id', $category_id)->first();
        if ($category) {
            $subcategory = SubCategory::where('id', $subcategory_id)->where('category_id', $category_id)->first();
            if ($subcategory) {
                $product = Product::where('id', decrypt($product_id))->where('sub_category_id', $subcategory->id)->first();
                if ($product) {
                    $color = $product->productColor->first()->color;
                    $size = $product->productSize->first()->size;
                    $color_data = $product->productColor->first();
                    foreach ($color_data->colorSize as $pQuantity) {
                        $quantity = $pQuantity->pivot->quantity;
                    }
                    return view(
                        'Dashboard.Forms.edit_Products',
                        compact('category', 'subcategory', 'product', 'color', 'size', 'quantity')
                    );
                } else {
                    return redirect()->back()->with("error", "This Product is not exist");
                }
            } else {
                return redirect()->back()->with("error", "This SubCategory is not exist");
            }
        } else {
            return redirect()->route('dash')->with("error", "This Category is not exist");
        }
    }
    public function editProductHandle($category_id, $subcategory_id, $product_id, EditMainProduct $request)
    {
        $is_admin = Auth::user();
        if ($is_admin) {
            $admin = User::where('user_type', '0')->where('email', $is_admin->email)->first();
            if ($admin) {
                $category = Category::where('id', $category_id)->first();
                if ($category) {
                    $subcategory = SubCategory::where('id', $subcategory_id)->where('category_id', $category->id)->first();
                    if ($subcategory) {
                        $is_product_exist = Product::where("product_code", $request->product_code)->where('id', decrypt($product_id))->first();
                        if ($is_product_exist) {
                            $file_path = $category->name . "/" . $subcategory->name . " Products";
                            if ($request->hasFile("image")) {
                                if ($is_product_exist->image != null) {
                                    Storage::delete($is_product_exist->image);
                                    $product_image = Storage::putFile($file_path, $request->image);
                                }
                            } elseif ($request->image == null) {
                                $product_image = $is_product_exist->image;
                            }
                            $is_product_exist->update([
                                "name" => $request->name,
                                "image" => $product_image,
                                "main_price" => $request->main_price,
                                "main_discount" => $request->main_discount,
                                "product_code" => $request->product_code,
                                "status" => $request->status,
                                "sub_category_id" => $subcategory->id,
                            ]);
                            $is_product_exist->productColor->first()->update([
                                "color" => $request->color,
                                "product_id" => $is_product_exist->id,
                            ]);
                            $is_product_exist->productSize->first()->update([
                                "size" => $request->size,
                                "product_id" => $is_product_exist->id,
                            ]);
                            $color = $is_product_exist->productColor->first()->id;
                            $size = $is_product_exist->productSize->first()->id;
                            $is_product_exist->productColor->first()->colorSize()->update([
                                "quantity" => $request->quantity,
                                "image" => $product_image,
                                "product_color_id" => $color,
                                "product_size_id" => $size,
                            ]);
                            return redirect()
                                ->route('Show_one product', ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)])
                                ->with('success', 'The Product Updated Successfully');
                        } else {
                            return redirect()
                                ->route(
                                    'Show_one subcategory',
                                    [
                                        'category_id' => encrypt($category->id),
                                        'subcategory_id' => encrypt($subcategory->id)
                                    ]
                                )
                                ->with('error', 'This Product is not Exist');
                        }
                    } else {
                        return redirect()->back()->with("error", "This SubCategory is not exist");
                    }
                } else {
                    return redirect()->route('dash')->with("error", "This Category is not exist");
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function editProductCSForm($category_id, $subcategory_id, $product_id, $productColor_id, $productSize_id, $productCS_id)
    {
        $category = Category::where('id', $category_id)->first();
        if ($category) {
            $subcategory = SubCategory::where('id', $subcategory_id)->where('category_id', $category_id)->first();
            if ($subcategory) {
                $product = Product::where('id', decrypt($product_id))->where('sub_category_id', $subcategory->id)->first();
                if ($product) {
                    $color = ProductColor::where('id', $productColor_id)->where('product_id', $product->id)->first();
                    $size = ProductSize::where('id', $productSize_id)->where('product_id', $product->id)->first();
                    $is_productCS_exist = ProductColorSize::where('id', $productCS_id)
                        ->where("product_size_id", $size->id)
                        ->where("product_color_id", $color->id)->first();
                    if ($is_productCS_exist) {
                        return view('Dashboard.Forms.edit_color_size', compact('category', 'subcategory', 'product', 'color', 'size', 'is_productCS_exist'));
                    } else {
                        return redirect()->back()->with("error", "This product is not available in the specified color and size.");
                    }
                } else {
                    return redirect()->back()->with("error", "This Product is not exist");
                }
            } else {
                return redirect()->back()->with("error", "This SubCategory is not exist");
            }
        } else {
            return redirect()->route('dash')->with("error", "This Category is not exist");
        }
    }
    public function editProductCSHandle($category_id, $subcategory_id, $product_id, $productColor_id, $productSize_id, $productCS_id, EditProductCS $request)
    {
        $is_admin = Auth::user();
        if ($is_admin) {
            $admin = User::where('user_type', '0')->where('email', $is_admin->email)->first();
            if ($admin) {
                $category = Category::where('id', $category_id)->first();
                if ($category) {
                    $subcategory = SubCategory::where('id', $subcategory_id)->where('category_id', $category->id)->first();
                    if ($subcategory) {
                        $is_product_exist = Product::where("product_code", $request->product_code)->where('id', decrypt($product_id))->first();
                        if ($is_product_exist) {
                            $color = ProductColor::where('id', $productColor_id)->where('product_id', $is_product_exist->id)->first();
                            $size = ProductSize::where('id', $productSize_id)->where('product_id', $is_product_exist->id)->first();
                            $is_productCS_exist = ProductColorSize::where('id', $productCS_id)
                                ->where("product_size_id", $size->id)
                                ->where("product_color_id", $color->id)->first();
                            if ($is_productCS_exist) {
                                $file_path = $category->name . "/" . $subcategory->name . " Products";
                                if ($request->hasFile("image")) {
                                    if ($is_productCS_exist->image != null) {
                                        Storage::delete($is_productCS_exist->image);
                                        $productCS_image = Storage::putFile($file_path, $request->image);
                                    }
                                } elseif ($request->image == null) {
                                    $productCS_image = $is_productCS_exist->image;
                                }
                                $color->update([
                                    "color" => $request->color,
                                ]);
                                $size->update([
                                    "size" => $request->size,
                                ]);
                                $is_productCS_exist->update([
                                    "quantity" => $request->quantity,
                                    "image" => $productCS_image,
                                ]);
                                return redirect()
                                    ->route('Show_one product', ['category_id' => $category->id, 'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)])
                                    ->with('success', 'The ProductColorSize Updated Successfully');
                            } else {
                                return redirect()
                                    ->route('Show_one product', [
                                        'category_id' => $category->id,
                                        'subcategory_id' => encrypt($subcategory->id), 'product_id' => encrypt($is_product_exist->id)
                                    ])
                                    ->with("error", "This product is not available in the specified color and size.");
                            }
                        } else {
                            return redirect()->back()
                                ->with('error', 'This Product is not Exist');
                        }
                    } else {
                        return redirect()->back()->with("error", "This SubCategory is not exist");
                    }
                } else {
                    return redirect()->route('dash')->with("error", "This Category is not exist");
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function logout()
    {
        $user = Auth::user();
        Auth::logout();
        return redirect()->route('adminlogin');
    }
    public function adminSearch(Request $request)
    {
        $query = $request->input('query');
        $product = Product::where('name', 'LIKE', '%' . str_replace(' ', '%', $query) . '%')->first();
        if ($product) {
            $subcategory = Subcategory::where('id', $product->sub_category_id)->first();
            if ($subcategory) {
                $category = Category::where('id', $subcategory->category_id)->first();
                if ($category) {
                    return view('Dashboard.Show All.one_product', compact('category', 'subcategory', 'product'));
                } else {
                    return redirect()->back()->with('error', "Something's going Wrong");
                }
            } else {
                return redirect()->back()->with('error', "Something's going Wrong");
            }
        } else {
            return redirect()->back()->with('error', "Not Found This Product");
        }
    }
    public function adminOrderHistory()
    {
        $orders = Order::orderBy('created_at', 'desc')->paginate(10);
        return view('Dashboard.Show All.all_orders', compact('orders'));
    }
    public function adminOneOrder($order_id)
    {
        $admin = Auth::user();
        if ($admin) {
            if ($admin->user_type == 0) {
                $orders = Order::count();
                $oneOrder = Order::where('id', $order_id)->first();
                return view('Dashboard.Show All.one_order', compact('oneOrder', 'orders'));
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function adminEditOrder($order_id)
    {
        $orders = Order::count();
        $one_order = Order::where('id', $order_id)->first();
        return view('Dashboard.Forms.edit_order', compact('orders', 'one_order'));
    }
    public function adminEditOrderHandle(EditOrderRequest $request, $order_id)
    {
        $admin = Auth::user();
        if ($admin) {
            if ($admin->user_type == 0) {
                $order = Order::find($order_id);
                if ($order) {
                    $sub_total = $order->sub_total;
                    $discount = $request->discount;
                    $tax = $request->tax;
                    $shipping = $request->shipping;
                    $discount_total = $sub_total - ($sub_total * ($discount / 100));
                    // $tax_total = $sub_total * $tax;
                    $total = $shipping + $tax + $discount_total;
                    $order->update([
                        'discount' => $discount,
                        'tax' => $tax,
                        'shipping' => $shipping,
                        'total' => $total,
                        'status' => $request->status,
                    ]);
                    return redirect()->route('admin_oneorder', ['order_id' => $order->id])->with('success', 'Order Details are updated Successfully');
                } else {
                    return redirect()->back()->with('error', 'This no order Like this here');
                }
            } else {
                abort(404);
            }
        } else {
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    // public function admindelete()
    // {
    //     // $thresholdDate = now()->subDays(1);->whereDate('updated_at', '=', $thresholdDate)
    //     $products = Product::where('delete_status', 'Yes')->get();
    //     if ($products) {
    //         foreach ($products as $product) {
    //             $product_review = $product->productReview;
    //             $product_wishlist = $product->productWishlist;
    //             foreach ($product->productColor as $color) {
    //                 foreach ($color->colorSize as $productCS) {
    //                     $product_cartitems = CartItem::where('product_color_size_id', $productCS->pivot->id)->get();
    //                     $product_orderdetails = OrderDetail::where('product_color_size_id', $productCS->pivot->id)->get();
    //                     if($product_cartitems){
    //                         foreach($product_cartitems as $procart){
    //                             $procart->delete();
    //                         }
    //                     }
    //                     if($product_orderdetails){
    //                         foreach($product_orderdetails as $proorderdetail){
    //                             $proorderdetail->delete();
    //                         }
    //                     }
    //                     if ($productCS->pivot->image != null) {
    //                         Storage::delete($productCS->pivot->image);
    //                     }
    //                     $productCS->pivot->delete();
    //                 }
    //                 $color->delete();
    //             }
    //             foreach ($product->productSize as $size) {
    //                 $size->delete();
    //             }
    //             if ($product_review) {
    //                 foreach ($product_review as $proreview) {
    //                     $proreview->delete();
    //                 }
    //             }
    //             if ($product_wishlist) {
    //                 foreach ($product_wishlist as $prowishlist) {
    //                     $prowishlist->pivot->delete();
    //                 }
    //             }
    //             if ($product->image != null) {
    //                 Storage::delete($product->image);
    //             }
    //             $product->delete();
    //         }
    //     } else {
    //         print('There are no products where the delete_status has been updated to Yes');
    //     }
    // }
}