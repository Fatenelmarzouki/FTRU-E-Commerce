<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductColorSize extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'product_size_id',
        'product_color_id',
        'quantity',
        'image',
        'created_at',
        'updated_at'
    ];
    public function productcolorsizeCartItem()
    {
        return $this->belongsTo(CartItem::class, 'product_color_size_id','id');
    }
    public function productcolorsizeOrder()
    {
        return $this->belongsToMany(Order::class, 'order_details','product_color_size_id', 'order_id')
        ->withPivot('order_id', 'product_color_size_id');
    }
    public function ProCSProColor()
    {
        return $this->belongsTo(ProductColor::class, 'product_color_id', 'id');
    }
    public function ProCSProSize()
    {
        return $this->belongsTo(ProductSize::class, 'product_size_id', 'id');
    }
}
