<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class UserVerified
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user= Auth::user();
        if($user){
            if($user->user_type == 1){
                if($user->email_verified_at != null){
                    return $next($request);
                }else{
                    return redirect()->route('otp')->with('error',"You Must Verify your Email First");
                }
            }else{
                return redirect()->route('Register')->with('error',"Create your Account First");
            }
        }else{
            return redirect()->route('Login')->with('error', "Please Login First");
        }
    }
}