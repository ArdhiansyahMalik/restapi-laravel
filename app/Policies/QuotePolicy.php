<?php

namespace App\Policies;

use App\User;
use App\Quote;
use Illuminate\Auth\Access\HandlesAuthorization;

class QuotePolicy
{
    use HandlesAuthorization;

    // Buat Authorization update untuk User dan Quote
    public function update(User $user, Quote $quote)
    {
        /*  Mengecek apakah user yang sedang login 
            Sama dengan id pemilik quote
            Berdasarkan function di Model User */
        return $user->ownsQuote($quote);
    }

    // Buat Authorization delete untuk User dan Quote
    public function delete(User $user, Quote $quote)
    {
        /*  Mengecek apakah user yang sedang login 
            Sama dengan id pemilik quote
            Berdasarkan function di Model User */
        return $user->ownsQuote($quote);
    }
}
