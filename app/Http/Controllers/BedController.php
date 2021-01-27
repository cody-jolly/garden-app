<?php

namespace App\Http\Controllers;

use App\Models\Bed;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class BedController extends Controller
{
    /**
     * Display a listing of the garden's beds.
     *
     * @return Response
     */
    public function index()
    {
        return Auth::user()->beds()->get();
    }

    /**
     * Store a newly created bed in storage.
     *
     * @param Request $request
     * @return RedirectResponse
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'length'    => 'required|int',
            'width'     => 'required|int',
            'garden_id' => 'required|int',
        ]);

        $garden = $request->user()->gardens()->firstWhere('id', $request->garden_id);
        $bedNumber = 1;
        if ($garden->beds()->get()->last()) {
            $bedNumber = $garden->beds()->get()->last()->bed_number + 1;
        }
        $garden->beds()->create([
            'bed_number' => $bedNumber,
            'length' => $request->length,
            'width'  => $request->width,
        ]);

        return back();
    }

    /**
     * Display the specified bed.
     *
     * @param Request $request
     * @return Response
     */
    public function show(Request $request)
    {
        $this->validate($request, [
            'bed_id' => 'required|int'
        ]);

        if (Auth::check()) {
            return Bed::firstWhere('id', $request->bed_id);
        }
    }

    /**
     * Update the specified bed in storage.
     *
     * @param Request $request
     * @param $bedId
     * @return RedirectResponse
     */
    public function update(Request $request, $bedId)
    {
        $this->validate($request, [
            'length' => 'required|int',
            'width' => 'required|int',
        ]);

        Validator::make(['bedId' => $bedId], ['bedId' => 'required|int'])->validate();

        if (Auth::check()) {
            Bed::firstWhere('id', $bedId)->update([
                'length' => $request->length,
                'width' => $request->width,
            ]);

            return back();
        }
    }

    /**
     * Remove the specified bed from storage.
     *
     * @param  $bedId
     * @return RedirectResponse
     */
    public function destroy($bedId)
    {
        Validator::make(['bedId' => $bedId], ['bedId' => 'required|int'])->validate();

        if (Auth::check()) {
            Bed::firstWhere('id', $bedId)->delete();

            return back(303);
        }
    }
}
