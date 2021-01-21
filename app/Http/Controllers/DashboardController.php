<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DashboardController extends Controller
{
    /**
     * Render Dashboard view with necessary data
     */
    public function index() {
        $gardens = Auth::user()->gardens()->get();
        $beds = Auth::user()->beds()->get();
        return Inertia::render('Dashboard', [
            'gardens' => $gardens,
            'beds' => $beds,
            ]);
    }
}