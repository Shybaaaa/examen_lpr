<?php

namespace App\Http\Controllers\Api\Inscription;

use App\Http\Controllers\BaseController;
use App\Models\Inscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Contrôleur pour l'affichage d'inscriptions.
 *
 * Permet de récupérer les détails d'une inscription spécifique.
 */
class Show extends BaseController
{
    /**
     * Affiche les détails d'une inscription.
     *
     * Valide l'identifiant de l'inscription et retourne ses informations détaillées.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant l'id de l'inscription.
     * @return \Illuminate\Http\JsonResponse  Les détails de l'inscription ou une erreur.
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
            return $this->handleResponse($inscription, 'Inscription récupérée avec succès');
        } catch (\Exception $e) {
            return $this->handleError(['message' => 'Une erreur est survenue', 'error' => $e->getMessage()], 500);
        }
    }
}
