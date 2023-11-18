@extends('pages.layout.layout')
@section('title')
Order History
@endsection
@section('content')
    <section class="contant_info_order">
        @include('pages.includes.top_info')
        <section class="next_container">
            <h1 class="info_title">ORDER HISTORY</h1>
            <div class="order_history_list">
                    <div class="image_cont">
                        <img src="{{ asset('img/Man/Pants/Odion-pants_Pants-1_694_12.png') }}" alt="">
                    </div>
                    <div class="product_notes">
                        <h1>ODION PANTS</h1>
                        <p class="disc">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt vitae cum in nobis dolore eos facere explicabo sequi! Obcaecati ex veritatis quasi cumque soluta, vitae cum rem quidem quia saepe.</p>
                        <p class="pro_price">300 $</p>
                    </div>
            </div>
            <div class="order_history_list">
                <div class="image_cont">
                    <img src="{{ asset('img/Man/Shirts and Tops/Gabor-shirt_Shirts-and-Tops-1_2140_12-1.png') }}" alt="">
                </div>
                <div class="product_notes">
                    <h1>GABOR SHIRT</h1>
                    <p class="disc">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt vitae cum in nobis dolore eos facere explicabo sequi! Obcaecati ex veritatis quasi cumque soluta, vitae cum rem quidem quia saepe.</p>
                    <p class="pro_price">385 $</p>
                </div>
            </div>
            <div class="order_history_list">
                <div class="image_cont">
                    <img src="{{ asset('img/Man/Jackets/Ikal-jacket-yellow_Plain-product-1.png') }}" alt="">
                </div>
                <div class="product_notes">
                    <h1>IKAL JACKETS</h1>
                    <p class="disc">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt vitae cum in nobis dolore eos facere explicabo sequi! Obcaecati ex veritatis quasi cumque soluta, vitae cum rem quidem quia saepe.</p>
                    <p class="pro_price">450 $</p>
                </div>
            </div>
            <div class="order_history_list">
                <div class="image_cont">
                    <img src="{{ asset('img/Man/Shorts/Tupoc-bermuda_Shorts-1_924_12.png') }}" alt="">
                </div>
                <div class="product_notes">
                    <h1>TUPOC SHORTS</h1>
                    <p class="disc">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt vitae cum in nobis dolore eos facere explicabo sequi! Obcaecati ex veritatis quasi cumque soluta, vitae cum rem quidem quia saepe.</p>
                    <p class="pro_price">300 $</p>
                </div>
            </div>
            <div class="order_history_list">
                <div class="image_cont">
                    <img src="{{ asset('img/Man/Shorts/Yooko-shorts_Shorts-1_910_12-3.png') }}" alt="">
                </div>
                <div class="product_notes">
                    <h1>YOOKO SHORTS</h1>
                    <p class="disc">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nesciunt vitae cum in nobis dolore eos facere explicabo sequi! Obcaecati ex veritatis quasi cumque soluta, vitae cum rem quidem quia saepe.</p>
                    <p class="pro_price">300 $</p>
                </div>
            </div>
        </section>
    </section>
@endsection
