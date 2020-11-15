<?php

namespace App\Http\Controllers\Api;

use App\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;

class RegisterController extends Controller
{
    public function action(Request $request)
    {
        // Validasi untuk setiap inputan dari user
        $this->validate($request, [
            'name' => 'required|min:3',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:8',
        ]);
        
        // Membuat variabel user untuk menampung add user melalui Model User
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            // Metode untuk Auth API token
            'api_token' => Str::random(80),
        ]);

        // Menampilkan token di luar "data"
        return (new UserResource($user))->additional([
            'meta' => [
                'token' => $user->api_token,
            ],
        ]);
    }
}
