package controladores;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;

import dao.DetalleReservaDAO;
import dao.PasajeroDAO;
import dao.ReservaDAO;
import dao.ViajeAsientoDAO;
import dao.ViajeDAO;
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
		
		switch (opcion) {
		case "pagar" :
			this.pagarReserva(request, response);
			break;
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
	
	protected void pagarReserva(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idViaje = Integer.parseInt(request.getParameter("idViaje"));
		int cantidadSeleccionados = Integer.parseInt(request.getParameter("cantidadSeleccionados"));
		double totalPagar = Double.parseDouble(request.getParameter("totalPagar"));
		String asientosSeleccionados = request.getParameter("asientosSeleccionados");
		ArrayList<Pasajero> listaPasajeros = new ArrayList<Pasajero>();
		
		// 1. Registrar cabecera de reserva
		Reserva reserva = new Reserva();
		reserva.setIdUsuario(1); //Luego debe venir de la sesión del usuario
		reserva.setIdViaje(idViaje);
		reserva.setCodigoReserva(generarCodigoReserva());
		reserva.setMontoTotal(totalPagar);
		reserva.setMetodoPago("PAGO WEB");
		reserva.setEstado("PAGADA");
		
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
			Pasajero pasajero = new Pasajero();
			pasajero.setTipoDocumento(tipoDocumento);
			pasajero.setNroDocumento(nroDocumento);
			pasajero.setNombre(nombre);
			pasajero.setApellido(apellido);
			pasajero.setCorreo(correo);
			pasajero.setTelefono(telefono);
			pasajero.setFechaNacimiento(LocalDate.parse(fechaNacimiento));
			pasajero.setNacionalidad(nacionalidad);
			pasajero.setGenero(genero);
			pasajero.setEstado(1);
			
			int idPasajero = 0;
			idPasajero = pasajeroDAO.crear(pasajero);
			listaPasajeros.add(pasajero);
			
			
			// 2.2 Registrar los asientos para el viaje
			ViajeAsiento viajeAsiento = new ViajeAsiento();
			viajeAsiento.setIdViaje(idViaje);
			viajeAsiento.setNroAsiento(nroAsiento);
			viajeAsiento.setPiso(1);
			viajeAsiento.setEstado(1);
			
			int idViajeAsiento = 0;
			idViajeAsiento = viajeAsientoDAO.crear(viajeAsiento);
			
			//2.3 Registrar el Detalle de la Cabecera de la Reserva
			DetalleReserva detalle = new DetalleReserva();
			detalle.setIdReserva(idReserva);
			detalle.setIdViajeAsiento(idViajeAsiento);
			detalle.setIdPasajero(idPasajero);
			detalle.setPrecioPagado(totalPagar / cantidadSeleccionados);

			detalleReservaDAO.crear(detalle);
	
		}
	}
	
	private String generarCodigoReserva() {
		long tiempo = System.currentTimeMillis();
		return "RSV" + tiempo;
	}

}


