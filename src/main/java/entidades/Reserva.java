package entidades;

public class Reserva {
	
	private int idReserva;
	private int idUsuario;
	private int idViaje;
	private String codigoReserva;
	private String fechaReserva;
	private double montoTotal;
	private String metodoPago;
	private String estado;
	
	public Reserva(int idReserva, int idUsuario, int idViaje, String codigoReserva, String fechaReserva,
			double montoTotal, String metodoPago, String estado) {
		this.idReserva = idReserva;
		this.idUsuario = idUsuario;
		this.idViaje = idViaje;
		this.codigoReserva = codigoReserva;
		this.fechaReserva = fechaReserva;
		this.montoTotal = montoTotal;
		this.metodoPago = metodoPago;
		this.estado = estado;
	}
	
	public Reserva(int idUsuario, int idViaje, String codigoReserva, String fechaReserva,
			double montoTotal, String metodoPago, String estado) {
		this(0, idUsuario, idViaje, codigoReserva, fechaReserva, montoTotal, metodoPago, estado);
	}
	
	public Reserva() {
		this(0, 0, "", "", 0.0, "", "");
	}

	public int getIdReserva() {
		return idReserva;
	}

	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public int getIdViaje() {
		return idViaje;
	}

	public void setIdViaje(int idViaje) {
		this.idViaje = idViaje;
	}

	public String getCodigoReserva() {
		return codigoReserva;
	}

	public void setCodigoReserva(String codigoReserva) {
		this.codigoReserva = codigoReserva;
	}

	public String getFechaReserva() {
		return fechaReserva;
	}

	public void setFechaReserva(String fechaReserva) {
		this.fechaReserva = fechaReserva;
	}

	public double getMontoTotal() {
		return montoTotal;
	}

	public void setMontoTotal(double montoTotal) {
		this.montoTotal = montoTotal;
	}

	public String getMetodoPago() {
		return metodoPago;
	}

	public void setMetodoPago(String metodoPago) {
		this.metodoPago = metodoPago;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
