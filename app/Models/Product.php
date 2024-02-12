<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'name',
        'main_price',
        'main_discount',
        'product_code',
        'image',
        'status',
        'delete_status',
        'sub_category_id',
        'created_at',
        'updated_at'
    ];
    public function productSubcategory()
    {
        return $this->belongsTo(SubCategory::class);
    }
    public function productColor()
    {
        return $this->hasMany(ProductColor::class);
    }
    public function productSize()
    {
        return $this->hasMany(ProductSize::class);
    }
    public function productWishlist()
    {
        return $this->belongsToMany(User::class, 'wishlists', 'product_id', 'user_id')->withPivot('id','user_id', 'product_id');
    }
    public function productReview()
    {
        return $this->hasMany(Review::class,'product_id','id');
    }
}