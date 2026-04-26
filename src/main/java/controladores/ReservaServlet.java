package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import dao.DetalleReservaDAO;
import dao.PasajeroDAO;
import dao.ReservaDAO;
import dao.ViajeAsientoDAO;
import dao.ViajeDAO;
import entidades.DetalleReserva;
import entidades.Pasajero;
import entidades.Reserva;
import entidades.Viaje;
import entidades.ViajeAsiento;
import interfaces.IDetalleReservaDAO;
import interfaces.IPasajeroDAO;
import interfaces.IReservaDAO;
import interfaces.IViajeAsientoDAO;
import interfaces.IViajeDAO;

/**
 * Servlet implementation class ReservaServlet
 */
@WebServlet(name = "reserva", urlPatterns = { "/reserva" })
public class ReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private IViajeDAO viajeDAO;   
    private IPasajeroDAO pasajeroDAO;
	private IViajeAsientoDAO viajeAsientoDAO;
	private IReservaDAO reservaDAO;
	private IDetalleReservaDAO detalleReservaDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservaServlet() {
        super();
        this.viajeDAO = ViajeDAO.getInstancia();
        //CREAR INSTANCIAS
        this.pasajeroDAO = new PasajeroDAO();
    	this.viajeAsientoDAO = new ViajeAsientoDAO();
    	this.reservaDAO = new ReservaDAO();
    	this.detalleReservaDAO = new DetalleReservaDAO();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = "";
		if (request.getParameter("opcion") != null) opcion = request.getParameter("opcion");
		System.out.println("opcion:"+opcion);
		switch (opcion) {
		case "pagar" :
			this.pagarReserva(request, response);
			break;
		case "consultarReserva" :
			this.consultarReserva(request, response);
			break;
        default:
           this.listarPasajeros(request, response);
     }
	}
	
	private void consultarReserva(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String codigoReserva = request.getParameter("codigoReserva");
			String apellido = request.getParameter("apellido");
			
			System.out.println("codigoReserva:"+codigoReserva);
			System.out.println("apellido:"+apellido);

			ReservaDAO reservaDAO = new ReservaDAO();

			Reserva reserva = reservaDAO.buscarPorCodigoYApellido(codigoReserva, apellido);

			if (reserva == null) {
				request.setAttribute("mensajeError", "No se encontró una reserva con los datos ingresados.");
				request.getRequestDispatcher("/ventas/autogestion.jsp").forward(request, response);
				return;
			}

			ArrayList<Pasajero> listaPasajeros = reservaDAO.listarPasajerosPorReserva(reserva.getIdReserva());
			String asientosSeleccionados = reservaDAO.obtenerAsientosPorReserva(reserva.getIdReserva());

			ViajeDAO viajeDAO = new ViajeDAO();
			Viaje viaje = viajeDAO.obtener(reserva.getIdViaje());

			request.setAttribute("viaje", viaje);
			request.setAttribute("codigoReserva", reserva.getCodigoReserva());
			request.setAttribute("cantidadSeleccionados", listaPasajeros.size());
			request.setAttribute("totalPagar", reserva.getMontoTotal());
			request.setAttribute("asientosSeleccionados", asientosSeleccionados);
			request.setAttribute("listaPasajeros", listaPasajeros);

			request.getRequestDispatcher("/ventas/consulta_reserva.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println("Error consultarReserva: " + e.getMessage());
			e.printStackTrace();

			request.setAttribute("mensajeError", "Ocurrió un error al consultar la reserva.");
			request.getRequestDispatcher("/ventas/autogestion.jsp").forward(request, response);
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
	
	protected void pagarReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idViaje = Integer.parseInt(request.getParameter("idViaje"));
		int cantidadSeleccionados = Integer.parseInt(request.getParameter("cantidadSeleccionados"));
		double totalPagar = Double.parseDouble(request.getParameter("totalPagar"));
		String asientosSeleccionados = request.getParameter("asientosSeleccionados");
		ArrayList<Pasajero> listaPasajeros = new ArrayList<Pasajero>();
		
		// 0. Validar que los datos lleguen correctamente del frontend
		Set<String> documentos = new HashSet<>();
		ArrayList<String> errores = new ArrayList<>();

		for (int i = 0; i < cantidadSeleccionados; i++) {

		    String tipoDocumento = request.getParameter("tipoDocumento_" + i);
		    String nroDocumento = request.getParameter("nroDocumento_" + i);
		    String nombre = request.getParameter("nombre_" + i);
		    String apellido = request.getParameter("apellido_" + i);
		    String correo = request.getParameter("correo_" + i);
		    String telefono = request.getParameter("telefono_" + i);
		    String fechaNacimiento = request.getParameter("fechaNacimiento_" + i);
		    String nacionalidad = request.getParameter("nacionalidad_" + i);
		    String genero = request.getParameter("genero_" + i);

		    // 1. CAMPOS VACÍOS
		    if (tipoDocumento == null || tipoDocumento.trim().isEmpty() ||
		        nroDocumento == null || nroDocumento.trim().isEmpty() ||
		        nombre == null || nombre.trim().isEmpty() ||
		        apellido == null || apellido.trim().isEmpty() ||
		        correo == null || correo.trim().isEmpty() ||
		        telefono == null || telefono.trim().isEmpty() ||
		        fechaNacimiento == null || fechaNacimiento.trim().isEmpty() ||
		        nacionalidad == null || nacionalidad.trim().isEmpty() ||
		        genero == null || genero.trim().isEmpty()) {

		        errores.add("Todos los campos del pasajero " + (i + 1) + " son obligatorios.");
		        continue;
		    }

		    // 2. VALIDAR DNI
		    if ("DNI".equals(tipoDocumento) && !nroDocumento.matches("\\d{8}")) {
		        errores.add("El DNI del pasajero " + (i + 1) + " debe tener 8 dígitos.");
		    }

		    // 3. VALIDAR DUPLICADOS
		    String clave = tipoDocumento + "-" + nroDocumento;

		    if (documentos.contains(clave)) {
		        errores.add("El pasajero " + (i + 1) + " está duplicado.");
		    } else {
		        documentos.add(clave);
		    }
		}
		
		// Si se encontró errores en las validaciones
		if (!errores.isEmpty()) {

		    Viaje viaje = viajeDAO.obtener(idViaje);

		    request.setAttribute("errores", errores);
		    request.setAttribute("viaje", viaje);
		    request.setAttribute("cantidadSeleccionados", cantidadSeleccionados);
		    request.setAttribute("totalPagar", totalPagar);
		    request.setAttribute("asientosSeleccionados", asientosSeleccionados);

		    request.getRequestDispatcher("/ventas/reserva.jsp").forward(request, response);
		    return;
		}
		
		// 1. Registrar cabecera de reserva
		Reserva reserva = new Reserva(0, idViaje, generarCodigoReserva(), "",
				totalPagar, "PAGO WEB", "PAGADA");
		
		int idReserva = reservaDAO.crear(reserva);
		
		System.out.println("idReserva: "+idReserva);
		
		for (int i = 0; i < cantidadSeleccionados; i++) {

			String asientoStr = request.getParameter("asiento_" + i);
			String tipoDocumento = request.getParameter("tipoDocumento_" + i);
			String nroDocumento = request.getParameter("nroDocumento_" + i);
			String nombre = request.getParameter("nombre_" + i);
			String apellido = request.getParameter("apellido_" + i);
			String correo = request.getParameter("correo_" + i);
			String telefono = request.getParameter("telefono_" + i);
			String fechaNacimiento = request.getParameter("fechaNacimiento_" + i);
			String nacionalidad = request.getParameter("nacionalidad_" + i);
			String genero = request.getParameter("genero_" + i);
			int nroAsiento = Integer.parseInt(asientoStr);

			//2.1. Registrar los pasajeros
			Pasajero pasajero = new Pasajero(tipoDocumento, nroDocumento, nombre, apellido,
					correo, telefono, LocalDate.parse(fechaNacimiento), nacionalidad, genero, 1);
			
			int idPasajero = 0;
			idPasajero = pasajeroDAO.crear(pasajero);
			listaPasajeros.add(pasajero);
			
			
			// 2.2 Registrar los asientos para el viaje
			ViajeAsiento viajeAsiento = new ViajeAsiento(idViaje, nroAsiento, 1, 1);
			
			int idViajeAsiento = 0;
			idViajeAsiento = viajeAsientoDAO.crear(viajeAsiento);
			
			//2.3 Registrar el Detalle de la Cabecera de la Reserva
			double precioPorAsiento = totalPagar / cantidadSeleccionados;
			DetalleReserva detalle = new DetalleReserva(idReserva, idViajeAsiento, idPasajero, precioPorAsiento);
			
			detalleReservaDAO.crear(detalle);
		}
		
		Viaje viaje = viajeDAO.obtener(idViaje);
		
			request.setAttribute("viaje", viaje);
			request.setAttribute("codigoReserva", reserva.getCodigoReserva());
			request.setAttribute("cantidadSeleccionados", cantidadSeleccionados);
			request.setAttribute("totalPagar", totalPagar);
			request.setAttribute("asientosSeleccionados", asientosSeleccionados);
			request.setAttribute("listaPasajeros", listaPasajeros);
			request.getRequestDispatcher("/ventas/resumen.jsp").forward(request, response);
	}
	
	//cambio de codigo de reserva, se implementa un número aleatoreo para no
	//superar los 10 digitos limites del codigo en base de datos
	private String generarCodigoReserva() {
		int random = (int)(Math.random()* 90000) + 10000;
		return "RSV" + random; 
	}

}


