@extends('pages.layout.layout')
@section('title')
    Your Search Results
@endsection
@section('content')

    <section class="section_search">
        <form action="{{ route('search') }}" method="GET" id="submit_search">
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
                <h1>Related Products</h1>
            </div>
        </div>
        @if ($products->isEmpty())
            <section class="not_found">
                <div class="image">
                    <img src="{{asset('img/Stars/Questions.gif')}}" alt="">
                </div>
                <div class="text">
                    <h1 class="info_title" style="color: #bf3b3b" >We Don't Understand What do you Mean</h1>
                </div>
            </section>
        @else
            @foreach ($products as $product)
                <div class="first_product">
                    {{-- <a href="{{ route('one product', ['category_name' => $category->name, 'product_id' => $product->id]) }}"> --}}
                    <a href="{{ route('show product of search',['product_id'=>encrypt($product->id)]) }}">
                        <div class="inner_bg">
                            <div class="rate_number">
                                @if ($product->productReview->avg('rating_value'))
                                <img src="{{ asset('img/Stars/star.png') }}" alt="Ward" srcset="">
                                <p>{{ $product->productReview->avg('rating_value') }}</p>
                                @endif
                            </div>
                            <div class="pro_img">
                                <img src="{{ asset("storage/$product->image") }}" alt="no">
                            </div>
                            <br>
                            <div class="pro_name">
                                <h1>{{ $product->name }}</h1>
                                <form action="{{ route('add to wishlist') }}" method="post">
                                    @csrf
                                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                                    <button type="submit"><img src="{{ asset('img/Stars/heart (1).png') }}"
                                            alt="nui"></button>
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
        @endif

    </section>
    <hr>

    @include('pages.includes.some_hints')
@endsection
@section('script')
    <script src="../js/nav.js"></script>
@endsection
