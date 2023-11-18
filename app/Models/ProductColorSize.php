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
        return $this->belongsTo(CartItem::class);
    }
}