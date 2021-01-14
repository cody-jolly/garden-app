<?php
//TODO finish GardenController
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
}
