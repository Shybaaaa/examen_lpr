<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;

/**
 * Affiche les informations d'un utilisateur spécifique.
 *
 * @param  \Illuminate\Http\Request  $request  La requête HTTP.
 * @param  int  $id  L'identifiant de l'utilisateur à afficher.
 * @return \Illuminate\Http\JsonResponse  Les données de l'utilisateur ou une erreur si non trouvé.
 */
class Show extends BaseController
{
    public function __invoke(Request $request, $id)
    {
        $user = User::find($id);
        if (!$user) {
            return $this->handleError('Utilisateur non trouvé', 404);
        }
        return $this->handleResponse($user, 'Utilisateur trouvé');
    }
}
