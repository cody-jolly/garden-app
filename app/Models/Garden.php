<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Garden extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'servings_per_harvest',
    ];

    /**
     * Get the beds for the garden.
     */
    public function beds()
    {
        return $this->hasMany(Bed::class);
    }

    /**
     * Get the user that owns the garden.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the varieties preferred for the garden.
     */
    public function varieties()
    {
        return $this->belongsToMany(Variety::class, 'preferred_varieties');
    }
}
