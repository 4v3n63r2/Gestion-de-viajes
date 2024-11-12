<%@ page import="java.util.List" %>
<%@ page import="org.consultas.viajes_itca.entity.Destinos" %>
<%@ page import="org.consultas.viajes_itca.control.Control" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Destinos - Administrador</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Paleta de colores */
        :root {
            --color-primario: #3A73B6;
            --color-secundario: #9FB3CC;
            --color-acento: #E1D43B;
            --color-destacado: #D1B928;
            --color-fondo: #f3f4f6;
            --color-texto: #333;
        }

        body {
            background-color: var(--color-fondo);
            color: var(--color-texto);
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: var(--color-primario);
        }

        .navbar-brand, .navbar-nav .nav-link {
            color: #fff !important;
        }

        .container {
            max-width: 1200px;
        }

        .main-content {
            display: flex;
            gap: 2rem;
            margin-top: 2rem;
        }

        /* Estilo del formulario */
        .formulario {
            background-color: #fff;
            border: 1px solid var(--color-secundario);
            padding: 2rem;
            border-radius: 10px;
            flex: 1;
        }

        .form-label {
            color: var(--color-texto);
            font-weight: bold;
        }

        .form-control, .form-select {
            border: 1px solid var(--color-secundario);
            background-color: var(--color-fondo);
        }

        .btn-primary {
            background-color: var(--color-acento);
            border: none;
        }

        .btn-primary:hover {
            background-color: var(--color-destacado);
        }

        /* Estilo de la tabla */
        .tabla {
            background-color: #fff;
            border: 1px solid var(--color-secundario);
            padding: 1rem;
            border-radius: 10px;
            flex: 2;
        }

        .table thead {
            background-color: var(--color-primario);
            color: #fff;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: var(--color-secundario);
        }

        .table-striped tbody tr:nth-of-type(even) {
            background-color: var(--color-fondo);
        }

        .table td, .table th {
            text-align: center;
            vertical-align: middle;
        }

        .btn-warning, .btn-danger {
            font-size: 0.85rem;
            padding: 0.3rem 0.5rem;
        }

        /* Footer */
        footer {
            background-color: var(--color-primario);
            color: #fff;
            padding: 1rem;
            margin-top: 2rem;
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
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="panelAdmin.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="gestionDestinos.jsp">Destinos</a></li>
                    <li class="nav-item"><a class="nav-link" href="gestionUsuario.jsp">Usuarios</a></li>
                    <li class="nav-item"><a class="nav-link active" href="analisisReportes.jsp">Análisis</a></li>
                    <li class="nav-item"><a class="nav-link btn btn-danger" href="../../Cerrar-Sesion">Cerrar</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Contenido principal -->
    <div class="container main-content">
        <!-- Formulario de añadir destino -->
        <div class="formulario">
            <form method="post" action="../../CrearDestino" id="formDestino">
                <h3 class="mb-3" style="color: var(--color-primario);">Añadir Nuevo Destino</h3>
                <div class="mb-3">
                    <label for="tipoDestino" class="form-label">Tipo de Destino</label>
                    <select class="form-select" id="tipoDestino" name="tipoDestino">
                        <option selected>Selecciona un tipo...</option>
                        <option value="playa">Playa</option>
                        <option value="montaña">Montaña</option>
                        <option value="ciudad">Ciudad</option>
                        <option value="aventura">Aventura</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="nombreD" class="form-label">Nombre del Destino</label>
                    <input type="text" class="form-control" id="nombreD" name="nombreD" required>
                </div>
                <div class="mb-3">
                    <label for="clima" class="form-label">Clima</label>
                    <select class="form-select" id="clima" name="clima">
                        <option value="todos">Todos</option>
                        <option value="calido">Cálido</option>
                        <option value="frio">Frío</option>
                        <option value="templado">Templado</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="nombrepais" class="form-label">Nombre del País</label>
                    <input type="text" class="form-control" id="nombrepais" name="nombrepais" required>
                </div>
                <div class="mb-3">
                    <label for="urlImagen" class="form-label">URL de la Imagen</label>
                    <input type="url" class="form-control" id="urlImagen" name="urlImagen" placeholder="https://ejemplo.com/imagen.jpg" required>
                </div>
                <button type="submit" class="btn btn-primary">Añadir Destino</button>
            </form>
        </div>

        <!-- Tabla de destinos -->
        <div class="tabla">
            <h3 class="text-center mb-3" style="color: var(--color-primario);">Lista de Destinos</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>Clima</th>
                        <th>Imagen</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody id="destinosList">
                    <%
                        Control control = new Control();
                        List<Destinos> destinos= (List<Destinos>) session.getAttribute("destinosAdmin");
                        for(Destinos destino: destinos){
                    %>
                    <tr>
                        <td><%=destino.getDestinoId()%></td>
                        <td><%=destino.getNombre()%></td>
                        <td><%=destino.getTipoDestino()%></td>
                        <td><%=destino.getClima()%></td>
                        <td><img src="<%=destino.getUrl()%>" alt="Imagen del destino" style="width: 100px;" /></td>
                        <td>
                            <a href="editarDestinoTuristico.jsp?id=<%=destino.getDestinoId()%>" class="btn btn-warning btn-sm">Editar</a>
                            <form class="d-inline" method="get" action="../../EliminarDestino">
                                <input type="hidden" name="destinoId" value="<%=destino.getDestinoId()%>">
                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
``
