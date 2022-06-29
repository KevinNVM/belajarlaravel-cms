<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    public function index()
    {
        $title = 'Latest Posts';
        if(request('category')) {
            $category = Category::firstWhere('slug', request('category'));
            $title .= " in $category->name";
        }

        if(request('author')) {
            $author = User::firstWhere('username', request('author'));
            $title .= " by $author->name";
        }


        return view('posts', [
            'title' => $title,
            'posts' =>
            Post::latest()->filter(request(['q', 'category', 'author']))->paginate(10)->withQueryString(),
        ]);
    }

    public function show(Post $post)
    {
        return view('post', [
            'title' => 'Single Post',
            'post' => $post,
        ]);
    }
}