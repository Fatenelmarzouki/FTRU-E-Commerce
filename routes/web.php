<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CartController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\RedirectController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\OrderController;


//Register
Route::get('FTRU/Register', [RedirectController::class, 'registerForm'])->name('Register');
Route::post('FTRU/Home/Register', [UserController::class, 'handleRegister'])->name('handle_register');
//Verfied the account
Route::get('FTRU/OTP', [RedirectController::class, 'otpForm'])->name('otp');
Route::post("FTRU/OTP", [UserController::class, "handleOTP"])->name("verfiy handle");
Route::get('FTRU/resend the OTP', [UserController::class, 'resendOTP'])->name('resend otp');
//Login
Route::get('FTRU/Login', [RedirectController::class, 'loginForm'])->name('Login');
Route::post('FTRU/Home/Login', [UserController::class, 'handleLogin'])->name('login handle');
//Search
Route::get('/search', [ProductController::class, 'search'])->name('search');
//Result of search
Route::get('/show product from search/{product_id}', [ProductController::class, 'showSearchProduct'])->name('show product of search');
//Forget password
Route::post('FTRU/Login/Forget Password', [UserController::class, 'forgetPasswordHandle'])->name('Forget password handle');
Route::get('FTRU/Login/Reset your Password/{token}', [UserController::class, 'resetPassword'])->name('Reset password');
Route::post("FTRU/Login/Reset your Password", [UserController::class, "resetPasswordHandle"])->name("Reset password handle");
//Home
Route::get('FTRU/Home', [RedirectController::class, 'Index'])->name('Home');
Route::get('FTRU/Home/{category_name}', [ProductController::class, 'showCate'])->name('show category');
Route::get('FTRU/Home/{category_name}/{subcategory_name}/{product_id}', [ProductController::class, 'showProduct'])->name('show one product');
Route::get('FTRU/Home/{category_name}/{subcategory_name}', [ProductController::class, 'showSubCategory'])->name('show one subcategory');
Route::get('FTRU/Login/Forget Password', [RedirectController::class, 'forgetPasseordForm'])->name('Forget password');


// Route::get('delete', [AdminController::class, 'admindelete']);


Route::middleware(['auth','user_verify'])->group(function () {
    Route::get('FTRU/Profile/Order History', [RedirectController::class, 'orderHistory'])->name('order history');
    //all order
    Route::get('FTRU/Profile/Your Cart/all Order', [OrderController::class, 'allOrders'])->name('all orders');
    Route::post('FTRU/Profile/Your Cart/all Order', [OrderController::class, 'allOrdersHandle'])->name('order handle');
    //one order
    Route::get('FTRU/Profile/Your Cart/Order/{cartItem_id}/{productcs_id}', [OrderController::class, 'oneOrder'])->name('one orders');
    Route::post('FTRU/Profile/Your Cart/Order/{cartItem_id}/{productcs_id}', [OrderController::class, 'oneOrderHandle'])->name('one order handle');
    //order details
    Route::get('FTRU/Order/{order_id}', [OrderController::class, 'showOrderDetails'])->name('order details');
    //payment page
    Route::get('FTRU/payment/{order_id}', [OrderController::class, 'payment'])->name('developed_payment');
    //Cart
    Route::post('FTRU/add to cart', [CartController::class, 'addToCart'])->name('add to cart');
    Route::get('FTRU/User Profile/Your Cart', [CartController::class, 'userCart'])->name('cart');
    Route::delete('FTRU/User Profile/Your Cart/delete/{cartitem_id}', [CartController::class, 'deleteCart'])->name('remove from cart');
    Route::delete('FTRU/User Profile/Your Cart/delete all from cart', [CartController::class, 'deleteAllFromCart'])->name('remove all from cart');
    Route::get('FTRU/User Profile/Edit cart/{cartitem_id}/{product_id}', [CartController::class, 'editCart'])->name('edit cart');
    Route::put('FTRU/User Profile/Edit cart/{cartitem_id}', [CartController::class, 'editCartHandle'])->name('handle edit cart');
    //Wishlist
    Route::post('FTRU/add to wishlist', [WishlistController::class, 'addToWishlist'])->name('add to wishlist');
    Route::get('FTRU/User Profile/add all products from wishlist to cart', [WishlistController::class, 'addAllToCartFromWishlist'])->name('move all to cart');
    Route::post('FTRU/move wishlist to cart', [WishlistController::class, 'moveToCart'])->name('move to cart');
    Route::get('FTRU/User Profile/Your wishlist', [WishlistController::class, 'userWishlist'])->name('wishlist');
    Route::delete('FTRU/User Profile/Your wishlist/delete/{wishlist_id}', [WishlistController::class, 'deleteWishlist'])->name('remove from wishlist');
    Route::delete('FTRU/User Profile/Your wishlist/delete all from wishlist', [WishlistController::class, 'deleteAllFromWishlist'])->name('remove all from wishlist');
    //Edit Profile
    Route::get('FTRU/User Profile', [UserController::class, 'showProfile'])->name('profile info');
    Route::get('FTRU/User Profile/edit presonal information', [UserController::class, 'editPersonalInfo'])->name('edit personal info');
    Route::put('FTRU/User Profile/edit presonal information', [UserController::class, 'handleEditPersonalInfo'])->name('handle edit personal info');
    Route::get('FTRU/User Profile/Change Password', [RedirectController::class, 'changePasseordForm'])->name('Change password');
    Route::put("FTRU/User Profile/Change password", [UserController::class, 'changePasswordHandle'])->name('change_password_handle');
    //rate the product
    Route::post('FTRU/Rateing product', [ProductController::class, 'rateProduct'])->name('rate the product');
    //Logout
    Route::get('FTRU/logout', [UserController::class, 'logout'])->name('logout');
});



//Wrong route
Route::get('FTRU/Error', [RedirectController::class, 'Error'])->name('Error');
Route::fallback(function () {
    return redirect()->route('Error')->with("error","Oops! It seems like you've reached an incorrect destination");
});

//login for admin
Route::get("Login to Dashboard", [AdminController::class, "loginForm"])->name('adminlogin');
Route::post("adminLogin", [AdminController::class, "handleAdminLogin"])->name('handle admin login');

Route::middleware(['dashboard'])->group(function () {
    //search
    Route::get('/searchforadmin', [AdminController::class, 'adminSearch'])->name('admin_search');
    //admin order history
    Route::get('Order', [AdminController::class, 'adminOrderHistory'])->name('admin_orderhistory');
    //show one order
    Route::get('Order/One Order/{order_id}', [AdminController::class, 'adminOneOrder'])->name('admin_oneorder');
    //edit order details
    Route::get('Order/Edit Order/{order_id}', [AdminController::class, 'adminEditOrder'])->name('admin_editorderform');
    Route::put('Order/Edit Order handle/{order_id}', [AdminController::class, 'adminEditOrderHandle'])->name('editorderformhandle');
    //dashboard
    Route::get("Dashboard", [AdminController::class, "dashboard"])->name('dash');
    //add category
    Route::get("Category/Add Category", [AdminController::class, "categoryForm"])->name('add category');
    Route::post("add category handle", [AdminController::class, "addCategoryHandle"])->name('handle add category');
    //add sub category
    Route::get("Category/Add SubCategory", [AdminController::class, "subcategoryForm"])->name('add subcategory');
    Route::post("add subcategory handle", [AdminController::class, "addSubcategoryHandle"])->name('handle add subcategory');
    //show all category
    Route::get("Category/Show all Category", [AdminController::class, "allCategory"])->name('show all category');
    //show one categorty
    Route::get("Category/Show all Category/One Category/{category_id}", [AdminController::class, "oneCategory"])->name("Show_one category");
    //show one subcategory
    Route::get("Category/Show all Category/One subCategory/{category_id}/{subcategory_id}", [AdminController::class, "oneSubCategory"])->name("Show_one subcategory");
    //add product
    Route::get('Category/add a new product/{category_id}/{subcategory_id}', [AdminController::class, 'productForm'])->name('Add new product');
    Route::post("add a new product handle/{category_id}/{subcategory_id}", [AdminController::class, "productFormHandle"])->name('handle add product');
    //one product
    Route::get('Category/One Product/{category_id}/{subcategory_id}/{product_id}', [AdminController::class, 'oneProduct'])->name('Show_one product');
    //add color size form
    Route::get('Category/add a new color & size product/{category_id}/{subcategory_id}/{product_id}', [AdminController::class, 'productCSForm'])->name('Add new CS to product');
    Route::post('add a new color & size product handle/{category_id}/{subcategory_id}/{product_id}', [AdminController::class, 'productCSHandle'])->name('handel add new CS to product');
    //all customers
    Route::get('Customers', [AdminController::class, 'allCustomer'])->name('all customers');
    //logout
    Route::get('Logout', [AdminController::class, 'logout'])->name('adminlogout');
    //delete product color size
    Route::delete('Category/remove product color size/{category_id}/{subcategory_id}/{product_id}/{productColor_id}/{productSize_id}/{productCS_id}', [AdminController::class, 'deleteProductCS'])->name('remove product color size');
    //delete one product
    Route::delete('deleteProduct/{category_id}/{subcategory_id}/{product_id}', [AdminController::class, 'deleteOneProduct'])->name('deleteProduct');
    //Edit product
    Route::get('Category/Edit Product/{category_id}/{subcategory_id}/{product_id}', [AdminController::class, 'editProductForm'])->name('admin_edit product');
    Route::put('Category/Edit Product handle/{category_id}/{subcategory_id}/{product_id}', [AdminController::class, 'editProductHandle'])->name('admin_edit product handle');
    //Edit ProductCS
    Route::get('Category/Edit ProductColorSize/{category_id}/{subcategory_id}/{product_id}/{productColor_id}/{productSize_id}/{productCS_id}', [AdminController::class, 'editProductCSForm'])->name('admin_edit productCS');
    Route::put('Category/Edit ProductColorSize handle/{category_id}/{subcategory_id}/{product_id}/{productColor_id}/{productSize_id}/{productCS_id}', [AdminController::class, 'editProductCSHandle'])->name('admin_edit productCS handle');
});
