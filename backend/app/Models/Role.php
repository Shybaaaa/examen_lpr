<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Modèle Role.
 *
 * Représente un rôle utilisateur dans l'application avec ses propriétés
 * et ses relations avec les utilisateurs.
 */
class Role extends Model
{
    use HasFactory, SoftDeletes;

    /**
     * Les attributs qui sont assignables en masse.
     *
     * @var array<string>
     */
    protected $fillable = [
        'name',
    ];

    /**
     * Relation avec les utilisateurs ayant ce rôle.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function users()
    {
        return $this->hasMany(User::class, 'role_id');
    }

    /**
     * Les attributs qui doivent être convertis en types natifs.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    /**
     * Accesseur pour obtenir le nom du rôle.
     *
     * @return string
     */
    public function getRoleNameAttribute()
    {
        return $this->name;
    }
}
