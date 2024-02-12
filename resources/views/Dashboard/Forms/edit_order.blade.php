@extends('Dashboard.Admin Layout.layout')

@section('title')
    Edit Order Details
@endsection

@section('content')
@include('pages.includes.session')

    <section class="blobs">
        <div class="category">
            <h3>TOTAL CATEGORY</h3>
            <img src="{{ asset('img/dashboard/icons/category.png') }}" alt="nobe">
            <h1>{{ $orders }}</h1>
        </div>
        <div class="text">
            <h1>FTRU TOTAL CATEGORY COUNTER</h1>
            <p class="one">Discover the depth and breadth of our extensive product catalog with the FTRU Total Products
                Counter.
                This counter showcases the remarkable range of offerings we have curated for our valued customers. </p>

            <p class="two">From trending items to timeless classics, each increment in the counter represents a unique
                product waiting to enhance your lifestyle.
                Explore the diversity of our collection and experience the excitement of finding your perfect match.
                With every new addition, we strive to bring you the finest selection and exceed your expectations.
                Embrace the journey of exploration as you witness our product counter grow, reflecting our commitment to
                quality, innovation, and customer satisfaction.
            </p>
        </div>
    </section>
    <section class="form">
        <h1>EDIT ORDER</h1>
        <form action="{{route('editorderformhandle',['order_id'=>$one_order->id])}}" method="post">
            @csrf
            @method('PUT')
            <div class="label_inputs">
                <div>
                    <label for="">Discount</label>
                    <input name="discount" class="input" type="text" value="{{ $one_order->discount }}">
                    @error('discount')
                        {{$message}}
                    @enderror
                </div>
                <div>
                    <label for="">Shipping</label>
                    <input name="shipping" class="input" type="text" value="{{ $one_order->shipping }}">
                    @error('shipping')
                        {{$message}}
                    @enderror
                </div>
            </div>

            <div class="label_inputs">
                <div>
                    <label for="">Tax</label>
                    <input name="tax" class="input" type="text" value="{{ $one_order->tax }}">
                    @error('tax')
                        {{$message}}
                    @enderror
                </div>
                <div>
                    <label for="">Status</label>
                    <select name="status" class="input select_height_53" id="">
                        <option value="Pending" @if ($one_order->status == 'Pending') selected @endif >Pending</option>
                        <option value="Processing" @if ($one_order->status == 'Processing') selected @endif>Processing</option>
                        <option value="Shipped" @if ($one_order->status == 'Shipped') selected @endif>Shipped</option>
                        <option value="Delivered" @if ($one_order->status == 'Delivered') selected @endif>Delivered</option>
                    </select>
                    @error('status')
                        {{$message}}
                    @enderror
                </div>
            </div>
            <button class="submit" type="submit">SUBMIT</button>
        </form>
    </section>

@endsection
