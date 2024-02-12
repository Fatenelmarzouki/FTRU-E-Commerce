@extends('pages.layout.layout')
@section('title')
Check Your Email
@endsection
@section('content')
    <section class="error check_mail_fix">
        <div class="error_div">
            <h1>CHECK YOUR EMAIL</h1>
            <div class="img">
                <img src="{{ asset('img/illast/New message.gif') }}" alt="">
            </div>
            <P>We send an Email for you to reset the password, Don't forget your password again 🙂 <a href="{{ route('Forget password') }}">Resend email?</a></P>
        </div>
    </section>
@endsection
