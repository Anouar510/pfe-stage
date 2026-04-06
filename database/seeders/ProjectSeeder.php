<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Project;
use App\Models\User;

class ProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $client = User::where('email', 'client@bakkah.com')->first();

        if ($client) {
            $p1 = Project::create([
                'user_id' => $client->id,
                'name' => 'Résidence Sunrise',
                'location' => 'Casablanca, Maroc',
                'progress' => 65,
                'status' => 'Gros œuvre terminé',
                'image_path' => 'luxury_apartment.png',
                'total_value' => 1200000,
                'delivery_date' => '2026-10-15',
            ]);
            $p1->steps()->createMany([
                ['label' => 'Terrassement', 'status' => 'completed', 'order_num' => 1],
                ['label' => 'Fondations', 'status' => 'completed', 'order_num' => 2],
                ['label' => 'Gros Œuvre', 'status' => 'completed', 'order_num' => 3],
                ['label' => 'Second Œuvre', 'status' => 'in_progress', 'order_num' => 4],
            ]);

            $p2 = Project::create([
                'user_id' => $client->id,
                'name' => 'Villa Prestige',
                'location' => 'Marrakech, Maroc',
                'progress' => 80,
                'status' => 'Finitions en cours',
                'image_path' => 'luxury_villa.png',
                'total_value' => 2500000,
                'delivery_date' => '2026-08-20',
            ]);
            $p2->steps()->createMany([
                ['label' => 'Gros Œuvre', 'status' => 'completed', 'order_num' => 1],
                ['label' => 'Platrerie', 'status' => 'completed', 'order_num' => 2],
                ['label' => 'Peinture', 'status' => 'in_progress', 'order_num' => 3],
            ]);

            $p3 = Project::create([
                'user_id' => $client->id,
                'name' => 'Tech Hub Tower',
                'location' => 'Rabat, Maroc',
                'progress' => 45,
                'status' => 'Structure R+8',
                'image_path' => 'business_center.png',
                'total_value' => 8500000,
                'delivery_date' => '2027-01-30',
            ]);
            $p3->steps()->createMany([
                ['label' => 'Fondations', 'status' => 'completed', 'order_num' => 1],
                ['label' => 'Structure Béton', 'status' => 'in_progress', 'order_num' => 2],
                ['label' => 'Façade Vitrée', 'status' => 'pending', 'order_num' => 3],
            ]);
        }
    }
}
