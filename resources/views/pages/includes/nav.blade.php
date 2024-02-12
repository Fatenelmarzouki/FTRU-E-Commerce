    <nav>
        <div class="nav_logo">
            <a href="{{ route('Home') }}">
                <img src="{{asset('img/logo/FTRU.svg') }}" alt="Logo Image">
            </a>

        </div>
        <div class="hamburger">
            <div class="line1"></div>
            <div class="line2"></div>
            <div class="line3"></div>
        </div>
        <ul class="nav-links header">
            @foreach ($category_name as $item)
                <li><a href="{{route('show category',["category_name"=>$item->name]) }}">{{$item->name}}</a></li>
            @endforeach
            {{-- <li><a href="{{ route('Women') }}">WOMAN</a></li>
            <li><a href="{{ route('Kids') }}">KIDS</a></li>
            <li><a href="{{ route('Accessories') }}">ACCESSORIES</a></li>
            <li><a href="{{ route('Bags') }}">BAGS</a></li> --}}
        @php
                $user=Auth::user();
        @endphp
        @if ($user)
            @if ($user->user_type == 1)
                <li><a href="{{ route('profile info') }}"><img src="{{asset("img/Stars/user (1).png")}}" alt=""></a></li>
                <li><a href="{{ route('cart') }}"><img src="{{asset("img/Stars/shopping-cart.png")}}" alt="" srcset=""></a></li>
            @else
                <div class="register" style="margin-top: 12px">
                    <a href="{{ route('Register') }}">Register</a>
                </div>
                <div class="login" style="margin-top: 12px">
                    <a href="{{ route('Login') }}">Login</a>
                </div>
            @endif
        @else
            <div class="register" style="margin-top: 12px">
                <a href="{{ route('Register') }}">Register</a>
            </div>
            <div class="login" style="margin-top: 12px">
                <a href="{{ route('Login') }}">Login</a>
            </div>
        @endif
        </ul>
    </nav>
