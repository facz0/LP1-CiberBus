package entidades;

public class Ruta {
	
	private int idRuta;
	private String codigoRuta;
    private int idCiudadOrigen;
    private int idCiudadDestino;
    private double horasEstimadas;
    private int estado;
    private String ciudadOrigen;
    private String ciudadDestino;
    
    public Ruta(int idRuta, String codigoRuta, int idCiudadOrigen, int idCiudadDestino, double horasEstimadas, int estado, 
			String ciudadOrigen, String ciudadDestino) {
		this.idRuta = idRuta;
		this.codigoRuta = codigoRuta;
		this.idCiudadOrigen = idCiudadOrigen;
		this.idCiudadDestino = idCiudadDestino;
		this.horasEstimadas = horasEstimadas;
		this.estado = estado;
		this.ciudadOrigen = ciudadOrigen;
		this.ciudadDestino = ciudadDestino;
	}

	public Ruta(String codigoRuta, int idCiudadOrigen, int idCiudadDestino, double horasEstimadas, int estado, 
			String ciudadOrigen, String ciudadDestino) {
		this(0, codigoRuta, idCiudadOrigen, idCiudadDestino, horasEstimadas, estado, ciudadOrigen, ciudadDestino);
	}

	public Ruta() {
		this("", 0, 0, 0.0, 0, "", "");
	}

	public int getIdRuta() {
		return idRuta;
	}

	public void setIdRuta(int idRuta) {
		this.idRuta = idRuta;
	}

	public int getIdCiudadOrigen() {
		return idCiudadOrigen;
	}

	public void setIdCiudadOrigen(int idCiudadOrigen) {
		this.idCiudadOrigen = idCiudadOrigen;
	}

	public int getIdCiudadDestino() {
		return idCiudadDestino;
	}

	public void setIdCiudadDestino(int idCiudadDestino) {
		this.idCiudadDestino = idCiudadDestino;
	}

	public double getHorasEstimadas() {
		return horasEstimadas;
	}

	public void setHorasEstimadas(double horasEstimadas) {
		this.horasEstimadas = horasEstimadas;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public String getCiudadOrigen() {
		return ciudadOrigen;
	}

	public void setCiudadOrigen(String ciudadOrigen) {
		this.ciudadOrigen = ciudadOrigen;
	}

	public String getCiudadDestino() {
		return ciudadDestino;
	}

	public void setCiudadDestino(String ciudadDestino) {
		this.ciudadDestino = ciudadDestino;
	}

	public String getCodigoRuta() {
		return codigoRuta;
	}

	public void setCodigoRuta(String codigoRuta) {
		this.codigoRuta = codigoRuta;
	}
	
}
