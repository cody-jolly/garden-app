<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GardenController extends Controller
{
    /**
     * Display a listing of the user's gardens.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return Auth::user()->gardens()->get();
    }

    /**
     * Store a newly created garden in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'garden_name' => 'required|max:255'
        ]);

        $request->user()->gardens()->create([
            'name' => $request->garden_name
        ]);

        return back();
    }

    /**
     * Display the specified garden.
     *
     * @param  \App\Models\Garden  $garden
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $this->validate($request, [
            'garden_id' => 'required|max:255'
        ]);

        return $request->user()->gardens()->firstWhere('id', $request->garden_id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Garden  $garden
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $gardenId)
    {
        $this->validate($request, [
            'garden_name' => 'required|max:255'
        ]);

        $request->user()->gardens()->firstWhere('id', $gardenId)->update([
            'name' => $request->garden_name
        ]);

        return back();
    }

    /**
     * Remove the specified garden from storage.
     *
     * @param  \App\Models\Garden  $garden
     * @return \Illuminate\Http\Response
     */
    public function destroy($gardenId)
    {
        Auth::user()->gardens()->firstWhere('id', $gardenId)->delete();

        return back(303);
    }
}
