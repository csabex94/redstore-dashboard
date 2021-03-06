<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    <title>RedStore</title>
    <script src="https://kit.fontawesome.com/997a1f7218.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="{{ asset('../css/app.css') }}">
    @livewireStyles
</head>
<body>

    <div class="dashboard-section">
        <div class="sidebar">
            <img src="\images\logo-white.png" alt="logo" class="logo">
            <ul>
                <li>
                    <a href="/">
                        <i class="fas fa-home"></i>
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="/add_product">
                        <i class="fas fa-plus-square"></i>
                        Add Product
                    </a>
                </li>
                <li>
                    <a href="/manage_products">
                        <i class="far fa-list-alt"></i>
                        Manage Products
                    </a>
                </li>
                <li>
                    <a class="active" href="/manage_other_products">
                        <i class="far fa-list-alt"></i>
                        Manage Products2
                    </a>
                </li>
                <li>
                    <a href="/categories">
                        <i class="fas fa-sliders-h"></i>
                        Categories
                    </a>
                </li>
                <li>
                    <a href="/dashboard_admins">
                        <i class="fas fa-users-cog"></i>
                        Admins
                    </a>
                </li>
            </ul>
        </div>
        <div class="navbar">
             <ul>
                <li class="loggedidUser">
                    <div class="avatar">
                        <i class="fas fa-user-circle"></i>
                    </div>
                    <p class="username">username</p>
                </li>
                <li>
                    <i class="fas fa-bell"></i>
                </li>
                <li>
                    <i class="fas fa-sign-out-alt"></i>
                </li>
            </ul>
        </div>
        <div class="content">
            @livewire('manage-other-products')
        </div>
    </div>

    @livewireScripts
</body>
</html>