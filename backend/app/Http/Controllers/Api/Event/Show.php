<?php

namespace App\Http\Controllers\Api\Event;

use App\Http\Controllers\BaseController;
use App\Models\Evenement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Contrôleur pour l'affichage d'événements.
 *
 * Permet de récupérer les détails d'un événement spécifique avec ses relations.
 */
class Show extends BaseController
{
    /**
     * Affiche les détails d'un événement.
     *
     * Valide l'identifiant de l'événement, le récupère avec ses relations
     * (utilisateur créateur et inscriptions) et retourne les données.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant l'id de l'événement.
     * @return \Illuminate\Http\JsonResponse  Les détails de l'événement ou une erreur.
     */
    public function __invoke(Request $request, $id)
    {
        try {
            $event = Evenement::find($id);
            if (!$event) {
                return $this->handleError('Événement non trouvé', 404);
            }

            $event->load('user');
            $event->load('inscriptions');

            return $this->handleResponse($event, 'Événement trouvé');
        } catch (\Exception $e) {
            return $this->handleError(['message' => 'Une erreur est survenue', 'error' => $e->getMessage()], 500);
        }
    }
}
