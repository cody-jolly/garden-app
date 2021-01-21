<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBedVarietyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bed_variety', function (Blueprint $table) {
            $table->id('id');
            $table->bigInteger('bed_id')->unsigned();
            $table->foreign('bed_id')
                ->references('id')
                ->on('beds')->onDelete('cascade');
            $table->bigInteger('variety_id')->unsigned();
            $table->foreign('variety_id')
                ->references('id')
                ->on('varieties')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bed_variety');
    }
}
