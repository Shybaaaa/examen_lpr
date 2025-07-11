<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class Restore extends BaseController
{
    /**
     * Restaure un utilisateur supprimé (soft deleted).
     *
     * Valide l'identifiant, restaure l'utilisateur et retourne la réponse.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant l'id de l'utilisateur.
     * @return \Illuminate\Http\JsonResponse  L'utilisateur restauré ou une erreur si non trouvé.
     */
    public function __invoke(Request $request)
    {
        $valid = Validator::make($request->all(), [
            'id' => 'required|integer',
        ]);
        if ($valid->fails()) {
            return $this->handleError($valid->errors(), 422);
        }

        $user = User::withTrashed($request->id);
        if (!$user) {
            return $this->handleError('Utilisateur non trouvé', 404);
        }

        $user->restore();
        return $this->handleResponse($user, 'Utilisateur restauré');
    }
}
