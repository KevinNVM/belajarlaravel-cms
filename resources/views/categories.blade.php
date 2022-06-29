@extends('layouts.main')

@section('content')
    <h1>Categories</h1>
    <hr>

    <div class="container">
        <div class="row g-3">
            @foreach ($category as $cat)
                <div class="col-md-3">
                    <a href="">
                        <div class="card bg-dark text-white">
                            <a href="/blog?categories={{ $cat->slug }}"
                                class="text-decoration-none link-light fw-semibold fs-3">
                                <img src="https://source.unsplash.com/500x500?{{ $cat->name }}" class="card-img"
                                    alt="...">
                                <div class="card-img-overlay d-flex align-items-center">
                                    <h5 class="card-title rounded px-1" style="background-color: rgba(0, 0, 0, .5)">
                                        {{ $cat->name }}
                                    </h5>
                                </div>
                            </a>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>

    <a href="/posts">Back to Posts</a>
@endsection
