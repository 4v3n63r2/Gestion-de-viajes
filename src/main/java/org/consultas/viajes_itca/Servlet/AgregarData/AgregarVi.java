package org.consultas.viajes_itca.Servlet.AgregarData;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.consultas.viajes_itca.control.Control;
import org.consultas.viajes_itca.entity.Destinos;
import org.consultas.viajes_itca.entity.Usuarios;
import org.consultas.viajes_itca.entity.ViajesPorHacer;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AgregarVi", urlPatterns = {"/AgregarVi"})
public class AgregarVi extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        Control control = new Control();
        int id = Integer.parseInt(request.getParameter("destinoId"));
        Usuarios usuario = (Usuarios) request.getSession().getAttribute("usuario");
        Destinos destino = control.getDestino(id);
        System.out.printf("Usuario: %s\n", usuario.getNombre());
        System.out.printf("Destino: %s\n", destino.getNombre());
        ViajesPorHacer viajesPorHacerVerificar = control.getViajePorHacer(usuario.getUserId(), destino.getDestinoId());
        if (viajesPorHacerVerificar != null) {
            response.sendRedirect("Pages/user/home.jsp");
        }else {
            ViajesPorHacer viajesPorHacer = new ViajesPorHacer();
            viajesPorHacer.setUserId(usuario);
            viajesPorHacer.setDestinoId(destino);
            long cantidadIdusuariosDestino=control.obtenerCantidadIdusuariosDestino(destino);
            long cantidadIdusuarios=control.obtenerCantidadIdusuarios();

            destino.setPopularidad(Popularidad(cantidadIdusuariosDestino,cantidadIdusuarios));
            System.out.printf(cantidadIdusuarios+" "+cantidadIdusuariosDestino+" "+destino.getDestinoId());
            try {
                control.ActualizarDestino(destino);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            control.agregarViajePorHacer(viajesPorHacer);
            List<ViajesPorHacer> viajes = control.obtenerViajesPorHacerList(usuario);
            request.getSession().setAttribute("viajes", viajes);
            response.sendRedirect("Pages/user/misviajes.jsp");
        }

    }

    /**
     *  el 10 es el 100% de la popularidad de un destino se calcula la popularidad de un destino mediante la formula tomado en cuenta la cantidad de usuarios que han seleccionado un destino y la popularidad que tiene el destino si no es 0
     *   cantidadIdusuariosDestino*100/10
     * @param cantidadIdusuariosDestino cantidad de usuarios que han seleccionado un destino
     * @return
     */
    public int Popularidad(long cantidadIdusuariosDestino,long cantidadIdusuarios){
        return (int) (cantidadIdusuariosDestino*100/cantidadIdusuarios);
    }
}
