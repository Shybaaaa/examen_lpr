<?php

namespace App\Http\Middleware;

use App\Http\Controllers\BaseController;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckRole extends BaseController
{
    /**
     * Vérifie si l'utilisateur authentifié possède le rôle requis.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $role  Le rôle requis (ex: 'admin')
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next, $role)
    {
        $user = $request->user();

        if (!$user || $user->role->name !== $role) {
            return $this->handleError('Accès refusé. Rôle insuffisant.', 403);
        }

        return $next($request);
    }
}
