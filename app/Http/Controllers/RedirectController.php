<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Country;
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Event\ViewEvent;

class RedirectController extends Controller
{
    //Register
    public function registerForm()
    {
        $countries = Country::orderBy('name', 'asc')->get();
        return view('pages.Forms.register',compact('countries'));
    }
    //Login
    public function loginForm()
    {
        return view('pages.Forms.login');
    }
    //home
    public function Index()
    {

        return view('index');
    }
    //error
    public function Error()
    {
        return view('pages.errors.error');
    }
    //change password
    public function changePasseordForm()
    {
        return view('pages.Forms.change_password');
    }
    //forget password
    public function forgetPasseordForm()
    {
        return view('pages.Forms.forget_password');
    }
    //Pro Billing Info
    public function productBillingInfo()
    {
        return view('pages.Profile.billing_info');
    }
    //profile info
    // public function profile()
    // {
    //     return view('pages.Profile.personal_info');
    // }
    //payment
    public function payment()
    {
        return view('pages.Forms.payment');
    }
    //user order history
    public function orderHistory()
    {
        return view('pages.Profile.order_history');
    }
    //otp
    public function otpForm()
    {
        return view('pages.Forms.otp');
    }
}