@extends('dashboard.layouts.main')

@section('main')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h4">My Posts, {{ auth()->user()->name }}</h1>
    </div>

    <div class="table-responsive col-lg-8">
        <a href="/dashboard/posts/create" class="btn btn-outline-primary">
            <i class="bi bi-plus-square"></i> New Post</a>
        <table class="table table-striped table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Category</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($posts as $post)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td title="{{ $post->title }}">
                            {{ strlen($post->title) > 15 ? substr($post->title, 0, 15) . '...' : $post->title }}
                        </td>
                        <td>{{ $post->category->name }}</td>
                        <td>
                            <a href="/dashboard/posts/{{ $post->slug }}" class="badge bg-info">
                                <i class="bi bi-eye"></i>
                            </a>
                            <a href="/dashboard/posts/{{ $post->slug }}/edit" class="badge bg-warning">
                                <i class="bi bi-pen"></i>
                            </a>
                            <form action="/dashboard/posts/{{ $post->slug }}" method="POST" class="d-inline">
                                @method('delete')
                                @csrf
                                <button class="badge bg-danger border-0" onclick="return confirm('Are You Sure?')">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection

@push('foot')
    <script>
        @if(session('msg'))
        Swal.fire(
            '{{ session('msg')['head'] }}',
            '{{ session('msg')['body'] }}',
            '{{ session('msg')['status'] }}'
        )
        @endif
    </script>
@endpush

