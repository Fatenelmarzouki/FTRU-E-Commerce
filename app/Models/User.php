<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'id',
        'name',
        'email',
        'email_verified_at',
        'phone',
        'main_address',
        'image',
        'user_type',
        'gender',
        'password',
        'country_id',
        'provider_id',
        'provider_name',
        'provider_token',
        'remember_token',
        'created_at',
        'updated_at'
    ];
    //one(user) to many(address)
    public function userAddress(){
        return $this->hasMany(Address::class, 'user_id');
    }
    //one(user) to many(order)
    public function userOrder(){
        return $this->hasMany(Order::class, 'user_id','id');
    }
    //one(user) to many(review)
    public function userReview(){
        return $this->hasMany(Review::class, 'user_id');
    }
    //one(user) to one(cart)
    public function userCart(){
        return $this->hasOne(Cart::class, 'user_id');
    }
    //many(country) to one(user)
    public function userCountry(){
        return $this->belongsTo(Country::class, 'country_id');
    }
    public function userWishlist()
    {
        return $this->belongsToMany(Product::class, 'wishlists', "user_id", 'product_id')->withPivot('id', 'product_id', 'user_id');
    }
}