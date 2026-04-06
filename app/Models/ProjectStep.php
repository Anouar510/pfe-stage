<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectStep extends Model
{
    protected $fillable = [
        'project_id',
        'label',
        'status',
        'order_num',
    ];

    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
