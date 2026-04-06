<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('projects', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade')->comment('Le client attribué au projet');
            $table->string('name')->comment('Ex: "Résidence Sunrise"');
            $table->string('location')->comment('Ville ou quartier');
            $table->integer('progress')->default(0)->comment('Pourcentage d\'avancement');
            $table->string('status')->comment('Ex: "Finitions en cours"');
            $table->string('image_path')->comment('URL de l\'image du bâtiment');
            $table->decimal('total_value', 15, 2)->comment('Pour calculer le CA (Chiffre d\'Affaires)');
            $table->date('delivery_date')->comment('Date prévue de remise des clés');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('projects');
    }
};
