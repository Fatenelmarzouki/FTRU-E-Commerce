<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\Visitor;
use App\Events\PageVisited;

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
        $count=Visitor::where('id',1)->first();
        event(new PageVisited($count->count));
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