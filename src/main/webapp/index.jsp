<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agencia de Viajes - Bienvenida</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Estilo para la imagen de fondo */
        .hero {
            background-image: url('Imagenes/paisaje.jpg'); /* Cambia el enlace para usar tu imagen .jpg */
            background-size: cover;
            background-position: center;
            height: 100vh;
            color: white;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.6); /* Oscurece la imagen para mejor legibilidad del texto */
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        /* Navbar personalizado */
        .navbar .nav-link {
            color: white !important;
        }
        .navbar .nav-link:hover {
            color: white !important; /* Evita el cambio de color al pasar el cursor */
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Pages/iniciaSession.jsp">Iniciar Sesión</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Pages/Registrase.jsp">Registrarse</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section con Imagen de Fondo -->
    <div class="hero">
        <div class="overlay text-center">
            <h1 class="display-4">Elige tu destino con nosotros</h1>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
