<?php

use App\Http\Controllers\ApiController;
use App\Http\Controllers\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('insertcategory', [ApiController::class, 'insertCategory']);
Route::post('insertcountry', [ApiController::class, 'insertCountry']);
Route::post("insert_subcate", [ApiController::class, "insertSubcategory"]);
Route::post("insert_product", [ApiController::class, "insertProduct"]);
Route::post("insert_color/{cat_id}/{subcat_id}/{pro_id}", [ApiController::class, "insertcolor"]);

Route::get('update/{id}',[ApiController::class, 'updateMakeup']);
//for search
Route::get('productname',[ProductController::class, 'productSearchApi']);