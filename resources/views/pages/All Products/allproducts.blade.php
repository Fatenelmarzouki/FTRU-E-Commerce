@extends('pages.layout.layout')
@section('title',$category->name)
@section('content')
    <section class="{{$category->name}}">
    </section>
    <section class="section_search">
        <form action="{{ route('search') }}" method="GET" id="submit_search">
            @csrf
            <div class="search-container">
                <input type="text" id="search" placeholder="Search" name="query">
                <button type="submit"><img src="{{asset('img/Stars/search green.png')}}" alt=""></button>
            </div>
            <div class="sugg_container">
            </div>
        </form>
    </section>
    @include('pages.includes.session')
    <section class="man_product">
        <div class="title">
            <div>
                <h1>{{ $category->name .' '. 'Product' }}</h1>
            </div>
            <div class="sub_category_links">
                <button class="dropbtn">SUB CATEGORY</button>
                <div class="dropdown-content">
                    @foreach ($category->categorySubcategory as $subcat )
                    @php
                        $db_allsubname =$subcat->name;
                        $show_allsubname = str_replace('_', ' ', $db_allsubname)
                    @endphp
                        <a href="{{ route('show one subcategory',['category_name'=>$category->name,'subcategory_name'=>$subcat->name]) }}">{{ $show_allsubname}}</a>
                    @endforeach
                </div>
            </div>
        </div>
        @foreach ($category->categorySubcategory as $subcat )
            @foreach ($subcat->subcategoryProduct()->inRandomOrder()->take(2)->where('status','show')->get() as $product)
                <div class="first_product">
                    <a href="{{ route('show one product',['category_name'=>$category->name,'subcategory_name'=>$subcat->name,'product_id'=>$product->id]) }}">
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
                                <h1>{{ $product->name }}</h1>
                                <form action="{{ route('add to wishlist') }}" method="POST">
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
        @endforeach
    </section>

    <hr>
    <section class="man_product">
            <div class="title">
                <div>
                    <h1>NEW PRODUCTS</h1>
                </div>
            </div>
        @foreach ($category->categorySubcategory as $subcat)
            @foreach ($subcat->subcategoryProduct()->latest("created_at")->take(1)->where('status','show')->get() as $product)
                <div class="first_product">
                    <a href="#">
                        <div class="inner_bg">
                            <div class="rate_number">
                            @if ($product->productReview->avg('rating_value'))
                            <img src="{{ asset('img/Stars/star.png') }}" alt="Ward" srcset="">
                            <p>{{ $product->productReview->avg('rating_value') }}</p>
                            @endif
                            </div>
                            <div class="pro_img">
                                <img src="{{asset("storage/$product->image")}}" alt="Product Image">
                            </div>
                            <br>
                            <div class="pro_name">
                                <h1>{{$product->name}}</h1>
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
        @endforeach
    </section>

    <hr>
    @include('pages.includes.some_hints')
@endsection
