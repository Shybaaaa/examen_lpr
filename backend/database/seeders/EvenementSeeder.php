<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class EvenementSeeder extends Seeder
{
    /**
     * Exécute le seeder pour insérer des événements de test.
     *
     * @return void
     */
    public function run(): void
    {
        // Récupérer tous les IDs d'utilisateurs disponibles
        $userIds = DB::table('users')->pluck('id')->toArray();

        if (empty($userIds)) {
            // Si aucun utilisateur n'existe, créer un utilisateur par défaut
            $userId = DB::table('users')->insertGetId([
                'name_utilisateur' => 'organisateur_default',
                'email' => 'organisateur@example.com',
                'password' => bcrypt('12345678'),
                'role_id' => 1,
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            $userIds = [$userId];
        }

        $evenements = [
            [
                'titre' => 'Conférence sur l\'Intelligence Artificielle',
                'description' => 'Une conférence passionnante sur les dernières avancées en IA et machine learning.',
                'date_evenement' => Carbon::now()->addDays(30)->setTime(14, 0),
                'lieu' => 'Centre de Congrès de Paris',
                'max_participants' => 200,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/ai-conference.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Atelier de Développement Web',
                'description' => 'Apprenez les bases du développement web moderne avec HTML, CSS et JavaScript.',
                'date_evenement' => Carbon::now()->addDays(15)->setTime(10, 0),
                'lieu' => 'École Supérieure du Digital',
                'max_participants' => 25,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/web-workshop.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Meetup Développeurs Laravel',
                'description' => 'Rencontrez d\'autres développeurs Laravel et partagez vos expériences.',
                'date_evenement' => Carbon::now()->addDays(7)->setTime(19, 30),
                'lieu' => 'Coworking Space TechHub',
                'max_participants' => 50,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/laravel-meetup.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Formation Sécurité Informatique',
                'description' => 'Découvrez les bonnes pratiques de sécurité pour protéger vos applications.',
                'date_evenement' => Carbon::now()->addDays(45)->setTime(9, 0),
                'lieu' => 'Institut de Cybersécurité',
                'max_participants' => 30,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/security-training.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Hackathon Innovation Sociale',
                'description' => '48h pour créer des solutions innovantes aux défis sociaux actuels.',
                'date_evenement' => Carbon::now()->addDays(60)->setTime(18, 0),
                'lieu' => 'Campus Innovation',
                'max_participants' => 100,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/hackathon.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Conférence DevOps et CI/CD',
                'description' => 'Maîtrisez les outils et pratiques DevOps pour optimiser votre pipeline de développement.',
                'date_evenement' => Carbon::now()->addDays(20)->setTime(13, 30),
                'lieu' => 'Tech Conference Center',
                'max_participants' => 150,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/devops-conference.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Atelier UX/UI Design',
                'description' => 'Créez des interfaces utilisateur intuitives et esthétiques.',
                'date_evenement' => Carbon::now()->addDays(25)->setTime(14, 0),
                'lieu' => 'Design Studio Paris',
                'max_participants' => 20,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/ux-workshop.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Meetup Data Science',
                'description' => 'Échangez sur les dernières tendances en science des données et analytics.',
                'date_evenement' => Carbon::now()->addDays(12)->setTime(18, 0),
                'lieu' => 'Data Science Hub',
                'max_participants' => 40,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/data-science-meetup.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Formation Cloud Computing',
                'description' => 'Découvrez AWS, Azure et Google Cloud pour déployer vos applications.',
                'date_evenement' => Carbon::now()->addDays(35)->setTime(10, 0),
                'lieu' => 'Cloud Academy',
                'max_participants' => 35,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/cloud-training.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'titre' => 'Conférence Blockchain et Crypto',
                'description' => 'Explorez l\'avenir de la blockchain et des cryptomonnaies.',
                'date_evenement' => Carbon::now()->addDays(50)->setTime(15, 0),
                'lieu' => 'Blockchain Innovation Center',
                'max_participants' => 120,
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/blockchain-conference.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ];

        // Insérer les événements
        foreach ($evenements as $evenement) {
            DB::table('evenements')->insert($evenement);
        }

        // Créer quelques événements supplémentaires avec des données aléatoires
        for ($i = 0; $i < 15; $i++) {
            $titres = [
                'Atelier de Programmation Python',
                'Conférence sur le Machine Learning',
                'Meetup Développeurs Frontend',
                'Formation Base de Données',
                'Hackathon Startup Weekend',
                'Conférence Architecture Logicielle',
                'Atelier API REST',
                'Meetup Mobile Development',
                'Formation Tests Automatisés',
                'Conférence Microservices',
            ];

            $lieux = [
                'Espace Coworking Central',
                'Université Paris Tech',
                'Centre de Formation Digital',
                'Tech Hub Innovation',
                'Campus Numérique',
                'Institut Supérieur Tech',
                'Espace Conférence Moderne',
                'Centre de Recherche IT',
                'Académie du Développement',
                'Hub Innovation Paris',
            ];

            $descriptions = [
                'Un événement passionnant pour découvrir les nouvelles technologies.',
                'Partagez vos connaissances et apprenez des autres développeurs.',
                'Formation pratique sur les outils modernes de développement.',
                'Conférence sur les tendances actuelles du développement logiciel.',
                'Atelier interactif pour améliorer vos compétences techniques.',
                'Meetup pour échanger sur les bonnes pratiques du développement.',
                'Formation complète sur les méthodologies agiles.',
                'Conférence sur l\'innovation technologique et ses impacts.',
                'Atelier pratique sur la sécurité des applications web.',
                'Meetup pour découvrir les frameworks modernes.',
            ];

            DB::table('evenements')->insert([
                'titre' => $titres[array_rand($titres)],
                'description' => $descriptions[array_rand($descriptions)],
                'date_evenement' => Carbon::now()->addDays(rand(5, 90))->setTime(rand(9, 20), rand(0, 59)),
                'lieu' => $lieux[array_rand($lieux)],
                'max_participants' => rand(15, 200),
                'user_id' => $userIds[array_rand($userIds)],
                'image_url' => 'https://example.com/images/event-' . rand(1, 10) . '.jpg',
                'status' => 'a',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
