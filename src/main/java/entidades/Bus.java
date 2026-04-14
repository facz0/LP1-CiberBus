package entidades;

public class Bus {
	
	private int IdBus;
	private int NroPlaca;
	private String Marca;
	private String TipoBus;
	private int CantidadPisos;
	private int NroAsientos;
	private int Estado;
	
	// Constructor completo
	public Bus(int idBus, int nroPlaca, String marca, String tipoBus, int cantidadPisos, int nroAsientos, int estado) {
		super();
		IdBus = idBus;
		NroPlaca = nroPlaca;
		Marca = marca;
		TipoBus = tipoBus;
		CantidadPisos = cantidadPisos;
		NroAsientos = nroAsientos;
		Estado = estado;
	}
	
	public Bus(int nroPlaca, String marca, String tipoBus, int cantidadPisos, int nroAsientos, int estado) {
		this(0,nroPlaca, marca, tipoBus,cantidadPisos,nroAsientos,estado);
	}
	
	public Bus() {
		this(0,"","",0,0,0);
	}

	public int getIdBus() {
		return IdBus;
	}

	public void setIdBus(int idBus) {
		IdBus = idBus;
	}

	public int getNroPlaca() {
		return NroPlaca;
	}

	public void setNroPlaca(int nroPlaca) {
		NroPlaca = nroPlaca;
	}

	public String getMarca() {
		return Marca;
	}

	public void setMarca(String marca) {
		Marca = marca;
	}

	public String getTipoBus() {
		return TipoBus;
	}

	public void setTipoBus(String tipoBus) {
		TipoBus = tipoBus;
	}

	public int getCantidadPisos() {
		return CantidadPisos;
	}

	public void setCantidadPisos(int cantidadPisos) {
		CantidadPisos = cantidadPisos;
	}

	public int getNroAsientos() {
		return NroAsientos;
	}

	public void setNroAsientos(int nroAsientos) {
		NroAsientos = nroAsientos;
	}

	public int getEstado() {
		return Estado;
	}

	public void setEstado(int estado) {
		Estado = estado;
	}
	

}
