package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import dao.RutaDAO;
import entidades.Ruta;
import interfaces.IRutaDAO;

/**
 * Servlet implementation class RutaServlet
 */
@WebServlet(name = "ruta", urlPatterns = { "/ruta" })
public class RutaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IRutaDAO rutaDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RutaServlet() {
        super();
        this.rutaDAO = RutaDAO.getInstancia();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = "";
		if (request.getParameter("opcion") != null) opcion = request.getParameter("opcion");
		
		switch (opcion) {
			case "lista": this.lista(request, response); break;
			case "registrar": this.registrar(request, response); break; // Sirve para CREAR y EDITAR
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
		
		ArrayList<Ruta> lista = this.rutaDAO.buscar(texto);
		request.setAttribute("lista", lista);
		request.getRequestDispatcher("/administrador/ruta_mant.jsp").forward(request, response);
	}
	
	protected void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int idRuta = Integer.parseInt(request.getParameter("idRuta")); 
	        int idCiudadOrigen = Integer.parseInt(request.getParameter("idCiudadOrigen"));
	        int idCiudadDestino = Integer.parseInt(request.getParameter("idCiudadDestino"));
	        double horasEstimadas = Double.parseDouble(request.getParameter("horasEstimadas"));
	        int estado = Integer.parseInt(request.getParameter("estado"));
	        
	        Ruta ruta = new Ruta(idRuta, idCiudadOrigen, idCiudadDestino, horasEstimadas, estado, "", "");
	        
	        if(ruta.getIdRuta() == 0) {
	        	this.rutaDAO.crear(ruta);
	        } else {
	        	this.rutaDAO.actualizar(ruta);
	        }
	        response.sendRedirect("ruta?opcion=lista");
	        
		} catch(Exception e) {
			System.out.println("Error en el registro/actualización: " + e.getMessage());
	        response.sendRedirect("ruta?opcion=lista");
		}
		
	}
	
	protected void eliminar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null) {
			int idRuta = Integer.parseInt(request.getParameter("id"));
			this.rutaDAO.eliminar(idRuta);
		}
		
		response.sendRedirect("ruta");
	}

}
