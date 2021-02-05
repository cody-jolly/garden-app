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
        $garden->beds->each(function ($item, $key) {
            $item->varieties()->detach();
        });

        $beds = $garden->beds;
        $varieties = $garden->varieties;
        $servings = $garden->servings_per_harvest;

        $bed = 0;
        $totalSowings = [];
        $sowing = 0;
        $bedArea = $beds[$bed]->width * $beds[$bed]->length;
        foreach ($varieties as $variety) {
            array_push($totalSowings, $variety->total_sowings);
        }

        // Plan available beds with varieties successively until all beds are filled, or all varieties have been planned
        while ($bed < $beds->count() && $sowing < max($totalSowings)) {

            // Go through all varieties for every sowing
            foreach ($varieties as $variety) {

                // Check if sowing is needed for variety, if so calculate first harvest week, sowing week and variety area for variety
                if ($sowing < $variety->total_sowings) {
                    $firstHarvestWeek = $variety->first_harvest + ($sowing * $variety->harvest_window);
                    $sowingWeek = $variety->first_sowing + ($sowing * $variety->harvest_window);
                    $varietyArea = ceil(((10000 / $variety->servings_per_m2) * $servings) * $variety->harvest_window);

                    // Fill beds with variety until needed area has been accounted for, move to next bed as needed
                    if ($bedArea > $varietyArea) {
                        Bed::firstWhere('id', $beds[$bed]->id)->varieties()
                            ->attach($variety->id, [
                                "area" => $varietyArea,
                                "sowing_week" => $sowingWeek,
                                "first_harvest_week" => $firstHarvestWeek,
                            ]);
                        $bedArea -= $varietyArea;
                    } else if ($bedArea < $varietyArea) {
                        while ($varietyArea > 0 && $bed < $beds->count()) {
                            Bed::firstWhere('id', $beds[$bed]->id)->varieties()
                                ->attach($variety->id, [
                                    "area" => $bedArea,
                                    "sowing_week" => $sowingWeek,
                                    "first_harvest_week" => $firstHarvestWeek,
                                ]);
                            $varietyArea -= $bedArea;
                            $bed++;
                            if ($bed < $beds->count()) {
                                $bedArea = $beds[$bed]->width * $beds[$bed]->length;
                                Bed::firstWhere('id', $beds[$bed]->id)->varieties()
                                    ->attach($variety->id, [
                                        "area" => $varietyArea,
                                        "sowing_week" => $sowingWeek,
                                        "first_harvest_week" => $firstHarvestWeek,
                                    ]);
                                $bedArea -= $varietyArea;
                            }
                            $varietyArea = 0;
                        }
                    }
                }
            }
            $sowing++;
        }

        return back();
    }
}
