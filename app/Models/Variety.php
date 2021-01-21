<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Variety extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'variety_name',
        'weeks_to_maturity',
        'servings_per_m2',
        'max_low_temp',
        'first_sowing',
        'last_sowing',
        'harvest_window',
        'multiple_sowings',
    ];

    /**
     * The beds that belong to the variety.
     */
    public function beds()
    {
        return $this->belongsToMany(Bed::class);
    }
}
