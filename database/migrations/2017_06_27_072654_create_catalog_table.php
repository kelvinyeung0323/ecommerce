<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCatalogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('catalogs', function (Blueprint $table) {
            $table->increments('cat_id');
            $table->string('cat_name')->nullable();
            //default值
            $table->integer('cat_type')->default(0);
            $table->unsignedInteger('parent_id')->default(0);
            $table->integer('cat_lvl')->default(1);
            $table->string('remark')->nullable();
            $table->string('icon')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('catalog');
    }
}
