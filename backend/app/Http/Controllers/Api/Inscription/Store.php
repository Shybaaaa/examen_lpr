<?php

namespace App\Http\Controllers\Api\Inscription;

use App\Http\Controllers\BaseController;
use App\Models\Inscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Contrôleur pour la création d'inscriptions.
 *
 * Permet de créer une nouvelle inscription à un événement.
 */
class Store extends BaseController
{
    /**
     * Crée une nouvelle inscription.
     *
     * Valide les données reçues (user_id et evenement_id) et crée
     * une nouvelle inscription dans la base de données.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant les données de l'inscription.
     * @return \Illuminate\Http\JsonResponse  L'inscription créée ou les erreurs de validation.
     */
    public function __invoke(Request $request)
    {
        try {
            $valid = Validator::make($request->all(), [
                'user_id' => 'required|integer',
                'evenement_id' => 'required|integer',
            ]);
            if ($valid->fails()) {
                return $this->handleError($valid->errors(), 422);
            }
            $inscription = Inscription::create($valid->validated());
            return $this->handleResponse($inscription, 'Inscription créée avec succès');
        } catch (\Exception $e) {
            return $this->handleError(['message' => 'Une erreur est survenue', 'error' => $e->getMessage()], 500);
        }
    }
}
