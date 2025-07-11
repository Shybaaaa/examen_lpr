<?php

namespace App\Http\Controllers\Api\Inscription;

use App\Http\Controllers\BaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Inscription;

/**
 * Contrôleur pour la mise à jour d'inscriptions.
 *
 * Permet de modifier les informations d'une inscription.
 */
class Put extends BaseController
{
    /**
     * Met à jour une inscription.
     *
     * Valide l'identifiant de l'inscription et met à jour ses informations
     * avec les données reçues dans la requête.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant les données à mettre à jour.
     * @return \Illuminate\Http\JsonResponse  L'inscription mise à jour ou une erreur.
     */
    public function __invoke(Request $request)
    {
        try {
            $valid = Validator::make($request->all(), [
                'id' => 'required|integer',
            ]);
            if ($valid->fails()) {
                return $this->handleError($valid->errors(), 422);
            }
            $inscription = Inscription::find($request->id);
            if (!$inscription) {
                return $this->handleError('Inscription non trouvée', 404);
            }
            $inscription->update($request->all());
            return $this->handleResponse($inscription, 'Inscription mise à jour avec succès');
        } catch (\Exception $e) {
            return $this->handleError(['message' => 'Une erreur est survenue', 'error' => $e->getMessage()], 500);
        }
    }
}
