<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Modèle Inscription.
 *
 * Représente une inscription d'un utilisateur à un événement
 * avec ses propriétés et ses relations.
 */
class Inscription extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * Les attributs qui sont assignables en masse.
     *
     * @var array<string>
     */
    protected $fillable = [
        'user_id',
        'evenement_id',
    ];

    /**
     * Les attributs qui doivent être convertis en types natifs.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'date_inscription' => 'datetime',
    ];

    /**
     * Relation avec l'utilisateur qui s'est inscrit.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /**
     * Relation avec l'événement auquel l'utilisateur s'est inscrit.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function evenement()
    {
        return $this->belongsTo(Evenement::class, 'evenement_id');
    }
}
