<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \App\Models\User;

class RegisterController extends Controller
{
    public function index()
    {
        return view('auth.register', [
            'title' => 'Register'
        ]);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'fname' => 'required|max:255',
            'lname' => 'required|max:255',
            'username' => ['required', 'min:3', 'max:255', 'unique:users'],
            'email' => 'required|email:rfc|unique:users',
            'password' => 'required|min:6|max:255'
        ]);

        $validatedData['name'] = "{$validatedData['fname']} {$validatedData['lname']}";
        $data = [
            'name' => $validatedData['name'],
            'username' => $validatedData['username'],
            'email' => $validatedData['email'],
            // 'password' => bcrypt($validatedData['password'])
            'password' => \Illuminate\Support\Facades\Hash::make($validatedData['password'])
        ];

        User::create($data);

        return redirect('/login')->with('msg', ['status'=>'success', 'head'=>'Success!', 'body'=>'✅ Register Success!\nPlease Login With Your New Credentials']);
    }
}