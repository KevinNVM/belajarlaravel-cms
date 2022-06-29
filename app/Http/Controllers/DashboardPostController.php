<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use Illuminate\Http\Request;
use \Cviebrock\EloquentSluggable\Services\SlugService;
use Illuminate\Support\Facades\Storage;

class DashboardPostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        return view('dashboard.posts.index', [
            'title' => 'Dashboard',
            'posts' => Post::where('user_id', auth()->user()->id)->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('dashboard.posts.create', [
            'title' => 'New Post',
            'categories' => Category::all(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // return $request->file('image')->store('post-images');

        $validatedData = $request->validate([
            'title' => 'required|max:255',
            'slug' => 'required|unique:posts',
            'category_id' => 'required',
            'image' => 'image|file|max:2048',
            'body' => 'required',
        ]);

        $validatedData['user_id'] = auth()->user()->id;
        $validatedData['excerpt'] = \Illuminate\Support\Str::limit(strip_tags($request->body), 150, '...');

        Post::create($validatedData);

        return redirect('dashboard/posts')->with('msg', ['status'=>'success', 'head'=>'New Post', 'body' => 'New Post Has Been Added!']);

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        if($post->author->id !== auth()->user()->id) {
            abort(403);
       }

        return view('dashboard.posts.show', [
            'title' => 'Post Details',
            'post' => $post,
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function edit(Post $post)
    {
        if($post->author->id !== auth()->user()->id) {
            abort(403);
       }

        return view('dashboard.posts.edit', [
            'title' => 'Edit Post',
            'post' => $post,
            'categories' => Category::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Post $post)
    {
        // return $request;

        $rules = [
            'title' => 'required|max:255',
            'category_id' => 'required',
            'image' => 'image|file|max:2048',
            'body' => 'required|min:1',
        ];

        if ($request->body !== $post->body) {
            $rules['slug'] = 'required|unique:posts';
        }

        $validatedData['user_id'] = auth()->user()->id;
        $validatedData['excerpt'] = \Illuminate\Support\Str::limit(strip_tags($request->body), 150, '...');
        $validatedData = $request->validate($rules);

        if ($request->file('image')) {
            if($request->oldImage) {
                Storage::delete($request->oldImage);
            }
            $validatedData['image'] = $request->file('image')->store('post-images');
        }


        // $request->file('image') ?:
        // ($request->oldImage ?: Storage::delete($request->oldImage));

        // if($request->file('image')) {
        //     ($request->oldImage) ?: Storage::delete($request->oldImage);
        //     $validatedData['image'] = $request->file('image')->store('post-images');
        // } else {
        //     $validatedData['image'] = NULL;
        // }


        $request->file('image') ? $validatedData['image'] = $request->file('image')->store('post-images') : $validatedData['image'] = NULL;


        Post::where('id', $post->id)
            ->update($validatedData);


        return redirect('dashboard/posts')->with('msg', ['status'=>'success', 'head'=>'New Post', 'body' => 'Post Has Been Updated!']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Post  $post
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        if($post->image) {
            Storage::delete($post->image);
        }

        Post::destroy($post->id);

        return redirect('dashboard/posts')->with('msg', ['status'=>'success', 'head'=>'New Post', 'body' => ' Has Been Deleted!']);
    }

    public function checkSlug(Request $request)
    {

        $slug = SlugService::createSlug(Post::class, 'slug', $request->title);

        return response()->json(['slug' => $slug]);
    }

}