<?php

namespace App\Http\Controllers\Api\Inscription;

use App\Http\Controllers\BaseController;
use App\Models\Inscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Contrôleur pour la suppression d'inscriptions.
 *
 * Permet de supprimer une inscription à un événement.
 */
class Delete extends BaseController
{
    /**
     * Supprime une inscription.
     *
     * Valide l'identifiant de l'inscription et la supprime de la base de données.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant l'id de l'inscription.
     * @return \Illuminate\Http\JsonResponse  L'inscription supprimée ou une erreur.
     */
    public function __invoke(Request $request, $id)
    {
        try {
            $valid = Validator::make($request->all(), [
                'user_id' => 'required|integer',
            ]);
            if ($valid->fails()) {
                return $this->handleError($valid->errors(), 422);
            }
            $inscription = Inscription::where('id', $id)->where('user_id', $valid->validated()['user_id'])->first();
            if (!$inscription) {
                return $this->handleError('Inscription non trouvée', 404);
            }

            $inscription->delete();
            return $this->handleResponse($inscription, 'Inscription supprimée avec succès');
        } catch (\Exception $e) {
            return $this->handleError($e->getMessage(), 500);
        }
    }
}
