package controladores;

public class DetalleReserva {
	
	private int idDetalleReserva;
	private int idReserva;
	private int idViajeAsiento;
	private int idPasajero;
	private double precioPagado;
	
	public DetalleReserva(int idDetalleReserva, int idReserva, int idViajeAsiento, int idPasajero,
			double precioPagado) {
		this.idDetalleReserva = idDetalleReserva;
		this.idReserva = idReserva;
		this.idViajeAsiento = idViajeAsiento;
		this.idPasajero = idPasajero;
		this.precioPagado = precioPagado;
	}
	
	public DetalleReserva(int idReserva, int idViajeAsiento, int idPasajero, double precioPagado){
		this(0, idReserva, idViajeAsiento, idPasajero, precioPagado);
	}
	
	public DetalleReserva() {
		this(0, 0, 0, 0.0);
	}

	public int getIdDetalleReserva() {
		return idDetalleReserva;
	}

	public void setIdDetalleReserva(int idDetalleReserva) {
		this.idDetalleReserva = idDetalleReserva;
	}

	public int getIdReserva() {
		return idReserva;
	}

	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}

	public int getIdViajeAsiento() {
		return idViajeAsiento;
	}

	public void setIdViajeAsiento(int idViajeAsiento) {
		this.idViajeAsiento = idViajeAsiento;
	}

	public int getIdPasajero() {
		return idPasajero;
	}

	public void setIdPasajero(int idPasajero) {
		this.idPasajero = idPasajero;
	}

	public double getPrecioPagado() {
		return precioPagado;
	}

	public void setPrecioPagado(double precioPagado) {
		this.precioPagado = precioPagado;
	}
	
	
	
	
}
