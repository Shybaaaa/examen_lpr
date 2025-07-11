<?php

use App\Http\Controllers\Api\User\Login;
use App\Http\Controllers\Api\User\Restore;
use App\Http\Controllers\Api\User\Store;
// use App\Http\Middleware\CheckAppToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/user', Store::class)->name('user.register');
Route::post('/user/l', Login::class)->name('user.login');
Route::get('/user/r', Restore::class)->name('user.restore');

// Route::group(['middleware' => CheckAppToken::class], function () {

Route::get('/event', App\Http\Controllers\Api\Event\Index::class)->name('event.index');
Route::get('/event/{id}', App\Http\Controllers\Api\Event\Show::class)->name('event.show');



Route::group(['middleware' => 'auth:sanctum'], function () {
    // Generate API token
    Route::post('/app-token/generate', App\Http\Controllers\Api\AppToken\Generate::class)->name('app-token.generate');

    // User routes
    Route::get('/user', App\Http\Controllers\Api\User\Index::class)->name('user.index');
    Route::get('/user/{id}', App\Http\Controllers\Api\User\Show::class)->name('user.show');
    Route::put('/user', App\Http\Controllers\Api\User\Put::class)->name('user.update');
    Route::delete('/user', App\Http\Controllers\Api\User\Delete::class)->name('user.delete');
    Route::get('/user/logout', App\Http\Controllers\Api\User\Logout::class)->name('user.logout');

    // Event routes
    Route::post('/event', App\Http\Controllers\Api\Event\Store::class)->name('event.store');
    Route::get('/event/{id}', App\Http\Controllers\Api\Event\Show::class)->name('event.show');
    Route::put('/event/{id}', App\Http\Controllers\Api\Event\Put::class)->name('event.update');
    Route::delete('/event/{id}', App\Http\Controllers\Api\Event\Delete::class)->name('event.delete');

    // Inscription routes
    Route::get('/inscription', App\Http\Controllers\Api\Inscription\Index::class)->name('inscription.index');
    Route::get('/inscription/{id}', App\Http\Controllers\Api\Inscription\Show::class)->name('inscription.show');
    Route::post('/inscription', App\Http\Controllers\Api\Inscription\Store::class)->name('inscription.store');
    Route::put('/inscription/{id}', App\Http\Controllers\Api\Inscription\Put::class)->name('inscription.update');
    Route::delete('/inscription/{id}', App\Http\Controllers\Api\Inscription\Delete::class)->name('inscription.delete');
});
// });
