<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index()
    {
        return view('auth.login', [
            'title' => 'Login'
        ]);
    }

    public function auth(Request $request)
    {
        $creds = $request->validate([
            // 'email' => 'required|email:dns', //taking way too long
            'email' => 'required|email:rfc',
            'password' => 'required|min:6',
        ]);

        if(Auth::attempt($creds)) {
            $request->session()->regenerate();

            return redirect()->intended('dashboard');
        }

        return back()->with('error', ['body'=>'Something Went Wrong.. \nPlease Double Check Your Credentials', 'head'=>'Login Failed!', 'status'=>'error']);

    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}