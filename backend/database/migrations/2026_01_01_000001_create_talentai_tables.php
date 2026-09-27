<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('candidates', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->text('parsed_skills')->nullable();
            $table->timestamps();
        });

        Schema::create('job_offers', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('required_skills');
            $table->enum('status', ['open', 'closed'])->default('open');
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('job_offers');
        Schema::dropIfExists('candidates');
    }
};
