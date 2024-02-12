@extends('Dashboard.Admin Layout.layout')
@section('title')
Dashboard
@endsection
@section('content')
        <section class="blobs">
            <div class="visitor">
                <h3>TOTAL VISITORS</h3>
                <img src="{{ asset('img/dashboard/icons/customer.png') }}" alt="nobe">
                <h1>{{ $visitor->count }}</h1>
            </div>
            <div class="customer">
                <h3>TOTAL CUSTOMERS</h3>
                <img src="{{ asset('img/dashboard/icons/browser (1).png') }}" alt="nobe">
                <h1>{{ $all_customer->count() }}</h1>
            </div>
            <div class="product">
                <h3>TOTAL PRODUCTS</h3>
                <img src="{{ asset('img/dashboard/icons/box.png') }}" alt="nobe">
                <h1>{{ $product->count() }}</h1>
            </div>
            <div class="order">
                <h3>TOTAL ORDERS</h3>
                <img src="{{ asset('img/dashboard/icons/checkout.png') }}" alt="nobe">
                <h1>{{ $orders->count() }}</h1>
            </div>
            <div class="category">
                <h3>TOTAL CATEGORY</h3>
                <img src="{{ asset('img/dashboard/icons/category.png') }}" alt="nobe">
                <h1>{{ $category_name->count() }}</h1>
            </div>
        </section>
        <section class="charts">
            <div class="bar">
            </div>
            <div class="pie">
            </div>
        </section>
        <section class="new_last">
            @if ($all_customer->isNotEmpty())
            <div class="new_customers">
                <h1>NEW CUSTOMERS</h1>
                <div class="labels">
                    <h3 >ID</h3>
                    <h3>PHOTO</h3>
                    <h3>FULL NAME</h3>
                    <h3>EMAIL</h3>
                    <h3 class="country_label">COUNTRY</h3>
                    <h3>STATUS</h3>
                </div>
                @foreach ($all_customer as $customer)
                <div class="customer_data">
                    <div class="id">
                        <p>{{ '#'.$loop->iteration }}</p>
                    </div>
                    <div class="img">
                        @if ($customer->image)
                        <img src="{{asset("storage/$customer->image")}}" alt="User Photo" srcset="">
                        @else
                        <img src="{{asset('img/dashboard/customer images/user (1).png')}}" alt="User Photo" srcset="">
                        @endif
                    </div>
                    <div class="name">
                        <p>{{ $customer->name }}</p>
                    </div>
                    <div class="email">
                        <p>{{ $customer->email }}</p>
                    </div>
                    <div class="country">
                        <p>{{ $customer->userCountry->name }}</p>
                    </div>
                    <div class="status">
                        @if ($customer->userCart()->exists())
                        <p>ACTIVE</p>
                        @else
                        <p>NOT ACTIVE</p>
                        @endif
                    </div>
                </div>
                @endforeach
            </div>
            @else
            <div class="last_order">
                <h1>NEW CUSTOMERS</h1>
                <h1 class="info_title" style="color: #bf3b3b">NO CUSTOMERS</h1>
            </div>
            @endif
            @if ($orders->isNotEmpty())
            <div class="last_order">
                <h1>LAST ORDERS</h1>
                <div class="labels">
                    <h3>ID</h3>
                    <h3>NAME</h3>
                    <h3>TOTAL</h3>
                    <h3>STATUS</h3>
                </div>
                @foreach ($users as $user)
                    @foreach ($user->userOrder()->latest("created_at")->take(1)->get() as $order)
                    <div class="order_data">
                        <div class="id">
                            <p>{{ '#'.$loop->iteration }}</p>
                        </div>
                        <div class="name">
                            <p>{{ $order->orderUser->name }}</p>
                        </div>
                        <div class="total">
                            <p>{{$order->total .' $'}}</p>
                        </div>
                        <div class="status">
                            <p>{{ $order->status }}</p>
                        </div>
                    </div>
                    @endforeach
                @endforeach
                @else
                <div class="last_order">
                    <h1>LAST ORDERS</h1>
                    <h1 class="info_title" style="color: #bf3b3b">NO ORDERS YET</h1>
                </div>
            </div>
            @endif
        </section>
        <section class="resent">
            <h1>RESENT REVIEW</h1>
            <div class="all_review">
                @foreach ($all_customer as $customer)
                    @foreach ($customer->userReview()->latest("created_at")->take(1)->get() as $review)
                    <div class="review_2">
                        <div class="top">
                            <div class="img">
                                @php
                                    $image=$review->reviewUser->image;
                                @endphp
                                @if ($image)
                                    <img src="{{asset("storage/$image")}}" alt="User Photo">
                                @else
                                    <img src="{{asset('img/dashboard/customer images/user (1).png')}}" alt="User Photo" srcset="">
                                @endif
                            </div>
                            <div class="name">
                                <h1>{{ $review->reviewUser->name }}</h1>
                            </div>
                        </div>
                        <div class="comment">
                            @if ($review->comment)
                            <p>{{ $review->comment }}</p>
                            @else
                            <p>No Comment</p>
                            @endif
                        </div>
                    </div>
                    @endforeach
                @endforeach
            </div>
        </section>
@endsection
