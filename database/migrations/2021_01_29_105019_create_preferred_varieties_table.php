<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePreferredVarietiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('preferred_varieties', function (Blueprint $table) {
            $table->id('id');
            $table->bigInteger('garden_id')->unsigned();
            $table->foreign('garden_id')
                ->references('id')
                ->on('gardens')->onDelete('cascade');
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
        Schema::dropIfExists('preferred_varieties');
    }
}
