@extends('Dashboard.Admin Layout.layout')
@section('title')
    Add Product
@endsection
@section('content')
        <section class="form">
            <h1>EDIT PRODUCT</h1>
            <form action="{{ route('admin_edit product handle',['category_id'=>$category->id,'subcategory_id'=>$subcategory->id,'product_id'=>encrypt($product->id)]) }}"
                method="POST"
                enctype="multipart/form-data">
                @method('PUT')
                @csrf
                <div class="label_inputs">
                <div class="right">
                    <label for="">NAME</label>
                    <input name="name" class="input" value="{{ $product->name }}" type="text">
                    @error('name')
                        {{ $message }}
                    @enderror
                    <label for="">PRODUCT CODE</label>
                    <input name="product_code" class="input" value="{{ $product->product_code }}" type="text">
                    @error('product_code')
                        {{ $message }}
                    @enderror
                    <div>
                        <label for="">MAIN PRICE</label>
                        <input name="main_price" class="input" value="{{ $product->main_price }}" type="text">
                        @error('main_price')
                            {{ $message }}
                        @enderror
                    </div>
                    <div class="main_PQ">
                        <div>
                            <label for="">QUANTITY</label>
                            <input name="quantity" class="main_input" value="{{ $quantity }}" type="text">
                            @error('quantity')
                                {{ $message }}
                            @enderror
                        </div>
                        <div class="sec">
                            <label for="">MAIN DISCOUNT</label>
                            <input name="main_discount" class="main_input" value="{{ $product->main_discount }}" type="text">
                            @error('main_discount')
                                {{ $message }}
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="left">
                    <label for="">IMAGE</label>
                    <div class="input_image">
                        <input name="image" type="file" accept="image/*"/>
                        @error('image')
                            {{ $message }}
                        @enderror
                    </div>
                    <div class="main_PQ">
                        <div>
                            <label for="">STATUS</label>
                            <select name="status" class="main_input">
                                <option value="show" @if ($product->status == 'show') selected @endif >SHOW</option>
                                <option value="hide" @if ($product->status == 'hide') selected @endif>HIDE</option>
                            </select>
                            @error('status')
                                {{ $message }}
                            @enderror
                        </div>
                        <div>
                            <label for="">SIZE</label>
                            <select name="size" class="main_input"> 
                                <option value="ONE SIZE" @if ($size == 'ONE SIZE') selected @endif >ONE SIZE</option>
                                <option value="S" @if ($size == 'S') selected @endif >S</option>
                                <option value="M" @if ($size == 'M') selected @endif>M</option>
                                <option value="L"  @if ($size == 'L') selected @endif>L</option>
                                <option value="XL"@if ($size == 'XL') selected @endif >XL</option>
                                <option value="XXL" @if ($size == 'XXL') selected @endif>XXL</option>
                                <option value="XXXL" @if ($size == 'XXXL') selected @endif>XXXL</option>
                                <option value="NO SIZE" @if ($size == 'NO SIZE') selected @endif>NO SIZE</option>
                            </select>
                            @error('size')
                            {{ $message }}
                            @enderror
                        </div>
                        <div class="color_carry">
                            <label for="">COLOR</label>
                            <input name="color" class="color_input" type="color" value="{{ $color }}">
                            @error('color')
                                {{ $message }}
                            @enderror
                        </div>
                    </div>

                </div>

            </div>
                <button class="submit" type="submit">SUBMIT</button>
            </form>
        </section>
@endsection
