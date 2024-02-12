@extends('pages.layout.layout')
@section('title')
    Order Details
@endsection
@section('content')
    <section class="order_details">
        @include('pages.includes.session')
        <div class="headline">
            <h1>Your Order Details</h1>
        </div>
        <h1>Product</h1>
        <h1>Name</h1>
        <h1>Color</h1>
        <h1>Size</h1>
        <h1>Quantity</h1>
        <h1>Unit Price</h1>
        <h1>Total Price</h1>
        @foreach ($order->orderProductCS as $proCS)
            @php
                $color = $proCS->ProCSProColor;
                $size = $proCS->ProCSProSize;
                $product = $color->colorProduct;
                $unit = $product->main_price - ($product->main_price * $product->main_discount) / 100;
            @endphp
            <div class="pro">
                <div class="img">
                    <img src="{{ asset("storage/$proCS->image") }}" alt="">
                </div>
                <div class="name">
                    <p>{{ $product->name }}</p>
                </div>
                @if ($color->color == 'Multi')
                    <div class="quantity">
                        <p>No color</p>
                    </div>
                @else
                    <div class="color" style="background-color:  {{ $color->color }}"></div>
                @endif
                @if ($size->size == 'ONE SIZE' || $size->size == 'NO SIZE')
                    <div class="quantity">
                        <p>{{ $size->size }}</p>
                    </div>
                @else
                    <div class="size">
                        <p>{{ $size->size }}</p>
                    </div>
                @endif
                <div class="quantity">
                    <p>{{ $order->OrderOrderDetails[$loop->index]->quantity }}</p>
                </div>
                <div class="unit">
                    <p>{{ $unit }}</p>
                </div>
                <div class="total">
                    <p>{{ $unit * $order->OrderOrderDetails[$loop->index]->quantity }}</p>
                </div>
            </div>
            <div class="line"></div>
        @endforeach
        <div class="disc">
            <div class="dtd">
                <p>Discount</p>
                <p>{{ $order->discount . ' %' }}</p>
            </div>
            <div class="dtd">
                <p>Taxes</p>
                <p>{{ $order->tax . ' $' }}</p>
            </div>
            <div class="dtd">
                <p>Shipping</p>
                <p>{{ $order->shipping . ' $' }}</p>
            </div>
        </div>
        <div class="last_line"></div>
        <div class="all_total">
            <p>Total</p>
            <p>{{ $order->total . ' $' }}</p>
        </div>
        <div class="cont">
            <h1>Choose Your Payment Method</h1>
        </div>
        <div class="pay">
            <a href="{{ route('developed_payment',['order_id'=>encrypt($order->id)]) }}"><img src="{{ asset('img/Stars/paypal.png') }}" alt=""></a>
            <a href="{{ route('developed_payment',['order_id'=>encrypt($order->id)]) }}"><img src="{{ asset('img/Stars/master_card.png') }}" alt=""></a>
            <a href="{{ route('developed_payment',['order_id'=>encrypt($order->id)]) }}"><img src="{{ asset('img/Stars/visa.png') }}" alt=""></a>
        </div>
    </section>
@endsection
