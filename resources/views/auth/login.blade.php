@extends('layouts.main')

@push('head')
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function toast(text) {
            Toastify({
                text: `${text}`,
                duration: 5000,
                close: true,
                style: {
                    background: "linear-gradient(to right, #00b09b, #96c93d)",
                },
                onClick: function() {} // Callback after click
            }).showToast();
        }
    </script>
@endpush


@section('content')
    <div class="d-flex align-items-center">
        <main class="container border border-secondary shadow position-relative py-2 my-5">
            <div class="dropdown text-center">
                <button type="button"
                    class="btn border border-secondary rounded-0 text-secondary position-relative fs-3 mt-2 inbox-title"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    Login to Your Account
                </button>
                <ul class="dropdown-menu rounded-0 shadow-none bg-black border border-secondary"
                    aria-labelledby="dropdownMenuLink">
                    <li><a class="dropdown-item text-secondary " href="/register">Register</a>
                    </li>
                </ul>
            </div>
            <form action="/login" method="POST">
                @csrf
                <section id="login">

                    @if (session('msg'))
                        <script>
                            toast('<?= session('msg')['body'] ?? 'Lorem Ipsum' ?>')
                        </script>
                    @endif

                    @if (session('error'))
                        <script>
                            Swal.fire({
                                icon: '{{ session('error')['status'] }}',
                                title: '{{ session('error')['head'] }}',
                                text: '{{ session('error')['body'] }}',
                            })
                        </script>
                    @endif


                    <div class="row">
                        <!-- Username -->
                        <div class="col-12">
                            <label for="email" class="form-text text-secondary">Email</label>
                            <input type="email" id="email" name="email"
                                class="form-control rounded-0 bg-transparent text-secondary border border-secondary bg-black font-monospace @error('email') is-invalid @enderror"
                                value="{{ old('email') }}" autocomplete="true" autocapitalize="false" required autofocus>
                            @error('email')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                            <!-- Password -->
                            <div class="col-12">
                                <label for="password" class="form-text text-secondary">Password</label>
                                <div class="input-group mb-3">
                                    <input type="password" id="password" name="password"
                                        class="form-control rounded-0 bg-transparent text-secondary border border-secondary bg-black font-monospace"
                                        autocomplete="true" required>
                                    <div class="input-group-text px-1 rounded-0">
                                        <input class="form-check-input mt-0 visually-hidden" type="checkbox" id="show-pass"
                                            aria-label="Checkbox for following pass input">
                                        <label for="show-pass" id="show-pass-label"><i
                                                class="fa-regular fa-eye fa-lg"></i></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Submit Button -->
                        <div class="d-grid">
                            <button class="btn btn-dark text-secondary rounded-0 mb-3" name="submit">Login</button>
                        </div>
                        <hr class="text-white">
                        <div class="login-link font-monospace text-secondary text-center">
                            Didn't Have an Account? Click <a href="/register">Here</a> To
                            register
                        </div>


                </section>
            </form>

        </main>
    </div>
@endsection

@push('foot')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {

            // Show Password
            $('input[type=checkbox]').on('click', function() {
                console.log('click');
                if ($('#password').attr('type') === "password") {
                    $('#password').attr('type', 'text');
                    $('label#show-pass-label').html('<i class="fa-regular fa-eye-slash fa-lg"></i>');
                } else {
                    $('#password').attr('type', 'password');
                    $('label#show-pass-label').html('<i class="fa-regular fa-eye fa-lg"></i>');
                }
            });

        });
    </script>
@endpush
