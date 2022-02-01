<?php

use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('login');
});
Route::get('usuarios', [UsuarioController::class, 'index']);
Route::get('cargarDatos', [UsuarioController::class, 'cargarDatos']);
Route::put('/usuario', [UsuarioController::class, 'update']);
Route::post('/usuario', [UsuarioController::class, 'delete']);
Route::get('/buscar', [UsuarioController::class, 'buscarDB']);

// Auth::routes();
Route::get('login', function () {
    return view('login');
});
Route::post('login', [UsuarioController::class, 'autenticacion'])->name('auth.login');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
