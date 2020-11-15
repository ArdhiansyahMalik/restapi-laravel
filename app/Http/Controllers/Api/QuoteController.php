<?php

namespace App\Http\Controllers\Api;

use App\Quote;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\QuoteResource;

class QuoteController extends Controller
{
    public function index()
    {
        /*  Tampung method get() Model Quote ke variabel $quotes */
        /*  Tambahkan method latest() sebelum get() untuk menampilkan quote terbaru */
        /*  Ganti method get() dengan paginate(max) untuk menampilkan banyak quote per halaman */
        $quotes = Quote::latest()->paginate(10);

        /*  Tampilkan daftar quote dengan collection()
            Lalu passing variabel $quotes */
        return QuoteResource::collection($quotes);
    }

    public function show(Quote $quote)
    {
        /*  Tampung method find() Model Quote ke variabel $quote 
        $quote = Quote::find($id); */

        /*  Tampilkan quote by id
            Lalu passing variabel $quote */
        return new QuoteResource($quote);
    }

    public function update(Request $request, Quote $quote)
    {
        /*  Tambah Authorization untuk mengecek pemilik quote
            Passing function update dari policy ke parameter pertama
            Passing id quote yang akan diupdate */
        $this->authorize('update', $quote);

        // Update quote ke field message
        $quote->update([
            'message' => $request->message
        ]);

        // Tampilkan hasil update quote
        return new QuoteResource($quote);
    }

    public function destroy(Quote $quote)
    {
        /*  Tambah Authorization untuk mengecek pemilik quote
            Passing function update dari policy ke parameter pertama
            Passing id quote yang akan diupdate */
        $this->authorize('delete', $quote);

        // Delete quote
        $quote->delete();

        // Tampilkan pesan sukses
        return response()->json([
            'message' => 'Quote was deleted'
        ]);
    }

    public function store(Request $request)
    {
        // Gunakan validate untuk syarat message/quote
        $this->validate($request, [
            'message' => 'required',
        ]);

        // Masukkan data id user dan quote dari Model Quote
        $quote = Quote::create([
            // Ambil data user_id dari user yang sedang login
            'user_id' => auth()->id(),
            // Ambil isi Quote dari message yang dikirim
            'message' => $request->message,
        ]);

        // Tampilkan data quote dengan QuoteResource
        // Lalu passing $quote ke QuoteResource
        return new QuoteResource($quote);
    }
}
