<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Catalog extends Model
{
    //
    protected $table = 'catalogs';
    protected $primaryKey = 'cat_id';
    protected $hidden=['updated_at','created_at'];//要隐藏的字段
    //protected $visiable = ['name'];//要显示的字段

}
