<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Variety;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use Laravel\Fortify\Contracts\UpdatesUserPasswords;

class AdminController extends Controller
{
    /**
     * Show the Admin dashboard if user is admin
     *
     */
    public function index()
    {
        return Inertia::render('Admin', [
            'users' => User::get(),
            'varieties' => Variety::get(),
        ]);
    }

    /**
     * Update the specified user in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function updateUser(Request $request)
    {
        $user = User::firstWhere('id', $request->userId);

        if ($user->isEmpty) {
            return back('406');
        }

        Validator::make($request->all(), [
            'userId' => 'required|integer',
            'name' => 'required|string|max:255',
            'photo' => 'nullable|image|max:1024',
            'email' => 'required', 'email', 'max:255',
            Rule::unique('users')->ignore($user),
        ])->validateWithBag('updateProfileInformation');

        if (isset($request['photo'])) {
            $user->updateProfilePhoto($request['photo']);
        }

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        return back();
    }

    /**
     * Delete the specified user's profile photo.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function deleteProfilePhoto(Request $request)
    {
        $this->validate($request, [
            'userId' => 'required|int',
        ]);

        User::firstWhere('id', $request->userId)->deleteProfilePhoto();

        return back(303)->with('status', 'profile-photo-deleted');
    }

    /**
     * Update the user's password.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Laravel\Fortify\Contracts\UpdatesUserPasswords  $updater
     * @return \Illuminate\Http\RedirectResponse
     */
    public function updatePassword(Request $request, UpdatesUserPasswords $updater)
    {
        $this->validate($request, [
            'userId' => 'required|int',
        ]);

        $user = User::firstWhere('id', $request->userId);

        $updater->update($user, $request->all());

        return back();
    }
}
