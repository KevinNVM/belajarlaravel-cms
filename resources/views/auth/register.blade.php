@extends('layouts.main')

@push('head')
    <link rel="stylesheet" href="css/login.css">
@endpush

@section('content')
    <main class="container border border-secondary shadow position-relative py-2 my-5">
        <div class="dropdown text-center">
            <button type="button"
                class="btn border border-secondary rounded-0 text-secondary position-relative fs-4 mt-2 text-secondary inbox-title"
                data-bs-toggle="dropdown" aria-expanded="false">
                Register to Create Your Account
            </button>
            <ul class="dropdown-menu rounded-0 shadow-none bg-black border border-secondary"
                aria-labelledby="dropdownMenuLink">
                <li><a class="dropdown-item text-secondary " href="/login">Login</a>
                </li>
            </ul>
        </div>
        <form action="/register" method="POST">
            @csrf
            <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
                <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
                    <path
                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                </symbol>
                <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                    <path
                        d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
                </symbol>
                <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
                    <path
                        d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                </symbol>
            </svg>

            <section id="login">
                <?php if(isset($error)): ?>
                <!-- Errors -->
                <div class="alert error border border-danger rounded-0 d-flex align-items-center mt-2" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:">
                        <use xlink:href="#exclamation-triangle-fill" />
                    </svg>
                    <div>
                        <?= $error ?>
                    </div>
                </div>
                <?php endif; ?>
                <div class="row">
                    <!-- First Name -->
                    <div class="col-12 col-sm-6">
                        <label for="fname" class="form-text text-secondary">First Name</label>
                        <input type="text" id="fname" name="fname"
                            class="form-control rounded-0 bg-transparent text-secondary border border-secondary bg-black font-monospace @error('fname') is-invalid @enderror"
                            value="{{ old('fname') }}" autocomplete="true" required>
                        @error('fname')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    <!-- Last Name -->
                    <div class="col-12 col-sm-6">
                        <label for="lname" class="form-text text-secondary">Last Name</label>
                        <input type="text" id="lname" name="lname"
                            class="form-control rounded-0 bg-transparent text-secondary border border-secondary bg-black font-monospace @error('lname') is-invalid @enderror"
                            value="{{ old('lname') }}" autocomplete="true">
                        @error('lname')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    <!-- Username -->
                    <div class="col-12">
                        <label for="username" class="form-text text-secondary">Username</label>
                        <input type="text" id="username" name="username"
                            class="form-control rounded-0 bg-transparent text-secondary border border-secondary bg-black font-monospace @error('username') is-invalid @enderror"
                            value="{{ old('username') }}" autocomplete="true" required>
                        @error('username')
                            <div class="invalid-feedback">
                                {{ $message }}
                            </div>
                        @enderror
                        <!-- Email -->
                        <div class="col-12">
                            <label for="email" class="form-text text-secondary">Email</label>
                            <input type="text" id="email" name="email"
                                class="form-control rounded-0 bg-transparent text-secondary border border-secondary bg-black font-monospace @error('email') is-invalid @enderror"
                                value="{{ old('email') }}" autocomplete="true" required>
                            @error('email')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <!-- Password -->
                        <div class="col-12">
                            <label for="password" class="form-text text-secondary">Password</label>
                            <div class="input-group mb-3">
                                <input type="password" id="password" name="password"
                                    class="form-control rounded-0 bg-transparent text-secondary border border-secondary bg-black font-monospace @error('password') is-invalid @enderror"
                                    autocomplete="true" required>
                                <div class="input-group-text px-1 rounded-0">
                                    <input class="form-check-input mt-0 visually-hidden" type="checkbox" id="show-pass"
                                        aria-label="Checkbox for following pass input">
                                    <label for="show-pass" id="show-pass-label"><i
                                            class="fa-regular fa-eye fa-lg"></i></label>
                                </div>
                                @error('password')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>
                    </div>
                    <!-- Submit Button -->
                    <div class="d-grid">
                        <button class="btn btn-dark text-secondary rounded-0 mb-3" name="submit">Register</button>
                    </div>
                    <hr class="text-white">
                    <div class="login-link font-monospace text-secondary">
                        Already Have an Account? Click <a href="/login">Here</a> To
                        Login
                    </div>
            </section>
        </form>

    </main>
@endsection

@push('foot')
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {

            // Show Password
            $('input[type=checkbox]').on('click', function() {
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
