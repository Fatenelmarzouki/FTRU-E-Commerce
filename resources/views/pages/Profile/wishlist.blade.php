@extends('pages.layout.layout')
@section('title')
YOUR WISHLIST
@endsection
@section('content')
    <section class="contant_info_order">
        @include('pages.includes.top_info')
        <section class="next_container">
            @include('pages.includes.session')
            <h1 class="info_title">YOUR WISHLIST</h1>
            @if ($user_wishlist->isEmpty())
                <div class="order_history_list_not">
                    <div class="img">
                        <img src="{{asset("img/Stars/exclamation-mark.png")}}" alt="not">
                    </div>
                    <div class="not_found">
                        <h1 class="empty">You Don't have an items in your Wishlist</h1>
                    </div>
                </div>
            @else
            @foreach ($user_wishlist as $prod)
                <div class="order_history_list">
                        <div class="options">
                        @php
                            $wishlist = DB::table('wishlists')->where('product_id', $prod->id)->first();
                        @endphp
                        <form action="{{route('move to cart')}}" >
                                @csrf
                                <input type="hidden" name="product_id" value="{{encrypt($prod->id)}}">
                                <input type="hidden" name="color" value="{{$prod->productColor->first()->color}}">
                                <input type="hidden" name="size" value="{{$prod->productSize->first()->size}}">
                                <button type="submit"><img src="{{asset("img/Stars/cart.png")}}" alt="no"></button>
                        </form>
                        <form action="{{route("remove from wishlist",["wishlist_id"=>$wishlist->id])}}" method="post">
                            @csrf
                            @method("DELETE")
                            <button type="submit"><img src="../../img/Stars/delete (1).png" alt="no"></button>
                        </form>
                    </div>
                    <div class="image_cont">
                        <img src="{{asset("storage")."/".$prod->image}}" alt="">
                    </div>
                    <div class="product_notes">
                        <h1>{{$prod->name}}</h1>
                        <p class="marg_price">{{$prod->main_price. " EGP"}}</p>
                    </div>
                </div>
            @endforeach
            @endif
        </section>
    </section>
    @if ($user_wishlist->isNotEmpty())
    <div class="add_all">
        <a href="{{route('move all to cart')}}">ADD ALL TO CART</a>
    </div>
    @endif
@endsection

