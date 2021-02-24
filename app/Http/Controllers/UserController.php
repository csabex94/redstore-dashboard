<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class UserController extends Controller
{
    public function register(Request $request) {
        $validData = $request->validate([
            'username' => 'required|string',
            'email' => 'required|email',
            'password' => 'required|confirmed'
        ]);
        if (!$validData) {
            return response()->json(['error' => 'Invalid credentials.']);
        }
        $newUser = User::create([
            'name' => $request->username,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);
        return response(201);
    }
    public function login(Request $request) {
        $validData = $request->validate([
            'email' => 'required|email',
            'password' => 'required|string'
        ]);
        if (!Auth::attempt($validData)) {
            return response()->json(['error' => 'Invalid credentials.'], 401);
        }
        $token = Auth::user()->createToken('accessToken')->accessToken;
        return response()->json(['token' => $token, 'user' => Auth::user()]);
    }
    public function admins() {
        $admins = User::all();
        return response()->json($admins);
    }
}
