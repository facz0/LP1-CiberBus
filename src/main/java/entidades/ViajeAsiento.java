package entidades;

public class ViajeAsiento {
	
	private int idViajeAsiento;
	private int idViaje;
	private int nroAsiento;
	private int piso;
	private int estado;
	
	public ViajeAsiento(int idViajeAsiento, int idViaje, int nroAsiento, int piso, int estado) {
		this.idViajeAsiento = idViajeAsiento;
		this.idViaje = idViaje;
		this.nroAsiento = nroAsiento;
		this.piso = piso;
		this.estado = estado;
	}
	
	public ViajeAsiento(int idViaje, int nroAsiento, int piso, int estado) {
		this(0, idViaje, nroAsiento, piso, estado);
	}
	
	public ViajeAsiento() {
		this(0,0,0,0);
	}

	public int getIdViajeAsiento() {
		return idViajeAsiento;
	}

	public void setIdViajeAsiento(int idViajeAsiento) {
		this.idViajeAsiento = idViajeAsiento;
	}

	public int getIdViaje() {
		return idViaje;
	}

	public void setIdViaje(int idViaje) {
		this.idViaje = idViaje;
	}

	public int getNroAsiento() {
		return nroAsiento;
	}

	public void setNroAsiento(int nroAsiento) {
		this.nroAsiento = nroAsiento;
	}

	public int getPiso() {
		return piso;
	}

	public void setPiso(int piso) {
		this.piso = piso;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	
	

}
