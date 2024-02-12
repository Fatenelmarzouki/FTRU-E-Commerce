@extends('Dashboard.Admin Layout.layout')
@section('title')
    Edit New Color Size
@endsection
@section('content')
        <section class="form">
            <h1>ADD NEW COLOR & SIZE FOR PRODUCT</h1>
            <form action="{{
            route('admin_edit productCS handle',
            ['category_id'=>$category->id,
            'subcategory_id'=>$subcategory->id,
            'product_id'=>encrypt($product->id),
            'productColor_id'=>$color->id ,
            'productSize_id'=>$size->id,
            'productCS_id'=>$is_productCS_exist->id ])
            }}"
                method="POST"
                enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="label_inputs">
                    <div class="right">
                        <label for="">PRODUCT CODE</label>
                        <input name="product_code" class="input" type="text" readonly value="{{ $product->product_code }}">
                        @error('product_code')
                            {{ $message }}
                        @enderror
                        <div class="main_PQ">
                            <div>
                                <label for="">QUANTITY</label>
                                <input name="quantity" class="main_input" type="text" value="{{  $is_productCS_exist->quantity}}">
                                @error('quantity')
                                    {{ $message }}
                                @enderror
                            </div>
                            <div>
                            <label for="">SIZE</label>
                            <select name="size" class="main_input">
                                <option value="ONE SIZE" @if ($size->size == 'ONE SIZE') selected @endif >ONE SIZE</option>
                                <option value="S" @if ($size->size == 'S') selected @endif >S</option>
                                <option value="M" @if ($size->size == 'M') selected @endif>M</option>
                                <option value="L"  @if ($size->size == 'L') selected @endif>L</option>
                                <option value="XL"@if ($size->size == 'XL') selected @endif >XL</option>
                                <option value="XXL" @if ($size->size == 'XXL') selected @endif>XXL</option>
                                <option value="XXXL" @if ($size->size == 'XXXL') selected @endif>XXXL</option>
                                <option value="NO SIZE" @if ($size->size == 'NO SIZE') selected @endif>NO SIZE</option>
                            </select>
                            @error('size')
                            {{ $message }}
                            @enderror
                            </div>
                            <div class="color_carry">
                                <label for="">COLOR</label>
                            <input name="color" class="color_input" type="color" value="{{ $color->color }}">
                            @error('color')
                                {{ $message }}
                            @enderror
                            </div>
                        </div>
                    </div>
                    <div class="left">
                        <label for="">IMAGE</label>
                        <div class="input_image input_image_height_82">
                            <input name="image" type="file"/>
                        @error('image')
                            {{ $message }}
                        @enderror
                        </div>
                    </div>
                </div>
                <button class="submit" type="submit">SUBMIT</button>
            </form>
        </section>
@endsection
