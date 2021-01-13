<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBedsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('beds', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->integer('width');
            $table->integer('length');
            $table->string('garden_id'); // References gardens
            $table->timestamps();
        });

        Schema::table('beds', function($table) {
            $table->foreign('garden_id')
                ->references('id')
                ->on('gardens')
                ->onUpdate('cascade')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('beds');
    }
}
