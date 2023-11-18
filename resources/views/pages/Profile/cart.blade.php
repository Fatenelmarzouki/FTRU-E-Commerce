@extends('pages.layout.layout')
@section('title')
Your Cart
@endsection
@section('content')
    <section class="contant_info_order">
        @include('pages.includes.top_info')
        <section class="next_container">
            @include('pages.includes.session')
            <h1 class="info_title">YOUR CART</h1>
            @if ($cart_item->isEmpty())
                <div class="order_history_list_not">
                    <div class="img">
                        <img src="{{asset("img/Stars/exclamation-mark.png")}}" alt="not">
                    </div>
                    <div class="not_found">
                        <h1 class="empty">You Don't have an items in your Cart</h1>
                    </div>
                </div>
            @else
            @foreach ($cart_item as $cart)
                @php
                    $product_sc = DB::table('product_color_sizes')->where("id",$cart->product_color_size_id)->first();
                    $product_id = DB::table('product_colors')->select("product_id")->where("id",$product_sc->product_color_id)->first();
                    $product_data = DB::table('products')->where("id",$product_id->product_id)->first();
                @endphp
                <div class="order_history_list">
                    <div class="image_cont">
                        <img src="{{asset("storage")."/".$product_sc->image}}" alt="">
                    </div>
                    <div class="qty">
                        <p class="pro_price">{{$cart->quantity}}</p>
                    </div>
                    <div class="product_notes">
                        <h1>{{$product_data->name}}</h1>
                        <p class="pro_price">{{"EGP ".$cart->price}}</p>
                    </div>
                    <div class="options">
                        <a href="#"><img src="../../img/Stars/payment-method.png" alt="no"></a>
                        <a href="{{ route('edit cart',['cartitem_id'=>$cart->id,'product_id'=>$product_data->id]) }}"><img src="../../img/Stars/edit.png" alt="no"></a>
                        <form action="{{ route('remove from cart',$cart->id) }}" method="post">
                            @csrf
                            @method('DELETE')
                            <button type="submit"><img src="../../img/Stars/delete (1).png" alt="no"></button>
                        </form>
                    </div>
                </div>
            @endforeach
            @endif
        </section>
    </section>
@endsection

