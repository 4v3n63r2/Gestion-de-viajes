<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Agencia de Viajes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Paleta de colores personalizada */
        :root {
            --amarillo: #E1D43B;
            --azul-oscuro: #3A73B6;
            --gris-azulado: #9FB3CC;
            --amarillo-dorado: #D1B928;
        }

        /* Estilo del navbar */
        .navbar {
            background-color: var(--azul-oscuro);
        }
        .navbar a {
            color: white !important;
        }

        /* Centrar formulario y darle estilo */
        .registro-container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: var(--gris-azulado);
        }
        
        .formulario-registro {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        
        .formulario-registro h3 {
            color: var(--azul-oscuro);
            font-weight: 700;
            margin-bottom: 1rem;
        }

        /* Estilo de los botones y campos */
        .btn-primary {
            background-color: var(--amarillo);
            border: none;
        }
        
        .btn-primary:hover {
            background-color: var(--amarillo-dorado);
        }

        .form-control:focus {
            border-color: var(--amarillo);
            box-shadow: 0 0 0 0.2rem rgba(225, 212, 59, 0.25);
        }

        /* Estilo de los labels */
        .form-label {
            color: var(--azul-oscuro);
            font-size: 0.9rem;
        }
    </style>
    <script>
        function mostrarAlerta(event) {
            event.preventDefault(); // Evita que el formulario se envíe inmediatamente
            alert("Registrado con éxito");
            event.target.submit(); // Envía el formulario después de mostrar la alerta
        }
    </script>
</head>
<body>

    <!-- Navbar minimalista -->
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

    <!-- Contenedor centrado para el formulario -->
    <div class="registro-container">
        <!-- Formulario de Registro -->
        <div class="formulario-registro">
            <h3 class="text-center">Regístrate con nosotros</h3>
            <form action="../CrearUser" method="post" onsubmit="mostrarAlerta(event)">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre Completo</label>
                    <input type="text" class="form-control form-control-sm" id="nombre" name="nombre" placeholder="Nombre completo" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control form-control-sm" id="email" name="email" placeholder="Correo electrónico" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control form-control-sm" id="password" name="password" placeholder="Contraseña" required>
                </div>
               
                <div class="mb-3">
                    <label for="preferencia" class="form-label">Preferencias de Viaje</label>
                    <select class="form-select form-select-sm" id="preferencia" name="preferencia" required>
                        <option selected disabled>Selecciona tus preferencias...</option>
                        <option value="playa">Playa</option>
                        <option value="montaña">Montaña</option>
                        <option value="ciudad">Ciudad</option>
                        <option value="aventura">Aventura</option>
                    </select>
                </div>
               
                <button type="submit" class="btn btn-primary w-100 btn-sm">Registrarse</button>
            </form>
            <p class="text-center mt-3 small">¿Ya tienes una cuenta? <a href="../Pages/iniciaSession.jsp" class="text-decoration-none">Inicia sesión aquí</a></p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
