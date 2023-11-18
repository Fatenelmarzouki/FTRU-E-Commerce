<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Product;
use App\Models\Category;
use App\Models\ProductSize;
use App\Models\SubCategory;
use Illuminate\Support\Str;
use App\Models\ProductColor;
use Illuminate\Http\Request;
use App\Models\ProductColorSize;
use Illuminate\Support\Facades\Storage;

class ApiController extends Controller
{
    public function insertCategory(Request $request) {
        Category::create([
            'name'=>$request->name,
        ]);
        return response()->json([
            'msg'=>'data inserted successfuly'
        ]);
    }
    public function insertCountry(Request $request) {
        Country::create([
            'name'=>$request->name,
        ]);
        return response()->json([
            'msg'=>'data inserted successfuly'
        ]);
    }
    public function insertSubcategory(Request $request){
        $subcate = SubCategory::create([
            "name"=>$request->name,
            "category_id"=>$request->category_id,
        ]);
        return response()->json([
            "data"=>$subcate
        ]);
    }
    public function insertProduct(Request $request)
    {
        $product_image=Storage::putFile('Bags Product',$request->image);
        $product_code=Str::random(6);
        $product = Product::create([
            "name"=>$request->name,
            "image"=> $product_image,
            "description"=>$request->description,
            "main_price"=>$request->main_price,
            "main_discount"=>$request->main_discount,
            "product_code"=>$product_code,
            "status"=>'show',
            "sub_category_id"=>$request->sub_category_id,
        ]);
        $color = ProductColor::create([
            "color"=>$request->color,
            "product_id"=>$product->id,
        ]);
        $size = ProductSize::create([
            // "size" => $request->size,
            "product_id" => $product->id,
        ]);
        $product_color_size = ProductColorSize::create([
            "quantity"=>$request->quantity,
            "image"=> $product_image,
            "product_color_id" => $color->id,
            "product_size_id"=>$size->id,
        ]);
        return response()->json([
            "name" => $product->name,
            "main_price" => $product->main_price,
            "main_discount" => $product->main_discount,
            "image" => $product->image,
            "subcategory_id" => $product->sub_category_id,
            "quantity" => $product_color_size->quantity,
            "color" => $color->color,
            "size" => $size->size,
        ]);
    }
    // public function updatemakeup($id){
    //     $category=Category::find($id);
    //     if ($category->name='MAKEUP') {
    //         $subcategory = $category->categorySubcategory()->get();
    //         $product= $subcategory->subcategoryProduct()->get();
    //         foreach ($subcategory->productSubcategory as $val) {
    //             dd($val);
    //         }
    //     }
    // }
    public function updateMakeup($id)
    {
        $cate = Category::find($id);
        $subcate = $cate->categorySubcategory;
        $product_size = [];
        foreach ($subcate as $key) {
            $products = $key->subcategoryProduct;
            foreach ($products as $value) {
                $product_size[] = $value->productSize()->update([
                    "size" => "NO SIZE"
                ]);
            }
        }
        return response()->json([
                "pro" => $product_size
            ]);
    }
    public function insertcolor(Request $request,$cat_id,$subcat_id,$pro_id){
        $cat=Category::find($cat_id);
        $sub=SubCategory::where('id', $subcat_id)->where('category_id',$cat->id)->first();
        $pro=Product::where('id',$pro_id)->where('sub_category_id', $sub->id)->first();
        $product_image = Storage::putFile('Woman Product', $request->image);
        $color=ProductColor::create([
            "color" => $request->color,
            "product_id" => $pro->id,
        ]);
        $size = ProductSize::create([
            "size" => $request->size,
            "product_id" => $pro->id,
        ]);
        $product_color_size = ProductColorSize::create([
            "quantity" => $request->quantity,
            "image" => $product_image,
            "product_color_id" => $color->id,
            "product_size_id" => $size->id,
        ]);
        return response()->json([
            "data" => $product_color_size->image
        ]);
    }
}