<?php

namespace App\Http\Controllers;

/**
 * Contrôleur de base fournissant des méthodes utilitaires pour les réponses JSON.
 *
 * Cette classe étend le contrôleur principal de Laravel et fournit des méthodes
 * standardisées pour gérer les réponses JSON dans l'API.
 *
 * Méthodes disponibles :
 * - handleResponse() : Pour les réponses de succès avec données
 * - handleError() : Pour les réponses d'erreur
 */
class BaseController extends Controller
{
    /**
     * Génère une réponse JSON de succès avec données.
     *
     * Cette méthode standardise le format des réponses de succès en incluant
     * les données et un message descriptif. Utilisée par tous les contrôleurs
     * enfants pour maintenir une cohérence dans l'API.
     *
     * @param  mixed   $data     Les données à retourner (objet, collection, etc.)
     * @param  string  $message  Le message de succès à afficher
     * @param  int     $code     Le code de statut HTTP (défaut: 200)
     * @return \Illuminate\Http\JsonResponse  Réponse JSON formatée
     */
    public function handleResponse($data, $message, $code = 200)
    {
        return response()->json([
            'data' => $data,
            'message' => $message,
        ], $code);
    }

    /**
     * Génère une réponse JSON d'erreur.
     *
     * Cette méthode standardise le format des réponses d'erreur en incluant
     * uniquement un message d'erreur. Utilisée pour les erreurs de validation,
     * les ressources non trouvées, ou autres erreurs métier.
     *
     * @param  mixed   $message  Le message d'erreur (string ou collection d'erreurs)
     * @param  int     $code     Le code de statut HTTP (défaut: 404)
     * @return \Illuminate\Http\JsonResponse  Réponse JSON d'erreur formatée
     */
    public function handleError($message, $code = 404)
    {
        return response()->json([
            'message' => $message,
        ], $code);
    }
}
