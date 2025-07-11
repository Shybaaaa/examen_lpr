<?php

namespace App\Http\Controllers\Api\Event;

use App\Http\Controllers\BaseController;
use App\Models\Evenement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Contrôleur pour la mise à jour d'événements.
 *
 * Permet de modifier un événement en vérifiant les permissions de l'utilisateur.
 */
class Put extends BaseController
{
    /**
     * Met à jour un événement.
     *
     * Valide les données reçues, vérifie que l'utilisateur est le propriétaire
     * de l'événement et met à jour les informations.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant les données à mettre à jour.
     * @return \Illuminate\Http\JsonResponse  L'événement mis à jour ou une erreur.
     */
    public function __invoke(Request $request, $id)
    {
        try {
            $valid = Validator::make($request->all(), [
                'titre' => 'required|string|max:255',
                'description' => 'required|string|max:255',
                'lieu' => 'required|string|max:255',
                'date_evenement' => 'required|date',
                'max_participants' => 'required|integer',
            ]);
            if ($valid->fails()) {
                return $this->handleError($valid->errors(), 422);
            }

            $event = Evenement::where('id', $id)->first();
            if (!$event) {
                return $this->handleError('Événement non trouvé', 404);
            }

            $event->update($valid->validated());
            return $this->handleResponse($event, 'Événement mis à jour');
        } catch (\Exception $e) {
            return $this->handleError(['message' => 'Une erreur est survenue', 'error' => $e->getMessage()], 500);
        }
    }
}
