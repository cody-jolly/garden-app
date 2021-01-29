<?php


namespace App\Actions\VegProduction;


use App\Http\Controllers\Controller;
use App\Models\Garden;
use Illuminate\Support\Facades\Auth;

class CalculateVegProduction extends Controller
{
    /**
     * Calculate vegetable production for garden using varieties and beds.
     *
     * @param Garden $garden
     */
    public function calculate(Garden $garden)
    {
        if (Auth::check()) {
            $beds = $garden->beds();

        }
    }
}
