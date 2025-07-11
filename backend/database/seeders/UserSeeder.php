<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserSeeder extends Seeder
{
    /**
     * Exécute le seeder pour insérer des utilisateurs de base avec des name_utilisateur aléatoires.
     *
     * @return void
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'name_utilisateur' => 'admin_' . Str::random(6),
                'email' => 'admin' . Str::random(6) . '@example.com',
                'password' => Hash::make('12345678'),
                'role_id' => 2,
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ]
        ]);

        for ($i = 0; $i < 200; $i++) {
            DB::table('users')->insert([
                'name_utilisateur' => 'user_' . Str::random(6),
                'email' => 'user' . Str::random(6) . '@example.com',
                'password' => Hash::make('12345678'),
                'role_id' => 1,
                'status' => 'a',
            ]);
        }
    }
}
