<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Modèle Evenement.
 *
 * Représente un événement dans l'application avec ses propriétés
 * et ses relations avec les utilisateurs et les inscriptions.
 */
class Evenement extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * Les attributs qui sont assignables en masse.
     *
     * @var array<string>
     */
    protected $fillable = [
        'titre',
        'description',
        'user_id',
        'date_evenement',
        'max_participants',
        'lieu',
    ];

    /**
     * Les attributs qui doivent être convertis en types natifs.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'date_evenement' => 'datetime',
    ];

    /**
     * Relation avec l'utilisateur créateur de l'événement.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Relation avec les inscriptions à cet événement.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function inscriptions()
    {
        return $this->hasMany(Inscription::class, 'evenement_id');
    }
}
