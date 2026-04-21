package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import dao.BusDAO;
import entidades.Bus;
import entidades.Conductor;
import interfaces.IBusDAO;

/**
 * Servlet implementation class BusServlet
 */
@WebServlet(name = "bus", urlPatterns = { "/bus" })
public class BusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IBusDAO busDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusServlet() {
        super();
        this.busDAO = BusDAO.getInstancia();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = "";
		if (request.getParameter("opcion") != null) opcion = request.getParameter("opcion");
		
		switch (opcion) {
			case "lista": this.lista(request, response); break;
			case "registrar": this.registrar(request, response); break; 
			case "eliminar": this.eliminar(request, response); break;
			default: 
				this.lista(request, response);
		}
	}
	
	protected void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String texto = "";
		if(request.getParameter("texto") != null) {
			texto = request.getParameter("texto");
		}
		
		ArrayList<Bus> lista = this.busDAO.buscar(texto);
		request.setAttribute("lista", lista);
		request.getRequestDispatcher("/administrador/buses_mant.jsp").forward(request, response);
	}
	
	protected void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int IdBus = Integer.parseInt(request.getParameter("IdBus"));
			String NroPlaca = request.getParameter("NroPlaca");
			String Marca = request.getParameter("Marca");
			String TipoBus = request.getParameter("TipoBus");
			int CantidadPisos = Integer.parseInt(request.getParameter("CantidadPisos"));
			int NroAsientos = Integer.parseInt(request.getParameter("NroAsientos"));
			int Estado = Integer.parseInt(request.getParameter("Estado"));
		
			Bus bus = new Bus(IdBus, NroPlaca, Marca, TipoBus, CantidadPisos, NroAsientos, Estado);
			
			if(bus.getIdBus() == 0) {
				this.busDAO.crear(bus);
			} else {
				this.busDAO.actualizar(bus);
			}
			response.sendRedirect("bus?opcion=lista");
			
		} catch(Exception e) {
			System.out.println("Error en el registro/actualización: " + e.getMessage());
	        response.sendRedirect("bus?opcion=lista");
		}
		
	}
	
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null) {
			int IdBus = Integer.parseInt(request.getParameter("id"));
			this.busDAO.eliminar(IdBus);
		}
		
		response.sendRedirect("bus");
	}

}
