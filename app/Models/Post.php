<?php

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use \App\Models\User;

class Post extends Model
{
    use HasFactory;
    use Sluggable;

    // protected $fillable = ['title', 'excerpt', 'body'];
    protected $guarded = ['id'];
    protected $with = ['author', 'category'];

    public function scopeFilter($query, array $filters)
    {
        // if (isset($filters['q'])? $filters['q'] : false) {
        //     return $query->where('title', 'like', '%'.$filters['q'].'%')->orWhere('body', 'like', '%'.$filters['q'].'%');
        // }

    $query->when($filters['q'] ?? false, function($query, $q) {
        return $query->where('title', 'like', "%$q%")
                    ->orWhere('body', 'like', "%$q%");
    });

    $query->when($filters['category'] ?? false, function($query, $category) {
        return $query->whereHas('category', function($query) use ($category) {
            $query->where('slug', $category);
        });
    });

    $query->when($filters['author'] ?? false, function($query, $author) {
        return $query->whereHas('author', function($query) use ($author) {
            $query->where('username', $author);
        });
    });

    // $query->when($filters['author'] ?? false, fn($query, $author) => $query->whereHas('author', fn($query) => $query->where('username', $author)));

    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

}