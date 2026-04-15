package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import dao.ConductorDAO;
import entidades.Conductor;
import interfaces.IConductorDAO;

/**
 * Servlet implementation class ConductorServlet
 */
@WebServlet(name = "Conductor", urlPatterns = { "/Conductor" })
public class ConductorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IConductorDAO conductorDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConductorServlet() {
        super();
        this.conductorDAO = ConductorDAO.getInstancia();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = "";
		if (request.getParameter("opcion") != null) opcion = request.getParameter("opcion");
		
		switch (opcion) {
			case "lista": this.lista(request, response); break;
			//case "registrar": this.registrar(request, response); break; // Sirve para CREAR y EDITAR
			//case "eliminar": this.eliminar(request, response); break;
			default: 
				this.lista(request, response);
		}
	}
	
	protected void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String texto = "";
		if(request.getParameter("texto") != null) {
			texto = request.getParameter("texto");
		}
		
		ArrayList<Conductor> lista = this.conductorDAO.buscar(texto);
		request.setAttribute("lista", lista);
		request.getRequestDispatcher("/administrador/conductores_mant.jsp").forward(request, response);
	}

}
