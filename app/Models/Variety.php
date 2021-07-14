<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Variety extends Model
{
    use HasFactory, SoftDeletes;

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
        'first_harvest',
        'last_harvest',
        'total_harvests',
        'total_sowings',
        'multiple_sowings',
    ];

    protected $dates = ['deleted_at'];

    /**
     *  Disable timestamps for Variety model
     * @var bool
     */
    public $timestamps = false;

    /**
     * The beds that belong to the variety.
     */
    public function beds()
    {
        return $this->belongsToMany(Bed::class)->withPivot('area', 'sowing_week', 'first_harvest_week');
    }

    /**
     * The gardens that prefer the variety.
     */
    public function gardens()
    {
        return $this->belongsToMany(Garden::class, 'preferred_varieties');
    }
}
