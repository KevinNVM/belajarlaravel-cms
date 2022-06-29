@extends('dashboard.layouts.main')

@section('main')
    <div class="row my-3">
        <div class="col-lg-8">
            <h2>{{ $post->title }}</h2>
            <a href="/dashboard/posts" class="btn btn-outline-success"><i class="bi bi-arrow-left"></i> Back</a>
            <a href="/dashboard/posts/{{ $post->slug }}/edit" class="btn btn-outline-warning"><i class="bi bi-pen"></i> Edit</a>
            <form action="/dashboard/posts/{{ $post->slug }}" method="POST" class="d-inline">
                @method('delete')
                @csrf
                <button class="btn btn-outline-danger" onclick="return confirm('Are You Sure?')">
                    <i class="bi bi-trash"></i> Delete
                </button
            </form>

            <div style="max-height: 350px; overflow: hidden;" class="my-1">
                <img src="{{ ($post->image) ? url("storage/$post->image") : "https://source.unsplash.com/1200x400?".$post->category->name }}" class="img-fluid mt-1">
            </div>

            <article class="my-3 fs-5">
                {!! $post->body !!}
            </article>
            <hr>
        </div>
    </div>
@endsection
