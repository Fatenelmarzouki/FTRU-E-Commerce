@extends('pages.layout.layout')
@section('title')
OTP
@endsection
@section('content')
@include('pages.includes.session')
    <section class="reg_form">
        <div class="containt">
            <h1 class="reg">Enter Your OTP</h1>
                @php
                    $user = session()->get("user")
                @endphp
            <form action="{{ route('verfiy handle') }}" method="POST">
                @csrf
                <label class="reg_label" for="">OTP</label>
                <input class="reg_inputs_two" type='text' name="otp">
                @error('otp')
                {{ $message }}
                @enderror
                <input type="hidden" name="user_id" value="{{encrypt($user->id)}}">
                <button class="submit" type="submit" value="Verfiy">Verfiy</button>
            </form>
            <p>We send an Email for you that has your OTP, Check your email to verify your account <a href="{{ route('resend otp') }}">Resend email?</a> </p>
        </div>
        <div class="gif_video_otp">
        </div>
    </section>
@endsection
