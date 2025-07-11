# Eventify Frontend

Bienvenue sur le frontend de l'application **Eventify** !

## 🚀 Prérequis

- Node.js >= 18.x
- npm >= 9.x

## ⚡ Installation

1. **Cloner le dépôt**

   ```bash
   git clone <url-du-repo>
   cd frontend
   ```

2. **Installer les dépendances**

   ```bash
   npm install
   ```

3. **Configurer l'API**
   - Vérifiez que le fichier `axiosInstance.tsx` pointe bien vers l'URL de votre backend Laravel.

## 🏁 Lancer le projet en développement

```bash
npm run dev
```

- L'application sera accessible sur [http://localhost:5173](http://localhost:5173) par défaut.

## 🏗️ Build de production

```bash
npm run build
npm run preview
```

- Les fichiers optimisés seront générés dans le dossier `dist/`.

## 🧪 Linter & vérification du code

- Pour vérifier la qualité du code :
  ```bash
  npm run lint
  ```
- Pour corriger automatiquement certains problèmes :
  ```bash
  npm run lint -- --fix
  ```

## 📚 Fonctionnalités principales

- **Inscription / Connexion** avec gestion des rôles (admin, organisateur, utilisateur)
- **Création, modification, suppression d'événements** (organisateur/admin)
- **Inscription à un événement**
- **Affichage des événements** avec pagination
- **Affichage du nombre d'inscrits**
- **Réservations personnelles**
- **Navigation dynamique selon le rôle**

## 🗂️ Structure du projet

- `src/pages/` : Pages principales (auth, home, events, etc.)
- `src/components/` : Composants réutilisables (Navbar, ProtectedRoute...)
- `src/partials/` : Composants de sections (EventsCase, EventsGrid...)
- `src/assets/` : Images, CSS, etc.

## 🔒 Authentification

- Le token et les infos utilisateur sont stockés dans le localStorage.
- Les routes sont protégées selon le rôle de l'utilisateur.

## 🛠️ Dépendances principales

- React 18
- TypeScript
- Vite
- Formik & Yup (gestion des formulaires)
- Axios
- React Hot Toast
- TailwindCSS

## ✨ Conseils

- Pour modifier les rôles ou les droits, voir la logique dans `Navbar.tsx` et les routes protégées.
- Pour ajouter des pages, créez un fichier dans `src/pages/` et ajoutez la route dans `src/main.tsx`.

---

**Bon développement avec Eventify !**
