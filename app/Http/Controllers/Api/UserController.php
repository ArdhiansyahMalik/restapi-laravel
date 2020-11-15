<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;

class UserController extends Controller
{
    public function me()
    {
        // Untuk mengecek user yang sedang login
        $user = auth()->user();

        // Tampilkan data $user
        return new UserResource($user);
    }
}
