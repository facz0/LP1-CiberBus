package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import entidades.Viaje;
import interfaces.IViajeModel;
import modelos.ViajeModel;
/**
 * Servlet implementation class InicioServlet
 */
@WebServlet(name = "inicio", urlPatterns = { "/inicio" })
public class InicioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IViajeModel viajeModel;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioServlet() {
        super();
        this.viajeModel = new ViajeModel();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String origen = request.getParameter("origen");
        String destino = request.getParameter("destino");

        // 🔥 CARGAR SELECTS
        ArrayList<String> listaOrigen = viajeModel.listarOrigen();
        ArrayList<String> listaDestino = viajeModel.listarDestino();

        request.setAttribute("listaOrigen", listaOrigen);
        request.setAttribute("listaDestino", listaDestino);

        // 🔥 BUSCAR SOLO SI HAY DATOS
        if (origen != null && destino != null && !origen.isEmpty() && !destino.isEmpty()) {

            ArrayList<Viaje> lista = viajeModel.buscarViajes(origen, destino);

            request.setAttribute("listaViajes", lista);
            request.setAttribute("origen", origen);
            request.setAttribute("destino", destino);
        }
        

        request.getRequestDispatcher("inicio.jsp").forward(request, response);
    }

}
