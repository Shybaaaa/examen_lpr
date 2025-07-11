<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class Put extends BaseController
{
    /**
     * Met à jour les informations d'un utilisateur.
     *
     * Valide les données, met à jour l'utilisateur et retourne la réponse.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant les nouvelles données.
     * @return \Illuminate\Http\JsonResponse  L'utilisateur mis à jour ou les erreurs de validation.
     */
    public function __invoke(Request $request)
    {
        $valid = Validator::make($request->all(), [
            'name_utilisateur' => 'required|string|max:50',
            'email' => 'required|email|unique:users,email,' . $request->id,
            'password' => 'required|string|min:8',
        ]);

        if ($valid->fails()) {
            return $this->handleError($valid->errors(), 422);
        }

        $user = User::find($request->id);
        if (!$user) {
            return $this->handleError('Utilisateur non trouvé', 404);
        }

        $user->update($valid->validated());
        return $this->handleResponse($user, 'Utilisateur mis à jour');
    }
}
