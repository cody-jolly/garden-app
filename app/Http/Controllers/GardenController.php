<?php

namespace App\Http\Controllers;

use App\Models\Variety;
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
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
        ]);

        $request->user()->gardens()->create([
            'name' => $request->name,
            'servings_per_harvest' => 0, //TODO possibly rethink DB structure or make nullable
        ]);

        return back();
    }

    /**
     * Display the specified garden.
     *
     * @param Request $request
     * @return Response
     * @throws \Illuminate\Validation\ValidationException
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
     * @param Integer $gardenId
     * @return RedirectResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update(Request $request, $gardenId)
    {
        $this->validate($request, [
            'name' => 'required|max:255',
            'servings' => 'required|int',
            'preferredVarieties' => 'array',
            'preferredVarieties.*' => 'int',
        ]);

        Validator::make(['gardenId' => $gardenId], ['gardenId' => 'required|int'])->validate();

        $garden = $request->user()->gardens()->firstWhere('id', $gardenId);

        $garden->update([
            'name' => $request->name,
            'servings_per_harvest' => $request->servings,
        ]);

        $garden->varieties()->sync(Variety::find($request->preferredVarieties));

        return back();
    }

    /**
     * Remove the specified garden from storage.
     *
     * @param  $gardenId
     * @return RedirectResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function destroy($gardenId)
    {
        Validator::make(['gardenId' => $gardenId], ['gardenId' => 'required|int'])->validate();

        Auth::user()->gardens()->firstWhere('id', $gardenId)->delete();

        return back(303);
    }
}
