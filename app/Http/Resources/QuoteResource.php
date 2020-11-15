<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class QuoteResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // Tampilkan hasil array dari quote
        return [
            // Tampilkan id quote
            'id' => $this->id,
            // Tampilkan isi quote
            'message' => $this->message,
            // Tampilkan data user pembuat quote
            // Gunakan UserResource untuk relasi dengan tabel user
            'user' => new UserResource($this->user),
        ];
    }
}
