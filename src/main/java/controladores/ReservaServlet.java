package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.ViajeDAO;
import entidades.Viaje;
import interfaces.IViajeDAO;

/**
 * Servlet implementation class ReservaServlet
 */
@WebServlet(name = "reserva", urlPatterns = { "/reserva" })
public class ReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private IViajeDAO viajeDAO;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservaServlet() {
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
        default:
           this.listarPasajeros(request, response);
     }
	}
	
	protected void listarPasajeros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	       int idViaje = 0;
	       if (request.getParameter("idViaje") != null) idViaje = Integer.parseInt(request.getParameter("idViaje"));
	       
	       String asientosSeleccionados = "";
	       if (request.getParameter("asientosSeleccionados") != null) asientosSeleccionados = request.getParameter("asientosSeleccionados");
	       
	       int cantidadSeleccionados = 0;
	       if (request.getParameter("cantidadSeleccionados") != null) cantidadSeleccionados = Integer.parseInt(request.getParameter("cantidadSeleccionados"));
	       
	       double totalPagar = 0;
	       if (request.getParameter("totalPagar") != null) totalPagar = Double.parseDouble(request.getParameter("totalPagar"));
	       
	       Viaje viaje = this.viajeDAO.obtener(idViaje);
	       
	       request.setAttribute("viaje", viaje);
	       request.setAttribute("asientosSeleccionados", asientosSeleccionados);
	       request.setAttribute("cantidadSeleccionados", cantidadSeleccionados);
	       request.setAttribute("totalPagar", totalPagar);
	       
	       request.getRequestDispatcher("/ventas/reserva.jsp").forward(request, response);
	    }

}
