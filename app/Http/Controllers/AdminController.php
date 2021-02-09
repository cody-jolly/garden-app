<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class AdminController extends Controller
{
    /**
     * Show the Admin dashboard if user is admin
     *
     */
    public function index()
    {
        if (Auth::user()->admin === 1) {
            return Inertia::render('Admin', [
                'user' => Auth::user(),
            ]);
        }

        return redirect()->route('dashboard');
    }
}
