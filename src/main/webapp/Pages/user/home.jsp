<%@ page import="org.consultas.viajes_itca.entity.Usuarios" %>
<%@ page import="java.util.List" %>
<%@ page import="org.consultas.viajes_itca.entity.Destinos" %>
<%@ page import="org.consultas.viajes_itca.control.Control" %>
<%@ page import="org.consultas.viajes_itca.entity.Favoritos" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("../../index.jsp");
    } else {
        Control control = new Control();
        List<Destinos> destinos = (List<Destinos>) session.getAttribute("destinos");
        List<Destinos> destinos2Filto = (List<Destinos>) session.getAttribute("destinos2");
%>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Inicio - Agencia de Viajes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        :root {
            --amarillo: #E1D43B;
            --azul-oscuro: #3A73B6;
            --gris-azulado: #9FB3CC; /* Color modificado para el navbar */
            --amarillo-dorado: #D1B928;
        }

        .navbar {
            background-color: var(--azul-oscuro);
            color: white;
        }
        .navbar a {
            color: black !important; /* Color del texto actualizado a negro */
        }
        .navbar-nav {
            margin-left: 0; /* Alineación de los elementos a la izquierda */
        }
        .hero-section {
            background-color: var(--gris-azulado);
            color: var(--azul-oscuro);
            padding: 5rem 0;
        }
        .hero-section h1 {
            font-weight: 700;
        }
        .btn-primary {
            background-color: var(--amarillo);
            border: none;
        }
        .btn-primary:hover {
            background-color: var(--amarillo-dorado);
        }
        .card {
            position: relative;
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card .fav-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 1.5rem;
            color: var(--amarillo);
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            padding: 5px;
        }
        .card .fav-icon:hover {
            color: var(--amarillo-dorado);
        }
          .card-info {
            background-color: #9FB3CC
; /* Fondo similar a las páginas anteriores */
            padding: 15px;
            border-radius: 8px;
        }
        footer {
            background-color: var(--azul-oscuro);
        }
        footer p, footer a {
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
       
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto"> <!-- Cambiado a ms-auto para alinear a la izquierda -->
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp">Destinos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../../CargarViajes">Viajes por hacer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="../../CargarFav">Favoritos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-light" href="../../Cerrar-Sesion">Cerrar</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->

<!-- Lista de Destinos -->
<div class="container my-5">
    <h2 class="text-center mb-4">Destinos Disponibles</h2>
    <div class="row">
        <%
            for (Destinos destino : destinos) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <a href="../../AgregarFav?destinoId=<%=destino.getDestinoId()%>" class="fav-icon">
                    <p>❤</p>
                    <i class="bi bi-heart-fill"></i>
                </a>
                <img src="<%=destino.getUrl()%>" class="card-img-top" alt="Imagen de <%=destino.getNombre()%>">
                <div class="card-body">
                    <h5 class="card-title"><%=destino.getNombre()%>, <%=destino.getPais()%></h5>
                    <p class="card-text">Clima: <%=destino.getClima()%> | Popularidad: <%=destino.getPopularidad()%></p>
                    <a href="../../AgregarVi?destinoId=<%=destino.getDestinoId()%>" class="btn btn-secondary w-100">Agregar a Viajes por Hacer</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<!-- Barra de Búsqueda y Filtros -->

<!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%
    }
%>
