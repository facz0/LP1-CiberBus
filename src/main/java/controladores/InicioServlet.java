package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import entidades.Ruta;
import interfaces.IRutaDAO;
import dao.RutaDAO;
import interfaces.IViajeDAO;

@WebServlet(name = "inicio", urlPatterns = { "/inicio" })
public class InicioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private IRutaDAO rutaDAO;
    private IViajeDAO viajeDAO;
       
    public InicioServlet() {
        super();
        this.rutaDAO = RutaDAO.getInstancia();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String opcion = "";
        if (request.getParameter("opcion") != null) opcion = request.getParameter("opcion");
       
        switch (opcion) {
            case "buscarDestinos": 
                this.listarDestinos(request, response); 
                break;
            default:
                this.listarOrigen(request, response);
        }
    }
    
    protected void listarOrigen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Ruta> listaPartida = this.rutaDAO.listarCiudadesPartida();
        
        request.setAttribute("listaOrigen", listaPartida);
        request.getRequestDispatcher("/inicio.jsp").forward(request, response);
    }
    
    protected void listarDestinos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int ciudadOrigen = Integer.parseInt(request.getParameter("origenId"));
            
            ArrayList<Ruta> listaDestinos = this.rutaDAO.listarDestinosPorOrigen(ciudadOrigen);
            ArrayList<Ruta> listaPartida = this.rutaDAO.listarCiudadesPartida();
            
            request.setAttribute("listaOrigen", listaPartida);
            request.setAttribute("listaDestino", listaDestinos);
            request.setAttribute("origenId", ciudadOrigen); 
            
        } catch (Exception e) {
            System.out.println("Error al cargar los destinos: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/inicio.jsp").forward(request, response);
    }
}