<?php

namespace App\Http\Controllers;

use App\Models\Otp;
use App\Models\User;
use App\Models\Country;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\LoginRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Http\Requests\RegisterRequest;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\ResetPasswordRequest;
use App\Http\Requests\ChangePasswordRequest;
use App\Http\Requests\ForgetPasswordRequest;
use App\Http\Requests\EditpersonalinfoRequest;

class UserController extends Controller
{
    public function sendOTP($user)
    {
        $otp = rand(1000000, 9999999);
        $time = time();
        $user_otp = Otp::updateOrCreate(
            ["email" => $user->email],
            [
                "email" => $user->email,
                "otp" => $otp,
                "created_at" => $time,
            ]
        );
        $data["email"] = $user_otp->email;
        $data["otp"] = $user_otp->otp;
        Mail::send('pages.Mails.your_otp', ['data' => $data], function ($message) use ($data) {
            $message->to($data["email"]);
            $message->subject('Verification Email');
        });
    }
    public function handleOTP(Request $request)
    {
        $data = $request->validate([
            'otp' => 'required|numeric',
        ]);
        $user_data = User::where("id", decrypt($request->user_id))->first();
        $otp_data = Otp::where("email", $user_data->email)->first();
        if ($user_data->email == $otp_data->email && $otp_data->otp == $request->otp) {
            $user_data->update([
                "email_verified_at" => now(),
            ]);
            return redirect()->route('Login');
        } else {
            return redirect()->route('otp')->withErrors('Wrong Data,Click on Resend email to send another OTP');
        }
    }
    public function resendOTP()
    {
        if (session()->has("user")) {
            $user = session()->get("user");
            $this->sendOTP($user);
            return redirect()->route('otp')->with('success', "We send a new email for you, cheack your email");
        } else {
            return redirect()->route('Register')->withErrors("You don't in our coummunity yet, Please register first");
        }
    }
    public function handleRegister(RegisterRequest $request)
    {
        $user = User::create([
            'name' => $request->name,
            "email" => $request->email,
            "gender" => $request->gender,
            "phone" => $request->phone,
            "country_id" => $request->country_id,
            "main_address" => $request->address,
            "password" => Hash::make($request->password),
        ]);
        session()->put("user", $user);
        $this->sendOTP($user);
        return redirect()->route('otp');
    }
    public function handleLogin(LoginRequest $request)
    {
        $credentials = $request->only('email', 'password');
        $remember = $request->filled('remember');
        if (Auth::attempt($credentials, $remember)) {
            $user = User::where("email", $request->email)->first();
            session()->put("user", $user);
            return redirect()->route('Home');
        } else {
            return redirect()->back()->withErrors(["msg" => "Wrong Credentials Invalid Email or Password"]);
        }
    }
    //forget password
    public function forgetPasswordHandle(ForgetPasswordRequest $request)
    {
        $user_email = DB::table('password_reset_tokens')->where('email', $request->email)->first();
        $token = Str::random(64);
        if ($user_email == null) {
            $user = DB::table('password_reset_tokens')->insert([
                "email" => $request->email,
                "token" => $token,
            ]);
        } else {
            $user = DB::table('password_reset_tokens')->where('email', $request->email)->update([
                "email" => $request->email,
                "token" => $token,
            ]);
        }
        Mail::send('pages.Mails.reset_your_password', ['token' => $token], function ($message) use ($request) {
            $message->to($request->email, $request->name);
            $message->subject('Reset Your Password');
        });
        return view('pages.Success.check_your_email');
    }
    public function resetPassword($token)
    {
        $toke= DB::table('password_reset_tokens')->where([
            'token' => $token
        ])->first();
        if ($toke) {
            return view('pages.Forms.reset_password', compact(['token']));
        } else {
            return view('pages.Forms.forget_password');
        }
    }
    public function resetPasswordHandle(ResetPasswordRequest $request)
    {
        $reset_pass = DB::table('password_reset_tokens')->where([
            'email' => $request->email,
            'token' => $request->token
        ])->first();
        if (!$reset_pass) {
            //handle the error
            return redirect()->to(route('Forget password'))->with('error', 'Unfortunately, The password reset process could not be completed due to an issue,try again.');
        } else {
            User::where('email', $request->email)->update([
                'password' => Hash::make($request->password)
            ]);
            DB::table('password_reset_tokens')->where(['email' => $request->email])->delete();
            return redirect()->to(route('Login'))->with('success', "Password Reset Successfuly,Don't Forget your password again");
        }
    }
    public function showProfile(){
        return view('pages.Profile.personal_info');
    }
    public function editPersonalInfo()
    {
        $countries = Country::orderBy('name', 'asc')->get();
        return view('pages.Forms.personal_info_edit',compact('countries'));
    }
    public function handleEditPersonalInfo(EditpersonalinfoRequest $request){
        $user = User::where("id", Auth::user()->id)->first();
        if($user){
            if ($request->hasFile("image")) {
                //if we have image in the file but we don't have now so comment it
                if ($user->image != null) {
                    Storage::delete($user->image);
                    $image_name = Storage::putFile("User Images", $request->image); //rename - uploads
                } elseif ($user->image == null) {
                    $image_name = Storage::putFile("User Images", $request->image); //rename - uploads
                }
            } elseif ($request->image == null) {
                $image_name = $user->image;
            }
            $user->update([
                'name' => $request->name,
                "email" => $request->email,
                "gender" => $request->gender,
                "phone" => $request->phone,
                "image" => $image_name,
                "country_id" => $request->country_id,
                "main_address" => $request->address,
            ]);
            return redirect()->route('profile info');
        }else{
            return redirect()->route('Error');
        }
    }
    public function changePasswordHandle(ChangePasswordRequest $request)
    {
        $auth = Auth::user();
        if (!Hash::check($request->old_password, $auth->password)) {
            return back()->with("error", "Old Password Doesn't match!");
        }
        // old_password and new_password same
        if (strcmp($request->old_password, $request->new_password) == 0) {
            return redirect()->back()->with("error", "New Password cannot be same as your current password.");
        }
        User::whereId($auth->id)->update([
            'password' => Hash::make($request->new_password)
        ]);
        // return redirect()->route('profile info')->with('success','Change password Successfuly');
        $responseMessage = 'Form submitted successfully';
        return response($responseMessage);
    }
    public function logout()
    {
        $user = Auth::user();
        Auth::logout();
        if ($user) {
            $user->setRememberToken(null);
            $user->save();
        }
        return redirect()->route('Login');
    }
}