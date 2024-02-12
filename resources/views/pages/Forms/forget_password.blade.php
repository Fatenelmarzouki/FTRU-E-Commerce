@extends('pages.layout.layout')
@section('title')
Forget Password
@endsection
@section('content')
@include('pages.includes.session')
    <section class="reg_form">
        <div class="gif_video_forget">
        </div>
        <div class="containt">
            <h1 class="reg">Enter Your Email</h1>
            <form action="{{ route('Forget password handle') }}" method="POST">
                @csrf
                <label class="reg_label" for="">Email</label>
                <input class="reg_inputs_two" type="email" name="email">
                @error('email')
                    {{ $message }}
                @enderror
                <button class="submit" type="submit" value="Submit">Submit</button>
            </form>
        </div>
    </section>
@endsection
