<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVarietiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('varieties', function (Blueprint $table) {
            $table->id();
            $table->string('variety_name');
            $table->integer('weeks_to_maturity');
            $table->integer('servings_per_m2');
            $table->integer('max_low_temp');
            $table->integer('first_sowing');
            $table->integer('last_sowing')->nullable();
            $table->integer('harvest_window');
            $table->boolean('multiple_sowings');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('varieties');
    }
}
