<?php
//TODO finish BedController
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
    ];

    /**
     * Get the garden that owns the bed.
     */
    public function bed()
    {
        return $this->belongsTo(Bed::class);
    }
}
