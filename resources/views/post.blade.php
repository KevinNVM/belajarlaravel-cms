@extends('layouts.main')


@section('content')
    <main>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <h2>{{ $post->title }}</h2>
                    <small class="d-block">By: <a
                            href="/blog?author={{ $post->author->username }}">{{ $post->author->name }}</a>
                        in
                        <a href="/blog?category={{ $post->category->slug }}">{{ $post->category->name }}</a></small>

                        <img src="{{ ($post->image) ? url("storage/$post->image") : "https://source.unsplash.com/1200x500?".$post->category->name }}" class="shadow img-fluid my-1">

                    <article class="my-3 fs-5">
                        {!! $post->body !!}
                    </article>
                    <hr>
                    <a href="/blog">Back To Blog</a>
                </div>
            </div>
        </div>


    </main>
@endsection
