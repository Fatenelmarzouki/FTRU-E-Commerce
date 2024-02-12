@extends('pages.layout.layout')
@section('title',$product->name)
@section('content')
    <section class="one_product_bg">

    </section>

    <section class="product_info" >
        <div class="side_prod">
            <div class="side_imgs">
                @foreach ($product->productColor as $color)
                    @foreach ($color->colorSize as $item)
                        @php
                            $img = $item->pivot->image
                        @endphp
                        @if ($product->image != $img)
                        <div class="img_container">
                            <img src="{{asset("storage/$img")}}" alt="">
                        </div>
                        @endif
                    @endforeach
                @endforeach
                    </div>
                    <div class="the_product">
                        <img src="{{asset("storage/$product->image")}}" alt="">
                    </div>
                </div>
                <div class="text_info">
                    @include('pages.includes.session')
                    <div class="name_desc">
                        <h1 >{{$product->name}}</h1>
                    </div>
                    <div class="price_on_pro">
                        <h1>Price</h1>
                        @php
                            if($product->main_discount != null){
                                $price=$product->main_price - ($product->main_price *  ($product->main_discount/100));
                            }else{
                                $price = $product->main_price;
                            }
                        @endphp
                        <div class="price">
                            <p>{{$product->main_price . " $"}}</p>
                        </div>
                        <div class="price_disc">
                            <p>{{$price . " $"}}</p>
                        </div>
                    </div>
            {{-- Form --}}
            <form class="form_color_price" action="{{ route('add to cart') }}" method="POST">
                @csrf
                <input type="hidden" name="product_id" value="{{$product->id}}" >
                <div class="color_container">
                    <label for="color">Color</label>
                    @foreach ($product->productColor as $color)
                        @if ($color->color == "Multi")
                            <p>Multiple Color</p>
                            <input type="hidden" name="color" value="{{$color->color}}">
                        @else
                            <input type="radio" name="color" class="pick_one" value="{{$color->color}}" style="background-color: {{$color->color}}">
                        @endif
                    @endforeach
                </div>
                <div class="price_container">
                    <label for="price">Size</label>
                    @foreach ($product->productSize->sortBy('size') as $size)
                        @if ($size->size == 'ONE SIZE' || $size->size == 'NO SIZE')
                            <p>{{ $size->size }}</p>
                            <input type="hidden" name="size" value="{{$size->size}}">
                        @else
                            <input type="radio" name="size" value="{{$size->size}}" class="{{"size_".$size->size}}">
                        @endif
                    @endforeach
                </div>
                <div class="price_container">
                    <label for="price">Quantity</label>
                    <input class="num" type="number" min="1" name="quantity" id="">
                </div>
                <div class="stock">
                    @foreach ($product->productColor as $color)
                        @foreach ($color->colorSize as $productcs)
                            @php
                                $quantity=$productcs->pivot->quantity;
                            @endphp
                        @endforeach
                    @endforeach
                    @if ($quantity)
                        <p><span class="in_stock">IN STOCK</span></p>
                    @else
                        <p><span class="out_stock">OUT OF STOCK</span></p>
                    @endif
                </div>
                @if ($quantity)
                <button type="submit">ADD TO CART</button>
                @else
                <button class="disabled" id="disBtn" type="submit">ADD TO CART</button>
                @endif
            </form>
            <form class="wishlist" action="{{route('add to wishlist')}}" method="post">
                @csrf
                <input type="hidden" name="product_id" value="{{ $product->id }}">
                <button type="submit">ADD TO WISHLIST</button>
            </form>
        </div>
    </section>
    <hr>
    <section class="ui">
        <div class="head">
            <h1>RATEING PRODUCT</h1>
        </div>
        <div class="rating_form">
            <form action="{{ route('rate the product') }}" method="POST">
                @csrf
                <input type="hidden" name="product_id" value="{{ encrypt($product->id) }}">
                <h3>Add your Rate</h3>
                <div class="rating">
                    <input type="radio" class="star5" id="star5" name="rating_value" value="5">
                    <label class="label_star5" for="star5"></label>

                    <input type="radio" class="star4" id="star4" name="rating_value" value="4">
                    <label class="label_star4" for="star4"></label>

                    <input type="radio" class="star3" id="star3" name="rating_value" value="3">
                    <label class="label_star3" for="star3"></label>

                    <input type="radio" class="star2" id="star2" name="rating_value" value="2">
                    <label class="label_star2" for="star2"></label>

                    <input type="radio" class="star1" id="star1" name="rating_value" value="1">
                    <label class="label_star1" for="star1"></label>
                </div>
                <h3>If you wish to provide any feedback or comments</h3>
                <div class="comment">
                    <textarea name="comment" id="" cols="165" rows="30"></textarea>
                </div>
                <button type="submit" class="submit">Submit</button>
            </form>
        </div>
    </section>
    <hr>
    @include('pages.includes.some_hints')
    <script>
            document.getElementById('disBtn').addEventListener('click',function(e){
                e.preventDefault();
            });
    </script>
@endsection
