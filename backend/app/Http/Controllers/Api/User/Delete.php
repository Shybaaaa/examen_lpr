<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class Delete extends BaseController
{
    /**
     * Supprime (soft delete) un utilisateur.
     *
     * Valide l'identifiant, supprime l'utilisateur (soft delete) et retourne la réponse.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant l'id de l'utilisateur.
     * @return \Illuminate\Http\JsonResponse  L'utilisateur supprimé ou une erreur si non trouvé.
     */
    public function __invoke(Request $request)
    {
        $valid = Validator::make($request->all(), [
            'id' => 'required|integer',
        ]);
        if ($valid->fails()) {
            return $this->handleError($valid->errors(), 422);
        }

        $user = User::find($request->id);
        if (!$user) {
            return $this->handleError('Utilisateur non trouvé', 404);
        }
        $user->delete();
        return $this->handleResponse($user, 'Utilisateur supprimé');
    }
}
