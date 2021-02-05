<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFirstHarvestLastHarvestTotalHarvestsTotalSowingsToVarietiesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('varieties', function (Blueprint $table) {
            $table->integer('first_harvest');
            $table->integer('last_harvest');
            $table->integer('total_harvests');
            $table->integer('total_sowings');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('varieties', function (Blueprint $table) {
            $table->dropColumn('first_harvest');
            $table->dropColumn('last_harvest');
            $table->dropColumn('total_harvests');
            $table->dropColumn('total_sowings');
        });
    }
}
