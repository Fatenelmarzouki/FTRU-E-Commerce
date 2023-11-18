@extends('pages.layout.layout')
@section('title')
Register
@endsection
@section('content')
    <section class="reg_form">
        <div class="containt">
            <h1 class="reg">Register</h1>
            <form action="{{ route('handle_register') }}" method="POST">
                @csrf
                <label class="reg_label" for="">Name</label>
                <input  class="reg_inputs_one" type="text" name="name">
                @error('name')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Email</label>
                <input  class="reg_inputs_five" type="email" name="email">
                @error('email')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Gender</label>
                <select class="reg_inputs_four" name="gender" >
                    <option selected disabled value=""></option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
                @error('gender')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Phone</label>
                <input  class="reg_inputs_six" type="text" name="phone">
                @error('phone')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Country</label>
                <select class="reg_inputs_seven" for="" name="country_id">
                    <option disabled selected></option>
                    @foreach ($countries as $country)
                        <option  value="{{ $country->id }}">{{ $country->name }}</option>
                    @endforeach
                </select>
                @error('country_id')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Address</label>
                <input class="reg_inputs_two" type="text" name="address">
                @error('address')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Password</label>
                <input class="reg_inputs_three" type="password" name="password">
                @error('password')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Password Confirmation</label>
                <input class="reg_inputs_four" type="password" name="password_confirmation">
                @error('password_confirmation')
                    {{ $message }}
                @enderror
                <br>
                <p class="already">Already have an Account? <span><a href="{{route('Login')}}">LOGIN</a></span> </p>
                <button class="submit" type="submit" value="Submit">Submit</button>
            </form>
        </div>
        <div class="gif_video">
        </div>
    </section>
@endsection

