<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Quote extends Model
{
    // Gunakan $guarded agar semua field fillable
    protected $guarded = [];

    // Buat relasi dengan Model User untuk menampilkan data user
    public function user()
    {
        // Mengizinkan relasi dengan semua class di Model User
        return $this->belongsTo(User::class);
    }
}
