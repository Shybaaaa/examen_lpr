<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class Store extends BaseController
{
    /**
     * Crée un nouvel utilisateur.
     *
     * Valide les données reçues, crée l'utilisateur et retourne une réponse JSON.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant les données de l'utilisateur.
     * @return \Illuminate\Http\JsonResponse  L'utilisateur créé ou les erreurs de validation.
     */
    public function __invoke(Request $request)
    {
        $valid = Validator::make($request->all(), [
            'name_utilisateur' => 'required|string|max:50|unique:users',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:8',
            'password_confirmation' => 'required|string|min:8|same:password',
        ]);

        if ($valid->fails()) {
            return $this->handleError($valid->errors(), 422);
        }

        $user = User::create($valid->validated());
        return $this->handleResponse($user, 'Utilisateur créé avec succès');
    }
}
