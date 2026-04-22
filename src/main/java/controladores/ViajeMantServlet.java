package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import dao.BusDAO;
import dao.ConductorDAO;
import dao.RutaDAO;
import dao.ViajeDAO;
import entidades.Viaje;
import interfaces.IViajeDAO;

/**
 * Servlet implementation class ViajeMantServlet
 */
@WebServlet(name = "ViajeMant", urlPatterns = { "/ViajeMant" })
public class ViajeMantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private IViajeDAO viajeDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViajeMantServlet() {
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
		
		ArrayList<Viaje> lista = this.viajeDAO.buscar(texto);
		request.setAttribute("lista", lista);
		
		request.setAttribute("listaRutas", RutaDAO.getInstancia().listar());
		request.setAttribute("listaBuses", BusDAO.getInstancia().listar());
		request.setAttribute("listaConductores", ConductorDAO.getInstancia().listar());
		
		request.getRequestDispatcher("/administrador/viaje_mant.jsp").forward(request, response);
	}
	
	protected void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idViaje = Integer.parseInt(request.getParameter("idViaje")); 
	        String codigoViaje = request.getParameter("codigoViaje");
	        int idRuta = Integer.parseInt(request.getParameter("idRuta"));
	        int idBus = Integer.parseInt(request.getParameter("idBus"));
	        int idConductor = Integer.parseInt(request.getParameter("idConductor"));
	        int idCopiloto = 0;
	        if(request.getParameter("idCopiloto") != null && !request.getParameter("idCopiloto").isEmpty()) {
	        	idCopiloto = Integer.parseInt(request.getParameter("idCopiloto"));
	        }
	        LocalDate fechaSalida = LocalDate.parse(request.getParameter("fechaSalida"));
	        LocalTime horaSalida = LocalTime.parse(request.getParameter("horaSalida"));
	        LocalDate fechaLlegada = LocalDate.parse(request.getParameter("fechaLlegada"));
	        LocalTime horaLlegada = LocalTime.parse(request.getParameter("horaLlegada"));
	        double tarifa = Double.parseDouble(request.getParameter("tarifa"));
	        int estado = Integer.parseInt(request.getParameter("estado"));
	        
	        Viaje viaje = new Viaje(idViaje, codigoViaje, idRuta, "", idBus, idConductor, idCopiloto, 
	        		fechaSalida, horaSalida, fechaLlegada, horaLlegada, tarifa, estado, "", 0, "", "", "");
	        
	        if(viaje.getIdViaje() == 0) {
	        	this.viajeDAO.crear(viaje);
	        } else {
	        	this.viajeDAO.actualizar(viaje);
	        }
	        response.sendRedirect("ViajeMant?opcion=lista");
	        
		} catch(Exception e) {
			System.out.println("Error en el registro/actualización de viaje: " + e.getMessage());
	        response.sendRedirect("ViajeMant?opcion=lista");
		}
	}
	
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null) {
			int idViaje = Integer.parseInt(request.getParameter("id"));
			this.viajeDAO.eliminar(idViaje);
		}
		
		response.sendRedirect("ViajeMant");
	}

}
