<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    // Tambahkan 'api_token' agar fillable
    protected $fillable = [
        'name', 'email', 'password', 'api_token',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Buat relasi dengan Model Quote
    public function quotes()
    {
        // Mengizinkan 1 user membuat > 1 Quote
        return $this->hasMany(Quotes::class);
    }

    // Buat fungsi untuk mengecek kepemilikan quote
    public function ownsQuote(Quote $quote)
    {
        /*  Cek dengan helper auth()
            Apakah id() yang sedang login/terautentikasi
            Adalah sama dengan id pemilik quote  */
        return auth()->id() === $quote->user->id;
    }
}
