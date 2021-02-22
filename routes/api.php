<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::prefix('user')->group(function() {
    Route::post('/register', '\App\Http\Controllers\UserController@register');
    Route::post('/login', '\App\Http\Controllers\UserController@login');
    Route::middleware('auth:api')->get('/profile', function(Request $request) {
        return $request->user();
    });
});

Route::prefix('products')->group(function() {
    Route::post('/add', '\App\Http\Controllers\ProductController@store');
    Route::get('/all', '\App\Http\Controllers\ProductController@index');
    Route::get('/{id}', '\App\Http\Controllers\ProductController@show');
    Route::get('/delete/{id}', '\App\Http\Controllers\ProductController@destroy');
    Route::post('/update/{id}', '\App\Http\Controllers\ProductController@update');
});

Route::prefix('categories')->group(function(){
    Route::post('/add', '\App\Http\Controllers\CategoryController@store');
    Route::get('/all', '\App\Http\Controllers\CategoryController@index');
    Route::post('/update/{id}', '\App\Http\Controllers\CategoryController@update');
    Route::post('/delete/{id}', '\App\Http\Controllers\CategoryController@destroy');
});

Route::prefix('dashboard')->group(function() {
    Route::get('/data', '\App\Http\Controllers\DashboardController@index');
});