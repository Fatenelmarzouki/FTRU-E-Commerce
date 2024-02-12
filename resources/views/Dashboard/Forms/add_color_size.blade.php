@extends('Dashboard.Admin Layout.layout')
@section('title')
    Add New Color Size
@endsection
@section('content')
        <section class="form">
            <h1>ADD NEW COLOR & SIZE FOR PRODUCT</h1>
            <form action="{{ route('handel add new CS to product',['category_id'=>$category->id,'subcategory_id'=>encrypt($subcategory->id),'product_id'=>encrypt($product->id)]) }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="label_inputs">
                    <div class="right">
                        <label for="">PRODUCT CODE</label>
                        <input name="product_code" class="input" type="text" value="{{ $product->product_code }}">
                        @error('product_code')
                            {{ $message }}
                        @enderror
                        <div class="main_PQ">
                            <div>
                                <label for="">QUANTITY</label>
                                <input name="quantity" class="main_input" type="text" >
                                @error('quantity')
                                    {{ $message }}
                                @enderror
                            </div>
                            <div>
                                <label for="">SIZE</label>
                                <select name="size" class="main_input">
                                <option value="ONE SIZE" >ONE SIZE</option>
                                <option value="S">S</option>
                                <option value="M ">M</option>
                                <option value="L" >L</option>
                                <option value="XL" >XL</option>
                                <option value="XXL" >XXL</option>
                                <option value="XXXL" >XXXL</option>
                                <option value="NO SIZE" >NO SIZE</option>
                            </select>
                            @error('size')
                            {{ $message }}
                            @enderror
                            </div>
                            <div class="color_carry">
                                <label for="">COLOR</label>
                                <input name="color" class="color_input" type="color" value="#3F4045">
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
