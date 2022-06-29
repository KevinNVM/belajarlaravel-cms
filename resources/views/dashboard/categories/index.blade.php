@extends('dashboard.layouts.main')

@section('main')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h4">My Posts, {{ auth()->user()->name }}</h1>
    </div>

    <div class="table-responsive col-lg-6">
        <a href="/dashboard/categories/create" class="btn btn-outline-primary">
            <i class="bi bi-plus-square"></i> New Post Categories</a>
        <table class="table table-striped table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Category Name</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($categories as $cat)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td title="{{ $cat->name }}">
                            {{ strlen($cat->name) > 15 ? substr($post->title, 0, 15) . '...' : $cat->name }}
                        </td>
                        <td>
                            <a href="/dashboard/categories/{{ $cat->slug }}" class="badge bg-info">
                                <i class="bi bi-eye"></i>
                            </a>
                            <a href="/dashboard/categories/{{ $cat->slug }}/edit" class="badge bg-warning">
                                <i class="bi bi-pen"></i>
                            </a>
                            <form action="/dashboard/categories/{{ $cat->slug }}" method="POST" class="d-inline">
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

