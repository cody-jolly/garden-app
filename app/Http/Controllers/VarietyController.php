<?php
// TODO finish VarietyContorller
namespace App\Http\Controllers;

use App\Models\Variety;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VarietyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:255',
            'weeksToMaturity' => 'required|int',
            'servingsPerM2' => 'required|int',
            'maxLowTemp' => 'required|int',
            'firstSowing' => 'required|int',
            'lastSowing' => 'required|int',
            'harvestWindow' => 'required|int',
            'multipleSowings' => 'required|int',
            'firstHarvest' => 'required|int',
            'lastHarvest' => 'required|int',
            'totalHarvests' => 'required|int',
            'totalSowings' => 'required|int',
        ]);

        Validator::make(['varietyId' => $id], ['varietyId' => 'required|int'])->validate();

        Variety::firstWhere('id', $id)->update([
            'variety_name' => $request->name,
            'weeks_to_maturity' => $request->weeksToMaturity,
            'servings_per_m2' => $request->servingsPerM2,
            'max_low_temp' => $request->maxLowTemp,
            'first_sowing' => $request->firstSowing,
            'last_sowing' => $request->lastSowing,
            'harvest_window' => $request->harvestWindow,
            'multiple_sowings' => $request->multipleSowings,
            'first_harvest' => $request->firstHarvest,
            'last_harvest' => $request->lastHarvest,
            'total_harvests' => $request->totalHarvests,
            'total_sowings' => $request->totalSowings,
        ]);

        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
