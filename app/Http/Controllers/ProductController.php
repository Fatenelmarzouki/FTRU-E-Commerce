<?php

namespace App\Http\Controllers;

use App\Models\Review;
use App\Models\Product;
use App\Models\Category;
use App\Models\SubCategory;
use Illuminate\Http\Request;
use App\Http\Requests\RatingRequest;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function showCate($cate_name)
    {
                $category = Category::with("categorySubcategory")->where("name", $cate_name)->first();
                if($category){
                    return view('pages.All Products.allproducts', compact('category'));
                }else{
                    return redirect()->route('Error')->with('error','Wrong Route');
                }
    }
    public function showProduct($category_name, $subcategory_name, $product_id){
        $category=Category::where("name", $category_name)->first();
        if ($category) {
            $subcategory=SubCategory::where('category_id',$category->id)->where('name',$subcategory_name)->first();
            if ($subcategory) {
                $product=Product::where('sub_category_id', $subcategory->id)->where('id', $product_id)->first();
                if ($product) {
                    return view('pages.One Product.one_product',compact('product'));
                }else{
                    return redirect()->route('Error');
                }
            }else{
                return redirect()->route('Error');
            }
        }else{
            return redirect()->route('Error');
        }
    }
    public function showSubCategory($category_name, $subcategory_name){
        $category = Category::where("name", $category_name)->first();
        if ($category) {
            $subcategory = SubCategory::where('category_id', $category->id)->where('name', $subcategory_name)->first();
            if ($subcategory) {
                    return view('pages.All Products.Subcate_products',compact('subcategory', 'category'));
            }else{
                return redirect()->route('Error');
            }
        }else{
            return redirect()->route('Error');
        }
    }
    public function search(Request $request)
    {
        $query = $request->input('query');

        $products = Product::where('name', 'like', "%$query%")->get();

        return view('pages.All Products.search', compact('products'));
    }
    public function showSearchProduct($product_id){
        $product=Product::findOrFail(decrypt($product_id));
        if ($product) {
            return view('pages.One Product.one_product',compact('product'));
        }else{
            return redirect()->route('Error');
        }
    }
    public function rateProduct(RatingRequest $request){
        $user=Auth::user();
        if($user){
            $product = Product::findOrFail(decrypt($request->product_id));
            if($product){
                    $rate=Review::updateOrCreate(
                    [
                        'user_id' => $user->id,
                        'product_id' => $product->id
                    ],
                    [
                        'rating_value'=>$request->rating_value,
                        'comment'=>$request->comment,
                        'user_id' => $user->id,
                        'product_id' => $product->id
                    ]);
                    return redirect()->back()->with('success', "Thank you");
            }else{
                return redirect()->back()->with('error', 'Something is wrong please try again');
            }
        }else{
            return redirect()->route('Login')->with('error', 'You Must Login First');
        }

    }
}