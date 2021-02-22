<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'count', 'gender', 'price', 'sold', 'description', 'img', 'code', 'category_id'
    ];

    public function category() {
        return $this->hasOne('\App\Models\Category', 'id', 'category_id');
    }
}
