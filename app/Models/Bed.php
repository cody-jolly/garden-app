<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bed extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'width',
        'length',
        'bed_number',
    ];

    /**
     * Get the garden that owns the bed.
     */
    public function garden()
    {
        return $this->belongsTo(Garden::class);
    }

    /**
     * The varieties that belong to the bed.
     */
    public function varieties()
    {
        return $this->belongsToMany(Variety::class)->withPivot('area', 'sowing_week', 'first_harvest_week');
    }
}
