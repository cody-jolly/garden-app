<?php

namespace App\Http\Controllers;

use App\Models\Variety;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class DashboardController extends Controller
{
    /**
     * Render Dashboard view with necessary data
     */
    public function index() {
        $user = Auth::user();
        $gardens = $user->gardens()->get();
        $beds = $user->beds()->get();
        $gardens->each(function ($garden) {
            $garden["gardenVarieties"] = $garden->varieties()->get();
        });
        $beds->each(function ($bed) {
            $bed["bedVarieties"] = $bed->varieties()->get();
        });

        return Inertia::render('Dashboard', [
            'user' => $user,
            'gardens' => $gardens,
            'beds' => $beds,
            'varieties' => Variety::get(),
        ]);
    }
}
