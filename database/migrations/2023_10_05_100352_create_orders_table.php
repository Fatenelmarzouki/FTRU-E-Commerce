<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string("order_code");
            $table->string("email");
            $table->string("phone");
            $table->decimal('sub_total', 8, 2);
            $table->integer('discount');
            $table->integer('tax');
            $table->decimal('shipping',8,2);
            $table->decimal('total', 8, 2);
            $table->integer('quantity');
            $table->enum("status", ['Pending', 'Processing', 'Shipped', 'Delivered'])->default("Pending");
            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->unsignedBigInteger('address_id');
            $table->foreign('address_id')->references('id')->on('addresses');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};