<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Project;
use App\Models\User;

class ExtraProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Try to find an existing client or just grab any user or create one
        $client = User::where('role', 'client')->first();
        
        if (!$client) {
            $client = User::first();
        }

        if ($client) {
            $p4 = Project::create([
                'user_id' => $client->id,
                'name' => 'Immeuble Horizon',
                'location' => 'Agadir, Maroc',
                'progress' => 20,
                'status' => 'Gros œuvre en cours',
                'image_path' => 'luxury_apartment.png',
                'total_value' => 5000000,
                'delivery_date' => '2028-05-15',
            ]);
            $p4->steps()->createMany([
                ['label' => 'Préparation de chantier', 'status' => 'completed', 'order_num' => 1],
                ['label' => 'Terrassement', 'status' => 'completed', 'order_num' => 2],
                ['label' => 'Fondations', 'status' => 'in_progress', 'order_num' => 3],
                ['label' => 'Élévation des murs', 'status' => 'pending', 'order_num' => 4],
            ]);

            $p5 = Project::create([
                'user_id' => $client->id,
                'name' => 'Centre Commercial Al Madina',
                'location' => 'Fès, Maroc',
                'progress' => 10,
                'status' => 'Démarrage',
                'image_path' => 'business_center.png',
                'total_value' => 18000000,
                'delivery_date' => '2029-12-01',
            ]);
            $p5->steps()->createMany([
                ['label' => 'Études et plans', 'status' => 'completed', 'order_num' => 1],
                ['label' => 'Obtention des permis', 'status' => 'completed', 'order_num' => 2],
                ['label' => 'Installation de chantier', 'status' => 'in_progress', 'order_num' => 3],
                ['label' => 'Gros œuvre', 'status' => 'pending', 'order_num' => 4],
            ]);

            $p6 = Project::create([
                'user_id' => $client->id,
                'name' => 'Complexe Sportif Atlas',
                'location' => 'Tanger, Maroc',
                'progress' => 95,
                'status' => 'Finitions finales',
                'image_path' => 'luxury_villa.png',
                'total_value' => 7500000,
                'delivery_date' => '2026-04-10',
            ]);
            $p6->steps()->createMany([
                ['label' => 'Gros œuvre', 'status' => 'completed', 'order_num' => 1],
                ['label' => 'Charpente et couverture', 'status' => 'completed', 'order_num' => 2],
                ['label' => 'Équipements sportifs', 'status' => 'completed', 'order_num' => 3],
                ['label' => 'Aménagements extérieurs', 'status' => 'in_progress', 'order_num' => 4],
            ]);
        }
    }
}
