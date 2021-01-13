<?php


namespace App\Models\Traits;

use Illuminate\Support\Str;

/**
 *
 * Adapted from Wilbur Powery https://dev.to/wilburpowery/easily-use-uuids-in-laravel-45be
 *
 * Implement random string Id.
 *
 */
trait UsesRandomId
{
    protected static function bootUsesRandomId()
    {
        static::creating(function ($model) {
            $model->id = (string) Str::random(30);
        });
    }
}
