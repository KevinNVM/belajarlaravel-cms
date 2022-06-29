<?php

use App\Http\Controllers\AdminCategoryController;
use App\Models\Category;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\DashboardPostController;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

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
    return view('home', [
        'title' => 'Home',
    ]);
})->name('home.index');

Route::get('/home', function () {
    return view('home', [
        'title' => 'Home',
    ]);
})->name('home.index');

Route::get('/about', function () {
    return view('about', [
        'title' => 'About',
        'name' => 'Made Kevin Darmawan',
        'email' => 'buzz.kevindarmawan@gmail.com',
    ]);
})->name('home.about');

Route::get('/blog', [PostController::class, 'index'])->name('blog.index');


Route::get('/posts/{post:slug}', [PostController::class, 'show'])->name('blog.post');

Route::get('/blog/categories', function() {
    return view('categories', [
        'title' => 'Post Categories',
        'category' => Category::all(),
    ]);
})->name('blog.categories');

Route::get('/dashboard', fn() =>
    view('dashboard/index', [
        'title' => 'Dashboard'
    ]))->name('dashboard.index')->middleware('auth');

Route::resource('/dashboard/posts', DashboardPostController::class)->middleware('auth');

// Route::get('/dashboard/post/checkSlug', [DashboardPostController::class, 'checkSlug'])->middleware('auth');
Route::get('/dashboard/utilities/sluggifier', [DashboardPostController::class, 'checkSlug']);


#Auth Routes
Route::get('/login', [LoginController::class, 'index'])->name('auth.login')->middleware('guest');
Route::post('/login', [LoginController::class, 'auth'])->name('auth.login');

Route::get('/register', [RegisterController::class, 'index'])->name('auth.register')->middleware('guest');
Route::post('/register', [RegisterController::class, 'store'])->name('auth.register');

Route::post('/logout', [LoginController::class, 'logout'])->middleware('auth')->name('auth.logout');

#Admin Routes
Route::resource('/dashboard/categories', AdminCategoryController::class)->except('show')->middleware('is_admin');