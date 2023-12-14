<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel = "icon" href ="{{ asset('img/logo/FTRU.svg') }}"  type = "image/svg+xml">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="{{asset('sass/style.css')}}">
    <link href="https://fonts.googleapis.com/css2?family=Karantina&family=Lora:ital@1&family=Nunito:wght@300&family=Square+Peg&display=swap" rel="stylesheet">
</head>
<body>
    <header class="login_header">
        <div class="logo">
            <img src="{{ asset('img/dashboard/logo/FTRU (2).svg') }}" alt="">
        </div>
    </header>
    <section class="all_page">
        <h1>LOGIN</h1>
        <div class="form_container">
            <form action="{{ route('handle admin login') }}" method="POST">
                @csrf
                <label for="">EMAIL</label>
                <input type="text" name="email">
                <label for="">PASSWORD</label>
                <input type="password" name="password" >
                <button type="submit">SUBMIT</button>
            </form>
        </div>
    </section>
</body>
</html>
