<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class GardenController extends Controller
{
    /**
     * Display a listing of the user's gardens.
     *
     * @return Response
     */
    public function index()
    {
       return Auth::user()->gardens()->get();
    }

    /**
     * Store a newly created garden in storage.
     *
     * @param Request $request
     * @return RedirectResponse
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
            'servings' => 'required|int',
        ]);

        $request->user()->gardens()->create([
            'name' => $request->name,
            'servings_per_harvest' => $request->servings,
        ]);

        return back();
    }

    /**
     * Display the specified garden.
     *
     * @param Request $request
     * @return Response
     */
    public function show(Request $request)
    {
        $this->validate($request, [
            'garden_id' => 'required|int'
        ]);

        return $request->user()->gardens()->firstWhere('id', $request->garden_id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param  $gardenId
     * @return RedirectResponse
     */
    public function update(Request $request, $gardenId)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
            'servings' => 'required|int',
        ]);

        $request->user()->gardens()->firstWhere('id', $gardenId)->update([
            'name' => $request->name,
            'servings_per_harvest' => $request->servings,
        ]);

        return back();
    }

    /**
     * Remove the specified garden from storage.
     *
     * @param  $gardenId
     * @return RedirectResponse
     */
    public function destroy($gardenId)
    {
        Validator::make(['gardenId' => $gardenId], ['gardenId' => 'required|int'])->validate();

        Auth::user()->gardens()->firstWhere('id', $gardenId)->delete();

        return back(303);
    }
}
