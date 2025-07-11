# Backend Laravel - Gestion d'Événements

Ce projet est une API backend Laravel pour la gestion d'événements, d'inscriptions et d'utilisateurs.

## Prérequis

-   PHP >= 8.1
-   Composer
-   MySQL ou MariaDB (ou autre SGBD compatible)
-   Node.js & npm (pour les assets front si besoin)

## Installation

1. **Cloner le dépôt**

```bash
git clone <url-du-repo>
cd backend
```

2. **Installer les dépendances PHP**

```bash
composer install
```

3. **Copier le fichier d'environnement et le configurer**

```bash
cp .env.example .env
```

-   Modifiez le fichier `.env` pour renseigner vos accès à la base de données :
    -   `DB_DATABASE=nom_de_votre_bdd`
    -   `DB_USERNAME=utilisateur`
    -   `DB_PASSWORD=motdepasse`

4. **Générer la clé d'application**

```bash
php artisan key:generate
```

5. **Lancer les migrations et les seeders**

```bash
php artisan migrate --seed
```

Cela va créer toutes les tables et remplir la base avec des utilisateurs et des événements de test.

6. **(Optionnel) Installer les dépendances front (si besoin)**

```bash
npm install
npm run build
```

7. **Démarrer le serveur de développement**

```bash
php artisan serve
```

L'API sera accessible sur [http://localhost:8000](http://localhost:8000)

## Structure du projet

-   `app/Models/` : Modèles Eloquent (User, Evenement, Inscription...)
-   `app/Http/Controllers/Api/` : Contrôleurs d'API REST
-   `database/migrations/` : Migrations de la base de données
-   `database/seeders/` : Seeders pour remplir la base avec des données de test
-   `routes/api.php` : Définition des routes API

## Commandes utiles

-   Lancer les migrations :
    ```bash
    php artisan migrate
    ```
-   Réinitialiser la base et reseeder :
    ```bash
    php artisan migrate:fresh --seed
    ```
-   Lancer les tests :
    ```bash
    php artisan test
    ```

## Remarques

-   Les seeders créent des utilisateurs, des événements et des inscriptions de test.
-   Vous pouvez modifier les seeders dans `database/seeders/` pour personnaliser les données.
-   Les images d'événements sont des URLs d'exemple.

---

Pour toute question, consultez la documentation Laravel : https://laravel.com/docs
