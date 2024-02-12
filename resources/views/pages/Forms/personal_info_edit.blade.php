@extends('pages.layout.layout')
@section('title')
Edit Personal Info
@endsection
@section('content')
@include('pages.includes.session')
    <section class="reg_form">
        <div class="containt">
            <h1 class="reg">Edit Personal Info</h1>
            <form action="{{ route('handle edit personal info') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="prsonal_img_edit">
                    @if (Auth::user()->image != null)
                    <img src="{{asset("storage")."/".Auth::user()->image}}" alt="User Image">
                    @else
                    <img src="{{asset('img/dashboard/customer images/user.png')}}" alt="Profile Image">
                    @endif
                    <input class="upload" type="file" name="image" accept="image/*">
                </div>
                <label class="reg_label" for="">Name</label>
                <input  class="reg_inputs_one" type="text" name="name" value="{{ Auth::user()->name }}">
                @error('name')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Email</label>
                <input  class="reg_inputs_five" type="email" name="email" value="{{ Auth::user()->email }}">
                @error('email')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Phone</label>
                <input  class="reg_inputs_six" type="text" name="phone" value="{{ Auth::user()->phone }}">
                @error('phone')
                    {{ $message }}
                @enderror
                <br>
                <label class="reg_label" for="">Gender</label>
                <select class="reg_inputs_four" name="gender"  >
                    <option selected disabled ></option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
                @error('gender')
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
                <input class="reg_inputs_two" type="text" name="address" value="{{ Auth::user()->main_address }}">
                @error('address')
                    {{ $message }}
                @enderror
                <br>
                <p class="already"><span><a href="{{route('Change password')}}">Change Password</a></span> </p>
                <button class="submit" type="submit" value="Submit">Save Changes</button>
            </form>
        </div>
    </section>
@endsection

