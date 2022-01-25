<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Disability extends Model
{
    use HasFactory;
    protected $table = 'ss_disability';

    public function person()
    {
        return $this->hasOne(Person_Disability::class, 'DisabilityId', 'Id');
    }
}
