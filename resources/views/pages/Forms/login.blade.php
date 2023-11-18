@extends('pages.layout.layout')
@section('title')
Login
@endsection
@section('content')
    <section class="reg_form">
        <div class="gif_video_login">
        </div>
        <div class="containt">
            @if (session()->has('success'))
                {{session('success')}}
            @endif

            @if($errors->has('msg'))
                {{ $errors->first('msg') }}
            @endif
            <h1 class="reg">Login</h1>
            <form action="{{ route('login handle') }}" method="POST">
                @csrf
                <label class="reg_label" for="">Email</label>
                <input class="reg_inputs_two" type="email" name="email">
                @error('email')
                {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Password</label>
                <input class="reg_inputs_three" type="password" name="password">
                @error('password')
                {{ $message }}
                @enderror
                <br>
                {{-- <div class="forget_pass">
                    <div>
                        <a href="{{ route('Forget password') }}">Forget Password?</a>
                    </div>
                    <div>
                        <input class="check_box_btn" type="checkbox" name="remember" id="">
                        <label for="check">Remember Me</label>
                    </div>
                </div> --}}
                {{-- added --}}
                <div class="forget_pass">
                    <div>
                        <a href="{{route('Forget password')}}">Forget Password?</a>
                    </div>
                    <div>
                        <input class="check_box_btn" type="checkbox" name="remember" id="">
                        <label for="check">Remember Me</label>
                    </div>
                </div>
                <p class="already">Don't have an Account? <span><a href="{{route('Register')}}">Create new Account</a></span> </p>
                <button class="submit" type="submit" value="Submit">Submit</button>
            </form>
        </div>
    </section>
@endsection
