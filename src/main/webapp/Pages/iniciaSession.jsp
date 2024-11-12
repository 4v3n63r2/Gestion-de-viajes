<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login - Agencia de Viajes</title>
    <!-- Bootstrap CSS -->
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
        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: var(--gris-azulado);
        }
        
        .formulario-login {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        
        .formulario-login h3 {
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

    <!-- Contenedor centrado para el formulario de inicio de sesión -->
    <div class="login-container">
        <div class="formulario-login">
            <h3 class="text-center">Iniciar Sesión</h3>
            <form action="../Seccion" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control form-control-sm" id="email" name="email" placeholder="Ingresa tu correo" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control form-control-sm" id="password" name="password" placeholder="Ingresa tu contraseña" required>
                </div>
                <button type="submit" class="btn btn-primary w-100 btn-sm">Entrar</button>
                
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
