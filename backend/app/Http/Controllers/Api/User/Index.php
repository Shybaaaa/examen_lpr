<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;

/**
 * Récupère la liste de tous les utilisateurs.
 *
 * @param  \Illuminate\Http\Request  $request  La requête HTTP.
 * @return \Illuminate\Http\JsonResponse  La liste des utilisateurs.
 */
class Index extends BaseController
{
    public function __invoke(Request $request)
    {
        $perPage = $request->get('per_page', 20);
        $users = User::simplePaginate($perPage);
        return $this->handleResponse($users, "Tous les utilisateurs");
    }
}
