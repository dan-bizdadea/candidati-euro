<?php
/**
 * Created by PhpStorm.
 * User: dan
 * Date: 24.01.2019
 * Time: 18:20
 */

namespace App;

use Illuminate\Database\Eloquent\Model;

class Criterion extends Model {
    protected $table = 'criteria';
    protected $fillable = ['name'];
}