<?php

namespace App\Http\Controllers\Api\Event;

use App\Http\Controllers\BaseController;
use App\Models\Evenement;
use Illuminate\Http\Request;

class Index extends BaseController
{
    /**
     * Récupère la liste de tous les événements.
     *
     * @param  \Illuminate\Http\Request  $request  La requête HTTP.
     * @return \Illuminate\Http\JsonResponse  La liste des événements.
     */
    public function __invoke(Request $request)
    {
        $events = Evenement::orderBy('created_at', 'desc')->get();
        return $this->handleResponse($events, "Tous les événements");
    }
}
