<?php

namespace App\Http\Controllers\Portal;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Catalog;
class CatalogController extends Controller
{
    //
    public function getCatTree(){
        $cats = Catalog::all();
        $catTree = self::getTree($cats);
        return response()->json($catTree,200, [], JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)->header("content-type","application/json;charset=utf8");

    }


    private function getTree($data=[]){
            $result = [];
            foreach($data as $cat){
                if($cat->cat_lvl==1){
                    $item1["cat_id"]=$cat->cat_id;
                    $item1["cat_name"]=$cat->cat_name;
                    $item1["icon"]=$cat->icon;
                    $child2=[];
                    foreach($data as $cat2){

                        if($cat2->cat_lvl==2 && $cat2->parent_id==$cat->cat_id){
                            $item2["cat_id"]=$cat2->cat_id;
                            $item2["cat_name"]=$cat2->cat_name;
                            $child3=[];
                            foreach($data as $cat3){
                               if($cat3->cat_lvl == 3 && $cat3->parent_id==$cat2->cat_id){
                                   $item3["cat_id"]=$cat3->cat_id;
                                   $item3["cat_name"]=$cat3->cat_name;
                                   array_push($child3,$item3);
                               }
                            }
                            $item2["childs"]=$child3;
                            array_push($child2,$item2);
                        }

                    }
                    $item1["childs"]=$child2;
                    array_push($result,$item1);

                }
            }



        return $result;

    }
}
