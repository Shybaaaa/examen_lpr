<?php

namespace App\Http\Controllers\Api\Event;

use App\Http\Controllers\BaseController;
use App\Models\Evenement;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

/**
 * Contrôleur pour la création d'événements.
 *
 * Permet de créer un nouvel événement avec validation des données.
 */
class Store extends BaseController
{
    /**
     * Crée un nouvel événement.
     *
     * Valide les données reçues et crée un nouvel événement dans la base de données.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP contenant les données de l'événement.
     * @return \Illuminate\Http\JsonResponse  L'événement créé ou les erreurs de validation.
     */
    public function __invoke(Request $request)
    {
        try {
            $valid = Validator::make($request->all(), [
                'titre' => 'required|string|max:255',
                'description' => 'required|string|max:255',
                'user_id' => 'required|integer|exists:users,id',
                'date_evenement' => 'required|date',
                'max_participants' => 'required|integer',
                'lieu' => 'required|string|max:255',
                // 'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);
            if ($valid->fails()) {
                return $this->handleError($valid->errors(), 422);
            }

            $event = Evenement::create($valid->validated());
            return $this->handleResponse($event, 'Événement créé');
        } catch (\Exception $e) {
            return $this->handleError(['message' => 'Une erreur est survenue', 'error' => $e->getMessage()], 500);
        }
    }
}
