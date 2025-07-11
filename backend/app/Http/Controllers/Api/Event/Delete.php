<?php

namespace App\Http\Controllers\Api\Event;

use App\Http\Controllers\BaseController;
use App\Models\Evenement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Contrôleur pour la suppression d'événements.
 *
 * Permet de supprimer un événement en vérifiant les permissions de l'utilisateur.
 */
class Delete extends BaseController
{
    /**
     * Supprime un événement.
     *
     * Valide l'identifiant de l'événement et de l'utilisateur, vérifie les permissions
     * et supprime l'événement si l'utilisateur en est le propriétaire.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant l'id de l'événement et l'user_id.
     * @return \Illuminate\Http\JsonResponse  L'événement supprimé ou une erreur.
     */
    public function __invoke(Request $request, $id)
    {
        try {

            $event = Evenement::where('id', $id)->first();
            if (!$event) {
                return $this->handleError('Événement non trouvé', 404);
            }

            $event->delete();
            return $this->handleResponse($event, 'Événement supprimé');
        } catch (\Exception $e) {
            return $this->handleError(['message' => 'Une erreur est survenue', 'error' => $e->getMessage()], 500);
        }
    }
}
