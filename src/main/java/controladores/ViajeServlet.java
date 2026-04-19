package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import dao.ViajeDAO;
import entidades.Viaje;
import interfaces.IViajeDAO;
/**
 * Servlet implementation class ViajeServlet
 */
@WebServlet(name = "viaje", urlPatterns = { "/viaje" })
public class ViajeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IViajeDAO viajeDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViajeServlet() {
        super();
        this.viajeDAO = ViajeDAO.getInstancia();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = "";
		if (request.getParameter("opcion") != null) opcion = request.getParameter("opcion");
		
		switch (opcion) {
        case "listarAsientos":
           this.listarAsientos(request, response);
           break;
        default:
           this.listarViajes(request, response);
     }
	}
	
	protected void listarAsientos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       int idViaje = 0;
	       if (request.getParameter("idViaje") != null) {
	           idViaje = Integer.parseInt(request.getParameter("idViaje"));
	       }

	       Viaje viaje = this.viajeDAO.obtener(idViaje);
	       
	       request.setAttribute("viaje", viaje);
	       request.getRequestDispatcher("/ventas/asiento.jsp").forward(request, response);
	}
	
	protected void listarViajes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       int rutaId = 0;
	       if (request.getParameter("rutaId") != null) {
	           rutaId = Integer.parseInt(request.getParameter("rutaId"));
	       }
	       
	       String fechaPartida = "";
	       if (request.getParameter("fechaViaje") != null) {
	           fechaPartida = request.getParameter("fechaViaje");
	       }

	       ArrayList<Viaje> listaViajes = this.viajeDAO.buscarViajesPorRutaYFecha(rutaId, fechaPartida);
	       
	       request.setAttribute("listaViajes", listaViajes);
	       request.getRequestDispatcher("/ventas/viaje.jsp").forward(request, response);
	    }

}
