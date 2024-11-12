<%@ page import="java.util.List" %>
<%@ page import="org.consultas.viajes_itca.entity.Favoritos" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Favoritos - Agencia de Viajes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        :root {
            --amarillo: #E1D43B;
            --azul-oscuro: #3A73B6;
            --gris-azulado: #9FB3CC;
            --amarillo-dorado: #D1B928;
        }

        .navbar {
            background-color: var(--azul-oscuro);
            color: white;
        }
        .navbar a {
            color: white !important;
        }
        .hero-section {
            background-color: var(--gris-azulado);
            color: var(--azul-oscuro);
            padding: 5rem 0;
        }
        .hero-section h1 {
            font-weight: 700;
        }
        .card {
            position: relative;
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-body {
            background-color: #9FB3CC; /* Fondo similar a las páginas anteriores */
            padding: 15px;
            border-radius: 8px;
        }
        .btn-remove {
            position: absolute;
            top: 10px;
            right: 10px;
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



<%
    // Código Java para obtener los destinos favoritos del usuario
    List<Favoritos> favoritos = (List<Favoritos>) session.getAttribute("favoritos");
%>

<!-- Sección de Favoritos -->
<div class="container my-5">
    <h2 class="text-center mb-4">Tus Destinos Guardados</h2>
    <div class="row g-4">
        <%
            for (Favoritos favorito : favoritos) {
        %>
        <div class="col-md-4 position-relative">
            <div class="card">
                <img src="<%=favorito.getDestinoId().getUrl()%>" class="card-img-top" alt="Imagen de <%=favorito.getDestinoId().getNombre()%>">
                <div class="card-body">
                    <h5 class="card-title"><%=favorito.getDestinoId().getNombre()%>, <%=favorito.getDestinoId().getPais()%></h5>
                    <p class="card-text">Clima: <%=favorito.getDestinoId().getClima()%> | Popularidad: <%=favorito.getDestinoId().getPopularidad()%></p>
                </div>
                <a href="../../EliminarFav?id=<%=favorito.getFavoritoId()%>" class="btn btn-danger btn-sm btn-remove">Eliminar</a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>

<!-- Footer -->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
