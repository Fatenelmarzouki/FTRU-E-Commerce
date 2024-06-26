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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->decimal('main_price',8,2);
            $table->integer('main_discount');
            $table->string('product_code');
            $table->string('image',255)->nullable();
            $table->enum('status', ['show', 'hide'])->default('show');
            $table->enum('delete_status', ['Yes', 'No'])->default('No');
            $table->unsignedBigInteger('sub_category_id');
            $table->foreign('subcategory_id')->references('id')->on('sub_categories');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};