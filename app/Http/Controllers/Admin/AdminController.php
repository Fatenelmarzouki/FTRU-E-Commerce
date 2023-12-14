<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AddCategoryRequest;
use App\Http\Requests\Admin\AddSubCategoryRequest;
use App\Http\Requests\LoginRequest;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function dashboard()
    {
        return view('Dashboard.dashboard');
    }
    public function loginForm(){
        return view('Dashboard.Forms.login');
    }
    public function handleAdminLogin(LoginRequest $request){
        $is_login = Auth::attempt(["email" => $request->email, "password" => $request->password]);
        if ($is_login) {
            $user = User::where("email", $request->email)->where("user_type", "=", "0")->first();
            if ($user) {
                $admin = User::where("email", $request->email)->first();
                return redirect()->route('dash');
            } else {
                return redirect()->route('Error')->with(["error" => "you don't allow to access this page"]);
            }
        } else {
            return redirect()->back()->with(["error" => "Wrong credentials invalid email or password"]);
        }
    }
    public function categoryForm(){
        return view('Dashboard.Forms.add_category');
    }
    public function addCategoryHandle(AddCategoryRequest $request){
        $is_login=Auth::user();
        if($is_login){
            $admin=User::where('user_type','0')->where('email', $is_login->email)->first();
            if($admin){
                Category::create([
                    'name' => $request->name,
                ]);
                return redirect()->back()->with('success','Added Successfuly');
            }else{
                abort(404);
            }
        }else{
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function subcategoryForm(){
        $categories=Category::all();
        return view('Dashboard.Forms.add_Subcategory',compact('categories'));
    }
    public function addSubcategoryHandle(AddSubCategoryRequest $request){
        $is_login=Auth::user();
        if($is_login){
            $admin=User::where('user_type','0')->where('email', $is_login->email)->first();
            if($admin){
                $name=$request->name;
                $check=SubCategory::where('name', 'like', "%$name%")
                ->where('category_id',$request->category_id)
                ->first();
                if($check){
                    return redirect()->back()->with('error', "This's Subcategory already Exist");
                }else{
                    SubCategory::create([
                        'name' => $request->name,
                        'category_id' => $request->category_id,
                    ]);
                    return redirect()->back()->with('success','Added Successfuly');
                }
            }else{
                abort(404);
            }
        }else{
            return redirect()->route('adminlogin')->with('error', 'You Must Login First');
        }
    }
    public function allCategory(){
        return view('Dashboard.Show All.all_category');
    }
    public function oneCategory($id)
    {
        // $category = Category::find($id);
        $category = Category::where('id',$id)->first();
        if ($category) {
            return view('Dashboard.Show All.one_category', compact('category'));
        } else {
            return redirect()->route('Error')->with(["error", "not"]);
        }
    }
    public function oneSubCategory($id)
    {
        $subcategory = SubCategory::find($id);
        if ($subcategory) {
            return view('Dashboard.Show All.one_subcategory', compact('subcategory'));
        } else {
            return redirect()->route('error')->with(["error", "not"]);
        }
    }
}