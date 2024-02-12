        <section class="top_info">
            <div class="img_name">
                <div class="prsonal_img">
                    @if (Auth::user()->image != null)
                    <img src="{{asset("storage")."/".Auth::user()->image}}" alt="">
                    @else
                    <img src="{{asset('img/dashboard/customer images/user.png')}}" alt="">
                    @endif
                </div>
                <div class="name">
                    <h1>{{ Auth::user()->name }}</h1>
                    <h3>{{ Auth::user()->email }}</h3>
                </div>
            </div>
            <div class="pesonal_links">
                <a href="{{ route('profile info') }}">PERSONAL INFO</a>
                <a href="{{route('wishlist')}}">MY WISHLIST</a>
                <a href="">BILLING INFO</a>
                <a href="{{ route('order history') }}">ORDER HISTORY</a>
            </div>
            <div class="cart_logout">
                <div class="your_cart_link">
                    <a href="{{ route('cart') }}">MY CART</a>
                </div>
                <div class="logout">
                    <a href="{{ route('logout') }}">LOGOUT</a>
                </div>
            </div>
        </section>
