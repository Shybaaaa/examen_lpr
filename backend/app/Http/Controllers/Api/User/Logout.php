<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;

class Logout extends BaseController
{
    public function __invoke(Request $request)
    {
        $token = $request->header('Authorization');
        $token = str_replace('Bearer ', '', $token);

        $user = User::where('token', $token)->first();

        if (!$user) {
            return $this->handleError('Utilisateur non trouvé', 404);
        }

        $user->tokens()->delete();

        return $this->handleResponse($user, 'Utilisateur déconnecté avec succès');
    }
}
