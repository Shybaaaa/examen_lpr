<?php

namespace App\Http\Controllers\Api\Inscription;

use App\Http\Controllers\BaseController;
use App\Models\Inscription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

/**
 * Contrôleur pour la liste des inscriptions.
 *
 * Permet de récupérer toutes les inscriptions aux événements.
 */
class Index extends BaseController
{
    /**
     * Récupère la liste de toutes les inscriptions.
     *
     * Retourne toutes les inscriptions présentes dans la base de données.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP.
     * @return \Illuminate\Http\JsonResponse  La liste des inscriptions.
     */
    public function __invoke(Request $request)
    {

        $valid = Validator::make($request->all(), [
            'user_id' => 'required|integer',
        ]);

        if ($valid->fails()) {
            return $this->handleError($valid->errors(), 422);
        }

        try {
            $inscriptions = Inscription::where('user_id', $valid->validated()['user_id'])->with('evenement')->get();
            return $this->handleResponse($inscriptions, 'Inscriptions récupérées avec succès');
        } catch (\Exception $e) {
            return $this->handleError($e->getMessage(), 500);
        }
    }
}
