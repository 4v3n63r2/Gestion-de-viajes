<%@ page import="org.consultas.viajes_itca.control.Control" %><%--
    Document   : analisisReportes
    Created on : 25 oct 2024, 22:27:01
    Author     : enocc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Análisis y Reportes - Administrador</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .cerrar-sesion:hover {
        background-color: red;
        border-color: red;
        color: white; /* Cambia el color del texto a blanco para que contraste */
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
    <!-- Gráficos -->
    <div class="container my-5">
        <h2 class="mb-4 text-primary">Gráficos</h2>
        <div class="row">
            <div class="col-md-6 mb-4">
                <h5 class="text-dark">Gráfico de Barras: Número de Usuarios por Tipo de Destino</h5>
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <canvas id="graficoTiposViaje"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <h5 class="text-dark">Gráfico de Pastel: Proporción de Tipos de Destinos Seleccionados</h5>
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <canvas id="graficoTiposViajePastel"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mb-4">
                <h5 class="text-dark">Gráfico de Dispersión: Relación entre Popularidad y Clima</h5>
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <canvas id="graficoDispercion"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <%
        Control control = new Control();
        long playa = control.getCantidadTipoviajes("playa");
        long montana = control.getCantidadTipoviajes("montaña");
        long ciudad = control.getCantidadTipoviajes("ciudad");
        long aventura = control.getCantidadTipoviajes("aventura");
    %>

    <script>
        const ctx1 = document.getElementById('graficoTiposViaje').getContext('2d');
        new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ['Playa', 'Montaña', 'Ciudad', 'Aventura'],
                datasets: [{
                    label: 'Usuarios por Tipo de Destino',
                    data: [<%=playa%>, <%=montana%>, <%=ciudad%>, <%=aventura%>],
                    backgroundColor: ['#E1D43B', '#3A73B6', '#9FB3CC', '#D1B928']
                }]
            }
        });

        // Gráfico de pastel
        const ctx2 = document.getElementById('graficoTiposViajePastel').getContext('2d');
        new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: ['Playa', 'Montaña', 'Ciudad', 'Aventura'],
                datasets: [{
                    data: [<%=playa%>, <%=montana%>, <%=ciudad%>, <%=aventura%>],
                    backgroundColor: ['#E1D43B', '#3A73B6', '#9FB3CC', '#D1B928']
                }]
            }
        });

    </script>

    <%
        long climaPlaya = control.getCantidadClimaviajes("cálido");
        long climaMontana = control.getCantidadClimaviajes("templado");
        long climaCiudad = control.getCantidadClimaviajes("frío");
        long climaAventura = control.getCantidadClimaviajes("templado");
        long popularidadPlaya = control.getPopularidadTipo("playa");
        long popularidadMontana = control.getPopularidadTipo("montaña");
        long popularidadCiudad = control.getPopularidadTipo("ciudad");
        long popularidadAventura = control.getPopularidadTipo("aventura");
    %>

    <script>
        const ctx3 = document.getElementById('graficoDispercion').getContext('2d');
        new Chart(ctx3, {
            type: 'scatter',
            data: {
                datasets: [{
                    label: 'Relación entre Popularidad y Clima',
                    data: [
                        { x: <%=climaPlaya%>, y: <%=popularidadPlaya%>, label: 'Playa' },
                        { x: <%=climaMontana%>, y: <%=popularidadMontana%>, label: 'Montaña' },
                        { x: <%=climaCiudad%>, y: <%=popularidadCiudad%>, label: 'Ciudad' },
                        { x: <%=climaAventura%>, y: <%=popularidadAventura%>, label: 'Aventura' }
                    ],
                    backgroundColor: '#E1D43B'
                }]
            },
            options: {
                scales: {
                    x: { title: { display: true, text: 'Clima' } },
                    y: { title: { display: true, text: 'Popularidad' } }
                }
            }
        });
    </script>
</body>
</html>
