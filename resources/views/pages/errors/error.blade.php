@extends('pages.layout.layout')
@section('title')
Error
@endsection
@section('content')
    <section class="error_not_found">
        <div class="error_div">
            <div class="img">
                <img src="{{ asset('img/illast/404 error with person looking for.gif') }}" alt="">
            </div>
            @if (session()->has("error"))
                <h1 style="color: #bf3b3b">{{session()->get("error")}}</h1>
            @endif
        </div>
    </section>
@endsection
