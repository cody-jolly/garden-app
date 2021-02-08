<?php


namespace App\Actions\VegProduction;


use App\Http\Controllers\Controller;
use App\Models\Bed;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class CalculateVegProduction extends Controller
{
    /**
     * Calculate vegetable production for garden using varieties and beds.
     *
     * @param Request
     */
    public function calculate(Request $request)
    {
        $this->validate($request, ['garden_id' => 'required|int',]);

        $garden = Auth::user()->gardens()->firstWhere('id', $request->garden_id);
        $garden->beds->each(function ($b) {
            $b->varieties()->detach();
        });

        $beds = $garden->beds;
        $varieties = $garden->varieties;
        $servings = $garden->servings_per_harvest;

        $bedKey = 0;
        $bedAreas = [];
        $sowing = 0;
        $totalSowings = [];
        forEach ($beds as $bed) {
            array_push($bedAreas, ($bed->width * $bed->length));
        }
        forEach ($varieties as $variety) {
            array_push($totalSowings, $variety->total_sowings);
        }

        // Plan available beds with varieties successively until all beds are filled, or all varieties have been planned
        while ($bedKey < $beds->count() && $sowing < max($totalSowings)) {
            // Go through all varieties for every sowing
            foreach ($varieties as $variety) {

                // Check if sowing is needed for variety, if so calculate first harvest week, sowing week and variety area for variety
                if ($sowing < $variety->total_sowings) {
                    $firstHarvestWeek = $variety->first_harvest + ($sowing * $variety->harvest_window);
                    $sowingWeek = $variety->first_sowing + ($sowing * $variety->harvest_window);
                    $varietyArea = ceil(((10000 / $variety->servings_per_m2) * $servings) * $variety->harvest_window);

                    // Fill beds with variety until needed area has been accounted for, move to next bed as needed
                    while ($varietyArea > 0 && $bedKey < $beds->count()) {
                        $currentBedId = $beds[$bedKey]->id;
                        if ($bedAreas[$bedKey] > $varietyArea) {
                            $currentArea = $varietyArea;
                            $bedAreas[$bedKey] -= $varietyArea;
                            $varietyArea = 0;
                        } else if ($bedAreas[$bedKey] < $varietyArea) {
                            $currentArea = $bedAreas[$bedKey];
                            $varietyArea -= $currentArea;
                            $bedKey++;
                        }
                        Bed::firstWhere('id', $currentBedId)->varieties()
                            ->attach($variety->id, [
                                "area" => $currentArea,
                                "sowing_week" => $sowingWeek,
                                "first_harvest_week" => $firstHarvestWeek,
                            ]);
                    }
                }
            }
            $sowing++;
        }

        return back();
    }
}
