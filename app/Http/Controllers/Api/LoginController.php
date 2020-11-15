<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function action(Request $request) 
    {
        // Validasi hanya memasukkan email dan password
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:8'
        ]);

        // Menggunakan if untuk autentikasi hanya field email & password
        if (auth()->attempt($request->only('email', 'password'))) {
            // Buat variable untuk auth user
            $currentUser = auth()->user();

            // Mengembalikan nilai dan passing ke $currentUser
            return (new UserResource($currentUser))->additional([
                'meta' => [
                    'token' => $currentUser->api_token,
                ],
            ]);
        }

        // Menampilkan pesan error ketika tidak lolos autentikasi
        return response()->json([
            'error' => 'Your credential not match',
        ], 401);
    }
}
