<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;

class AppTokenSeeder extends Seeder
{
    /**
     * Exécute le seeder pour insérer un token d'application générique.
     *
     * @return void
     */
    public function run(): void
    {
        DB::table('app_tokens')->insert([
            'name' => 'TokenExamen',
            'token' => 'TOKEN_EXAMEN_123456', // Valeur simple à communiquer
            'rate_limit' => 1000,
            'requests_count' => 0,
            'reset_at' => Carbon::now()->addDays(7),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
