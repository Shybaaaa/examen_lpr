<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Log;
use App\Models\AppToken;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckAppToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */

    public function handle(Request $request, Closure $next)
    {
        $token = $request->header('App-Token');

        if (!$token) {
            return response()->json(['error' => 'Token est requis'], 401);
        }

        $appToken = AppToken::where('token', hash('sha256', $token))->first();

        if (!$appToken) {
            return response()->json(['error' => 'Token invalide'], 403);
        }

        Log::info('API Request from ' . $appToken->name);

        // Vérification du quota
        $appToken->resetQuotaIfNeeded();

        if ($appToken->requests_count >= $appToken->rate_limit) {
            return response()->json(['error' => 'Limite de requete atteinte'], 429);
        }

        // Incrémenter le compteur de requêtes
        $appToken->increment('requests_count');

        return $next($request);
    }
}
