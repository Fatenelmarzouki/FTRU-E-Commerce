@extends('pages.layout.layout')
    @php
        $db_subname =$subcategory->name;
        $show_subname = str_replace('_', ' ', $db_subname)
    @endphp
@section('title',$show_subname)
@section('content')
    <section class="{{$category->name . "_" .$subcategory->name}}">
    </section>
    <section class="section_search">
        <form action="{{ route('search') }}" method="GET">
            <div class="search-container">
                <input type="text" id="search" placeholder="Search" name="query">
                <button type="submit"><img src="{{asset('img/Stars/search green.png')}}" alt=""></button>
            </div>
        </form>
    </section>
        @include('pages.includes.session')
    <section class="man_product">
        <div class="title">
            <div>
            {{-- <h1>{{ $subcategory->id }}</h1> --}}
            <h1>{{ $show_subname }}</h1>
            </div>
            <div class="sub_category_links">
                <button class="dropbtn">SUB CATEGORY</button>
                <div class="dropdown-content">
                    @foreach ($category->categorySubcategory as $subcat )
                    @php
                        $db_allsubname =$subcat->name;
                        $show_allsubname = str_replace('_', ' ', $db_allsubname)
                    @endphp
                        <a href="{{ route('show one subcategory',['category_name'=>$category->name,'subcategory_name'=>$subcat->name]) }}">{{ $show_allsubname }}</a>
                    @endforeach
                </div>
            </div>
        </div>
        @foreach ($subcategory->subcategoryProduct as $product)
        <div class="first_product">
            <a href="{{ route('show one product',['category_name'=>$category->name,'subcategory_name'=>$subcategory->name,'product_id'=>$product->id]) }}">
                <div class="inner_bg">
                    <div class="rate_number">
                        @if ($product->productReview->avg('rating_value'))
                        <img src="{{ asset('img/Stars/star.png') }}" alt="Ward" srcset="">
                        <p>{{ $product->productReview->avg('rating_value') }}</p>
                        @endif
                    </div>
                    <div class="pro_img">
                        <img src=" {{asset("storage/$product->image")}}" alt="Product Image">
                    </div>
                    <br>
                    <div class="pro_name">
                        {{-- <h1>{{ $product->id }}</h1> --}}
                        <h1>{{ $product->name }}</h1>
                        <form action="{{ route('add to wishlist') }}" method="post">
                            @csrf
                            <input type="hidden" name="product_id" value="{{ $product->id }}">
                            <button type="submit"><img src="{{asset("img/Stars/heart (1).png")}}" alt="nui"></button>
                        </form>
                    </div>
                    <div class="price_stock">
                        @if ($product->main_discount)
                            <div class="price">
                                <p>{{$product->main_price ." $"}}</p>
                            </div>
                            <div class="price_disc">
                                @php
                                    $price_after_disc = $product->main_price - ($product->main_price * ($product->main_discount/100));
                                @endphp
                                <p>{{ $price_after_disc. " $" }}</p>
                            </div>
                        @else
                            <div class="price_disc">
                                <p>{{ $product->main_price . " $" }}</p>
                            </div>
                        @endif
                    </div>
                </div>
            </a>
        </div>
        @endforeach
    </section>
    <hr>
    @include('pages.includes.some_hints')
@endsection
