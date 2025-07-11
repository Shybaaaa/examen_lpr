<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AppToken extends Model
{
    protected $fillable = ['name', 'token', 'rate_limit', 'requests_count', 'reset_at'];

    public function resetQuotaIfNeeded()
    {
        // Si le quota est expiré, on réinitialise le compteur
        if ($this->reset_at && now()->greaterThan($this->reset_at)) {
            $this->requests_count = 0;
            $this->reset_at = now()->addDay(); // Réinitialisation quotidienne
            $this->save();
        }
    }
}
