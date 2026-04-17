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
import interfaces.IPasajeDAO; // Del código de los junior, preparado para el futuro

@WebServlet(name = "inicio", urlPatterns = { "/inicio" })
public class InicioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private IRutaDAO rutaDAO;
    private IPasajeDAO viajeModel; // Listo para cuando hagan la lógica de buscar pasajes
       
    public InicioServlet() {
        super();
        this.rutaDAO = new RutaDAO();
        // this.viajeModel = new PasajeDAO(); // Descomentar cuando implementes el DAO
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Validación limpia de la opción usando operador ternario
        String opcion = request.getParameter("opcion") != null ? request.getParameter("opcion") : "";
       
        switch (opcion) {
            case "buscarDestinos": 
                this.listarDestinos(request, response); 
                break;
            // Aquí agregarás un 'case "buscarPasajes":' cuando pases a la siguiente fase
            default:
                this.listarOrigen(request, response);
        }
    }
    
    protected void listarOrigen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Carga inicial: solo pinta las ciudades de partida
        ArrayList<Ruta> listaPartida = this.rutaModel.listarCiudadesPartida();
        
        request.setAttribute("listaOrigen", listaPartida);
        request.getRequestDispatcher("/reserva/inicio.jsp").forward(request, response);
    }
    
    protected void listarDestinos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Se envuelve en try-catch por si el origenId llega vacío o corrompido
            int ciudadOrigen = Integer.parseInt(request.getParameter("origenId"));
            
            ArrayList<Ruta> listaDestinos = this.rutaModel.listarDestinosPorOrigen(ciudadOrigen);
            ArrayList<Ruta> listaPartida = this.rutaModel.listarCiudadesPartida();
            
            // Se envían ambos arreglos para que no se borre el primer desplegable
            request.setAttribute("listaOrigen", listaPartida);
            request.setAttribute("listaDestino", listaDestinos);
            request.setAttribute("origenId", ciudadOrigen); // Para que el select recuerde qué se eligió
            
        } catch (Exception e) {
            System.out.println("Error al cargar los destinos: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/reserva/inicio.jsp").forward(request, response);
    }
}
