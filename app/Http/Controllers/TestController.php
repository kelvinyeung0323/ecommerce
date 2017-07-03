<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Catalog;
class TestController extends Controller
{
    //
    public function index(){


        return view('test');

    }

    public function catalogTest(){
        $catalog = new Catalog();
        $catalog->cat_name='测试';
        $cat = Catalog::all();
//        var_dump($cat->cat_name);
        return response()->json($cat,200, [], JSON_UNESCAPED_UNICODE)->header("content-type","application/json;charset=utf8");
    }

}
