<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Candidate extends Model
{
    protected $table = 'candidates';
    protected $fillable = ['firstname', 'lastname', 'party_id'];

    public function party() {
        return $this->belongsTo('App\Party');
    }
}