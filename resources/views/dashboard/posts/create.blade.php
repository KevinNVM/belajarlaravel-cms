@extends('dashboard.layouts.main')

@push('head')
    <link rel="stylesheet" type="text/css" href="{{ url('css/trix.css') }}">
    <script type="text/javascript" src="{{ url('js/trix.js') }}"></script>
    <style>
        trix-toolbar .trix-button-group[data-trix-button-group="file-tools"] {

            display: none;

        }
    </style>
@endpush

@section('main')
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h4">Create New Post</h1>
    </div>

    <div class="col-lg-8">
        <form method="POST" action="/dashboard/posts" class="mb-5" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control @error('title') is-invalid @enderror" id="title"
                    name="title" value="{{ old('title') }}" autofocus required>
                @error('title')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="slug" class="form-label">Slug</label>
                <input type="text" class="form-control bg-transparent @error('slug') is-invalid @enderror" id="slug" name="slug"
                    value="{{ old('slug') }}" placeholder="Enter Post Title First" readonly>
                @error('slug')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <select class="form-select" name="category_id">
                    @foreach ($categories as $cat)
                        <option value="{{ $cat->id }}" {{ old('category_id') == $cat->id ? ' selected' : ' ' }}>
                            {{ $cat->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="mb-3">
                <label for="image" class="form-label">Post Image</label>
                <img class="img-preview img-fluid mb-3 col-sm-5">
                <input onchange="previewImage()" class="form-control @error('image')
                    is-invalid
                @enderror" type="file" id="image" name="image">
                @error('image')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="body" class="form-label">Category</label>
                @error('body')
                    <p class="text-danger">{{ $message }}</p>
                @enderror
                <input id="body" type="hidden" name="body" value="{{ old('body') }}">
                <trix-editor input="body"></trix-editor>
            </div>
            <button class="btn btn-outline-success">Create Post</button>
        </form>
    </div>
@endsection

@push('foot')
    <script>
        const title = $('#title');
        const slug = $('#slug');

        title.on('change', function() {
            if (title.val()) { // jika value dari title tidak kosong maka jalankan ajax
                $.ajax({
                    type: "GET",
                    url: `/dashboard/utilities/sluggifier?title=${title.val()}`,
                    success: function(response) {
                        slug.val(response.slug)
                    }
                });
            } else {
                slug.val('')
            }
        });

        title.on('keyup', function() {
            if (title.val()) { // jika value dari title tidak kosong maka jalankan ajax
                $.ajax({
                    type: "GET",
                    url: `/dashboard/utilities/sluggifier?title=${title.val()}`,
                    success: function(response) {
                        slug.val(response.slug)
                    }
                });
            } else {
                slug.val('')
            }
        });

        $(document).on('trix-file-accept', function(e) {
            e.preventDefault();
        });

        function previewImage() {
            const image = $('#image');
            const imgPreview = $('.img-preview');

            imgPreview.css('display', 'block');

            const oFReader = new FileReader();
            oFReader.readAsDataURL(image.prop('files')[0]);

            oFReader.onload = function (e) {
                imgPreview.attr('src', e.target.result);
            }
        }


    </script>
@endpush
