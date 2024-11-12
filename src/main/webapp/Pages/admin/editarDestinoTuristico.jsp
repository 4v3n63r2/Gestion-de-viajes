<%@ page import="java.util.List" %>
<%@ page import="org.consultas.viajes_itca.entity.Destinos" %><%-- 
    Document   : editarDestinoTuristico 
    Created on : 26 oct 2024, 22:11:15 
    Author     : enocc 
--%>

<%
    int id= Integer.parseInt(request.getParameter("id"));
    List<Destinos> destinos = (List<Destinos>) session.getAttribute("destinosAdmin");
    Destinos destino = null;
    for (Destinos d : destinos) {
        if (d.getDestinoId() == id) {
            destino = d;
            break;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Destino - Administrador</title>
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

        .header-section {
            background-color: var(--color-primario);
            color: #fff;
            text-align: center;
            padding: 2rem 0;
        }

        .container {
            max-width: 800px;
        }

        .form-container {
            background-color: #fff;
            border: 1px solid var(--color-secundario);
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
        }

        .form-label {
            color: var(--color-texto);
            font-weight: bold;
        }

        .form-control, .form-select {
            border: 1px solid var(--color-secundario);
            background-color: var(--color-fondo);
        }

        .btn-success {
            background-color: var(--color-acento);
            border: none;
        }

        .btn-success:hover {
            background-color: var(--color-destacado);
        }

        .btn-secondary {
            background-color: var(--color-secundario);
            border: none;
        }

        .btn-secondary:hover {
            background-color: var(--color-primario);
        }

        footer {
            background-color: var(--color-primario);
            color: #fff;
            padding: 1rem;
            text-align: center;
            margin-top: 3rem;
        }
    </style>
</head>
<body>
    <!-- Formulario de Edición de Destino -->
    <div class="container">
        <div class="form-container">
            <h2 class="mb-4" style="color: var(--color-primario);">Modificar Información</h2>
            <form method="post" action="../../AutalizarDestino">
                <div class="mb-3">
                    <label for="nombreDestino" class="form-label">Nombre del Destino</label>
                    <input type="text" class="form-control" name="nombreDestino" id="nombreDestino" value="<%=destino.getNombre()%>" required>
                </div>
                <input type="hidden" name="id" value="<%=destino.getDestinoId()%>">
                <div class="mb-3">
                    <label for="tipoDestino" class="form-label">Tipo de Destino</label>
                    <select class="form-select" name="tipoDestino" id="tipoDestino">
                        <option value="playa" <%=destino.getTipoDestino().equals("playa") ? "selected" : ""%>>Playa</option>
                        <option value="montana" <%=destino.getTipoDestino().equals("montana") ? "selected" : ""%>>Montaña</option>
                        <option value="ciudad" <%=destino.getTipoDestino().equals("ciudad") ? "selected" : ""%>>Ciudad</option>
                        <option value="aventura" <%=destino.getTipoDestino().equals("aventura") ? "selected" : ""%>>Aventura</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="clima" class="form-label">Clima</label>
                    <input type="text" class="form-control" name="clima" id="clima" value="<%=destino.getClima()%>" required>
                </div>
                <div class="mb-3">
                    <label for="pais" class="form-label">País</label>
                    <input type="text" class="form-control" name="pais" id="pais" value="<%=destino.getPais()%>" required>
                </div>
                <div class="mb-3">
                    <label for="imagenURL" class="form-label">Imagen (URL)</label>
                    <input type="url" class="form-control" name="urlimg" id="imagenURL" value="<%=destino.getUrl()%>" required>
                </div>
                <div class="d-flex justify-content-between mt-4">
                    <button type="submit" class="btn btn-success">Guardar Cambios</button>
                    <a href="gestionDestinos.jsp" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
