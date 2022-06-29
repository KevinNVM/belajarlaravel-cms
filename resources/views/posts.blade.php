@extends('layouts.main')

@section('content')
    <h1 class="text-center">{{ $title }}</h1>

    <div class="row justify-content-center my-3">
        <div class="col-md-6">
            <form action="/blog" method="GET">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="search-input"><i class="bi bi-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search.." aria-label="Search.."
                        value="{{ request('q') }}" aria-describedby="search-input" name="q">
                    @if (request('category') || request('author'))
                        <input type="hidden" name="author" value="{{ request('author') }}">
                        <input type="hidden" name="category" value="{{ request('category') }}">
                    @endif
                    <button class="btn btn-outline-light">Search</button>
                </div>

            </form>
        </div>
    </div>

    @if ($posts->count())
        <div class="card mb-3">
            <div style="max-height: 400px; overflow: hidden;" class="mb-1">
                <img src="{{ ($posts[0]->image) ? url("storage/$posts[0]->image") : "https://source.unsplash.com/1200x400?".$posts[0]->category->name }}" class="shadow card-img-top">
            </div>
            <div class="card-body text-center">
                <h5 class="card-title"><a href="/posts/{{ $posts[0]->slug }}"
                        class="text-decoration-none link-secondary">{{ $posts[0]->title }}</a></h5>
                <small>
                    By: <a class="text-decoration-none link-primary"
                        href="/blog?author={{ $posts[0]->author->username }}">{{ $posts[0]->author->name }}</a> in <a
                        href="/blog?category={{ $posts[0]->category->slug }}"
                        class="text-decoration-none link-primary">{{ $posts[0]->category->name }}</a>
                </small>
                <p class="card-text">{{ $posts[0]->excerpt }}</p>
                <a href="/posts/{{ $posts[0]->slug }}" class="text-decoration-none">Read More...</a>
                <p class="card-text"><small class="text-muted">Last
                        updated {{ $posts[0]->created_at->diffForHumans() }}</small></p>
            </div>
        </div>



        <div class="container">
            <div class="row g-3">
                @foreach ($posts->skip(1) as $post)
                <div class="col-md-4">
                    <div class="card">
                        <div class="position-absolute p-2 rounded" style="background-color: rgba(0, 0, 0, .5)">
                            <a href="/blog?category={{ $post->category->slug }}"
                                class="text-decoration-none link-light">{{ $post->category->name }}</a>
                            </div>
                                <img src="{{ ($post->image) ? url("storage/$post->image") : "https://source.unsplash.com/500x500?".$post->category->name }}" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title"><a href="/posts/{{ $post->slug }}"
                                    class="text-decoration-none link-secondary">{{ $post->title }}
                                </a></h5>
                                <small>By: <a class="text-decoration-none link-primary"
                                    href="/blog?author={{ $post->author->username ?? 'NULL' }}">{{ $post->author->name ?? 'NULL' }}</a>
                                    {{ $post->created_at->diffForHumans() }}</small>
                                <p class="card-text">{{ $post->excerpt }}</p>
                                <a href="/posts/{{ $post->slug }}" class="btn btn-primary">Read More..</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    @else
        <p class="text-center fs-3">No Post Found.</p>
    @endif

    {{-- Pagination --}}
    <section class="pagination d-flex justify-content-end">
        {{ $posts->links() }}
    </section>

    <hr>
@endsection
