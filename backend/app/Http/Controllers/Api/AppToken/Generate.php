<?php

namespace App\Http\Controllers\Api\AppToken;

use App\Http\Controllers\BaseController;
use App\Models\AppToken;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

class Generate extends BaseController
{
    public function __invoke(Request $request)
    {
        try {
            $isValid = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
            ]);

            if ($isValid->fails()) {
                return $this->handleError($isValid->errors(), 422);
            }

            $token = Str::random(60);
            AppToken::create([
                'name' => $isValid->validated()['name'],
                'token' => hash('sha256', $token),
                'rate_limit' => 1000, // Limite par défaut
                'reset_at' => now()->addDay(), // Réinitialisation quotidienne
            ]);

            return $this->handleResponse([
                'name' => $isValid->validated()['name'],
                'token' => $token,
            ], 'Token généré avec succès');
        } catch (\Exception $e) {
            return $this->handleError($e->getMessage(), 500);
        }
    }
}
