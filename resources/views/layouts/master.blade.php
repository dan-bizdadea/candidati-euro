<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Votul activ – singura sansa pentru Romania</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="/js/sb-admin/css/sb-admin-2.min.css" rel="stylesheet">
    <script src="/js/sb-admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="{{ asset('css/app.css')}}">
    @yield('header_includes')
</head>
<body>
<div id="wrapper">

    <div id="content-wrapper" class="d-flex flex-column bg-gradient-primary">
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
            @yield('header')
        </nav>
        @if (Session::has('success'))
            <div class="alert alert-success">
                {{ Session::get('success') }}
            </div>
        @endif
    @yield('content')
    </div>
</div>
</body>
</html>
