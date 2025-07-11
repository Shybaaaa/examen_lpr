<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\BaseController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class Login extends BaseController
{
    public function __invoke(Request $request)
    {
        $valid = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:8',
        ]);

        if ($valid->fails()) {
            return $this->handleError($valid->errors(), 422);
        }

        $user = User::where('email', $valid->validated()['email'])->first();

        if (!$user || !Hash::check($valid->validated()['password'], $user->password)) {
            return $this->handleError('Email ou mot de passe incorrect', 401);
        }
        $token = $user->createToken('authToken')->plainTextToken;


        return $this->handleResponse([
            'user' => $user,
            'token' => $token,
        ], 'Utilisateur connecté avec succès');
    }
}
