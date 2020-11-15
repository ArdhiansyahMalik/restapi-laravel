<?php

Route::post('register', 'Api\RegisterController@action');
Route::post('login', 'Api\LoginController@action');
// Gunakan auth API untuk user yang sedang login
Route::get('me', 'Api\UserController@me')->middleware('auth:api');
// Gunakan auth API untuk user yang sedang login
Route::post('quote', 'Api\QuoteController@store')->middleware('auth:api');
// Menampilkan semua daftar quote
Route::get('quote', 'Api\QuoteController@index')->middleware('auth:api');
// Menampilkan quote berdasarkan id
Route::get('quote/{quote}', 'Api\QuoteController@show')->middleware('auth:api');
// Mengupdate quote berdasarkan id dan user pemilik quote
Route::put('quote/{quote}', 'Api\QuoteController@update')->middleware('auth:api');
// Menghapus quote berdasarkan id dan user pemilik quote
Route::delete('quote/{quote}', 'Api\QuoteController@destroy')->middleware('auth:api');

// Simpel Route
// Route::apiResource('quote', 'Api\QuoteController')->middleware('auth:api');
