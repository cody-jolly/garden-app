<?php


namespace App\Models\Traits;

use Illuminate\Support\Str;

/**
 *
 * Adapted from Wilbur Powery https://dev.to/wilburpowery/easily-use-uuids-in-laravel-45be
 *
 * Implements uuid usage for a Model's id in DB
 *
 */
trait UsesUuid
{
    protected static function bootUsesUuid()
    {
        static::creating(function ($model) {
            $model->user_id = (string) Str::uuid();
        });
    }
}
