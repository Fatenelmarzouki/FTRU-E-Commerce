<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Redirect;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\RedirectController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\Admin\AdminController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::get('FTRU/Home', [RedirectController::class, 'Index'])->name('Home');
Route::get('FTRU/Home/{category_name}', [ProductController::class, 'showCate'])->name('show category');
Route::get('FTRU/Home/{category_name}/{subcategory_name}/{product_id}', [ProductController::class, 'showProduct'])->name('show one product');
Route::get('FTRU/Home/{category_name}/{subcategory_name}', [ProductController::class, 'showSubCategory'])->name('show one subcategory');
Route::get('FTRU/Login/Forget Password', [RedirectController::class, 'forgetPasseordForm'])->name('Forget password');
Route::get('FTRU/Profile/Order History', [RedirectController::class, 'orderHistory'])->name('order history');
Route::get('FTRU/Home/Profile/Your Cart/Payment', [RedirectController::class, 'payment'])->name('payment');
//Cart
Route::post('FTRU/Home/add to cart', [CartController::class, 'addToCart'])->name('add to cart');
Route::get('FTRU/User Profile/Your Cart', [CartController::class, 'userCart'])->name('cart');
Route::delete('FTRU/User Profile/Your Cart/delete/{cartitem_id}', [CartController::class, 'deleteCart'])->name('remove from cart');
Route::get('FTRU/User Profile/Edit cart/{cartitem_id}/{product_id}', [CartController::class, 'editCart'])->name('edit cart');
Route::put('FTRU/User Profile/Edit cart/{cartitem_id}', [CartController::class, 'editCartHandle'])->name('handle edit cart');
//Wishlist
Route::post('FTRU/Home/add to wishlist', [WishlistController::class, 'addToWishlist'])->name('add to wishlist');
Route::get('FTRU/User Profile/add all products from wishlist to cart', [WishlistController::class, 'addAllToCartFromWishlist'])->name('move all to cart');
Route::post('FTRU/Home/move wishlist to cart', [WishlistController::class, 'moveToCart'])->name('move to cart');
Route::get('FTRU/User Profile/Your wishlist', [WishlistController::class, 'userWishlist'])->name('wishlist');
Route::delete('FTRU/User Profile/Your wishlist/delete/{wishlist_id}', [WishlistController::class, 'deleteWishlist'])->name('remove from wishlist');
//Edit Profile
Route::get('FTRU/User Profile', [UserController::class, 'showProfile'])->name('profile info');
Route::get('FTRU/User Profile/edit presonal information', [UserController::class, 'editPersonalInfo'])->name('edit personal info');
Route::put('FTRU/User Profile/edit presonal information', [UserController::class, 'handleEditPersonalInfo'])->name('handle edit personal info');
Route::get('FTRU/User Profile/Change Password', [RedirectController::class, 'changePasseordForm'])->name('Change password');
Route::put("FTRU/User Profile/Change password", [UserController::class, 'changePasswordHandle'])->name('change_password_handle');
//Register
Route::get('FTRU/Home/Register',[RedirectController::class, 'registerForm'])->name('Register');
Route::post('FTRU/Home/Register', [UserController::class, 'handleRegister'])->name('handle_register');
//Verfied the account
Route::get('FTRU/OTP', [RedirectController::class, 'otpForm'])->name('otp');
Route::post("FTRU/OTP", [UserController::class, "handleOTP"])->name("verfiy handle");
Route::get('FTRU/resend the OTP', [UserController::class, 'resendOTP'])->name('resend otp');
//Login
Route::get('FTRU/Home/Login',[RedirectController::class, 'loginForm'])->name('Login');
Route::post('FTRU/Home/Login',[UserController::class,'handleLogin'])->name('login handle');
//Logout
Route::get('FTRU/logout', [UserController::class,'logout'])->name('logout');
//Search
Route::get('/search', [ProductController::class, 'search'])->name('search');
//Result of search
Route::get('/show product from search/{product_id}', [ProductController::class, 'showSearchProduct'])->name('show product of search');
Route::post('FTRU/Rateing product', [ProductController::class, 'rateProduct'])->name('rate the product');
//Forget password
Route::post('FTRU/Login/Forget Password',[UserController::class, 'forgetPasswordHandle'])->name('Forget password handle');
Route::get('FTRU/Login/Reset your Password/{token}',[UserController::class, 'resetPassword'])->name('Reset password');
Route::post("FTRU/Login/Reset your Password", [UserController::class, "resetPasswordHandle"])->name("Reset password handle");
//Wrong route
Route::get('FTRU/Error', [RedirectController::class, 'Error'])->name('Error');
Route::fallback(function () {
    return redirect()->route('Error')->with("error","Oops! It seems like you've reached an incorrect destination");
});
//dashboard
Route::get("Dashboard", [AdminController::class, "dashboard"])->name('dash');
//login for admin
Route::get("Login to Dashboard", [AdminController::class, "loginForm"])->name('adminlogin');
Route::post("adminLogin", [AdminController::class, "handleAdminLogin"])->name('handle admin login');
//add category
Route::get("Dashboard/Add Category", [AdminController::class, "categoryForm"])->name('add category');
Route::post("add category handle", [AdminController::class, "addCategoryHandle"])->name('handle add category');
//add sub category
Route::get("Dashboard/Add SubCategory", [AdminController::class, "subcategoryForm"])->name('add subcategory');
Route::post("add subcategory handle", [AdminController::class, "addSubcategoryHandle"])->name('handle add subcategory');
//show all category
Route::get("Dashboard/Show all Category", [AdminController::class, "allCategory"])->name('show all category');
//one categorty
Route::get("Dashboard/Show all Category/One Categorie/{id}", [AdminController::class, "oneCategory"])->name("one catetegory");
Route::get("Dashboard/Show all Category/One subCategorie/{id}", [AdminController::class, "oneSubCategory"])->name("onesubcate");