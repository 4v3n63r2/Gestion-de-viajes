<%@ page import="java.util.List" %>
<%@ page import="org.consultas.viajes_itca.entity.Usuarios" %><%-- 
    Document   : gestionUsuario 
    Created on : 25 oct 2024, 22:10:22 
    Author     : enocc 
--%>

<%
    List<Usuarios> usuarios = (List<Usuarios>) session.getAttribute("usuarios");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios - Administrador</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f2f5;
            color: #333;
            font-family: Arial, sans-serif;
        }

        h2 {
            color: #4a90e2;
        }

        table {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
        }

        thead {
            background-color: #4a90e2;
            color: #fff;
        }

        .btn-info {
            background-color: #4a90e2;
            border: none;
        }

        .btn-warning {
            background-color: #f0ad4e;
            border: none;
        }

        .btn-danger {
            background-color: #e94e77;
            border: none;
        }

        .btn-danger:hover {
            background-color: #d43f60;
        }

        .modal-content {
            border-radius: 8px;
        }

        .modal-header, .modal-footer {
            border: none;
        }

        footer {
            background-color: #4a90e2;
            color: #f0f2f5;
            padding: 15px 0;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f7f9fc;
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
    <!-- Tabla de Usuarios -->
    <div class="container my-5">
        <h2 class="mb-4">Usuarios Registrados</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Correo Electrónico</th>
                    <th>Rol</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Usuarios usuario : usuarios) {
                %>
                <tr>
                    <td><%=usuario.getUserId()%></td>
                    <td><%=usuario.getNombre()%></td>
                    <td><%=usuario.getEmail()%></td>
                    <td>
                        <a href="detalleUsuario.jsp?userxd=<%=usuario.getUserId()%>" class="btn btn-info btn-sm">Ver Detalle</a>
                        <a href="vistaModificarUsuario.jsp?userxd=<%=usuario.getUserId()%>" class="btn btn-warning btn-sm">Modificar</a>
                        <form action="../../EliminarUser" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%=usuario.getUserId()%>">
                            <button type="submit" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#eliminarModal">Eliminar</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Modal de Confirmación de Eliminación -->
    <div class="modal fade" id="eliminarModal" tabindex="-1" aria-labelledby="eliminarModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eliminarModalLabel">Confirmar Eliminación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ¿Estás seguro de que deseas eliminar a este usuario?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-danger">Eliminar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
