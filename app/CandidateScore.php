<?php
/**
 * Created by PhpStorm.
 * User: dan
 * Date: 24.01.2019
 * Time: 18:21
 */

namespace App;

use Illuminate\Database\Eloquent\Model;

class CandidateScore extends Model
{
    protected $table = 'candidatescores';
    protected $fillable = ['user_id', 'candidate_id', 'criterion_id', 'note'];
}