<%@ page import="java.util.List" %>
<%@ page import="org.consultas.viajes_itca.entity.Destinos" %>
<%@ page import="org.consultas.viajes_itca.entity.Usuarios" %>
<%@ page import="org.consultas.viajes_itca.entity.ViajesPorHacer" %>
<%@ page import="org.consultas.viajes_itca.control.Control" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Usuarios> usuarios = (List<Usuarios>) session.getAttribute("usuarios");
    List<Destinos> destinos = (List<Destinos>) session.getAttribute("destinosAdmin");
    List<Destinos> destinos2 = (List<Destinos>) session.getAttribute("destinosMasValorados");
    List<ViajesPorHacer> viajes = (List<ViajesPorHacer>) session.getAttribute("viajes");
    Control control = new Control();
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Administrador</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        /* Custom color palette */
        .bg-main { background-color: #3498db; }
        .text-main { color: #3498db; }
        .bg-secondary { background-color: #2ecc71; }
        .bg-highlight { background-color: #f1c40f; }
        
        /* Small card styles */
        .card-mini {
            width: 10rem; /* Small width */
            height: 8rem; /* Small height */
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0.75rem;
            margin-bottom: 1rem;
        }
        
        .dashboard-container {
            display: flex;
            gap: 2rem;
            margin-top: 2rem;
        }
        .dashboard-left {
            flex: 0.3; /* Smaller left panel */
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .dashboard-right {
            flex: 0.7; /* Larger right panel for charts */
        }
        
        .bg-light {
            background-color: #f9f9f9;
        }
        
        footer {
            background-color: #222;
        }
        
        .cerrar-sesion:hover {
            background-color: red;
            border-color: red;
            color: white;
        }
         /* Ajuste de tamaño y organización automática */
    .card-mini {
        border: none;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 1rem;
        margin-bottom: 1rem;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 100%; /* Que ocupe el ancho del contenedor */
        
    min-height: 250px; /* Ajuste mínimo para todas las tarjetas */
    word-wrap: break-word; /* Ajusta el texto si es largo */
    }
    </style>
</head>
<body class="bg-light">

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
    <!-- Dashboard Content -->
    <div class="container dashboard-container">
        <!-- Left Panel (Resumen) -->
        <div class="dashboard-left">
            <h2 class="text-main mb-4">Resumen de cada segmento</h2>
            <div class="card card-mini bg-secondary text-white text-center">
                <div class="card-body">
                    <img src="https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png" width="80" alt="Error" class="mb-4">
                    <h5>Usuarios</h5>
                    <p class="h4"><%=usuarios.size()%></p>
                </div>
            </div>
            <div class="card card-mini bg-highlight text-dark text-center">
                <div class="card-body">
                    <img src="https://cdn-icons-png.freepik.com/512/1478/1478879.png" width="80" alt="Error" class="mb-4">
                    <h5>Disponibles</h5>
                    <p class="h4"><%=destinos.size()%></p>
                </div>
            </div>
            <div class="card card-mini bg-main text-white text-center">
                <div class="card-body">
                    <img src="https://cdn-icons-png.flaticon.com/512/3162/3162620.png" width="80" alt="Error" class="mb-4">
                    <h5>Populares</h5>
                    <p class="h4"><%=destinos2.get(0).getNombre()%>, <%=destinos2.get(1).getNombre()%></p>
                </div>
            </div>
        </div>

        <!-- Right Panel (Gráficos de Preferencias) -->
        <div class="dashboard-right">
            <h2 class="text-main mb-4 text-center">Gráficos Generales</h2>
            <div class="row">
                <div class="col-md-12">
                    <canvas id="graficoTiposViaje"></canvas>
                </div>
                <div class="col-md-12 mt-4">
                    <canvas id="graficoClima"></canvas>
                </div>
                
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <%
        long playa = control.getCantidadTipoviajes("playa");
        long montana = control.getCantidadTipoviajes("montaña");
        long ciudad = control.getCantidadTipoviajes("ciudad");
        long aventura = control.getCantidadTipoviajes("aventura");
        long calido = control.getCantidadClimaviajes("cálido");
        long templado = control.getCantidadClimaviajes("templado");
        long frio = control.getCantidadClimaviajes("frío");
    %>

    <script>
        // Gráfico de tipos de viaje
        const ctx1 = document.getElementById('graficoTiposViaje').getContext('2d');
        new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ['Playa', 'Montaña', 'Ciudad', 'Aventura'],
                datasets: [{
                    label: 'Usuarios por Tipo de Viaje',
                    data: [<%=playa%>, <%=montana%>, <%=ciudad%>, <%=aventura%>],
                    backgroundColor: ['#3498db', '#2ecc71', '#f1c40f', '#9b59b6']
                }]
            }
        });

        // Gráfico de clima preferido
        const ctx2 = document.getElementById('graficoClima').getContext('2d');
        new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: ['Cálido', 'Templado', 'Frío'],
                datasets: [{
                    data: [<%=calido%>, <%=templado%>, <%=frio%>],
                    backgroundColor: ['#e67e22', '#3498db', '#95a5a6']
                }]
            }
        });
    </script>

</body>
</html>
