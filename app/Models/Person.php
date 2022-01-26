<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
    use HasFactory;
    protected $table = 'ss_person';

    protected $fillable = [
        'IsActive',
    ];
    public function disability()
    {
        return $this->hasOne(Person_Disability::class, 'PersonId', 'Id');
    }
    public $timestamps = false;
}
