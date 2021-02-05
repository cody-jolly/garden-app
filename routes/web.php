<?php

use \App\Actions\VegProduction\CalculateVegProduction;
use App\Http\Controllers\BedController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\GardenController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

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
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
    ]);
});

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

Route::middleware(['auth:sanctum'])->group(function () {
    Route::resource('gardens', GardenController::class)->except('create', 'edit');
    Route::resource('beds', BedController::class)->except('create', 'edit');
    Route::post('/gardens/prefer-varieties', [GardenController::class, 'preferVarieties'])->name('gardens.prefer-varieties');
    Route::post('/calculate-veg-production', [CalculateVegProduction::class, 'calculate'])->name('calculate-veg-production');
});
