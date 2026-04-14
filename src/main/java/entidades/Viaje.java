package entidades;


public class Viaje {

    private int idViaje;
    private int codigoViaje;
    private int idRuta;       // FK hacia tabla ruta
    private int idBus;        // FK hacia tabla bus
    private int idConductor;  // FK hacia tabla conductor
    private int idCopiloto;   // FK hacia tabla conductor
    private String fechaSalida; //LocalDate
    private String horaSalida;
    private String fechaLlegada;
    private String horaLlegada;
    private double tarifa;
    private int estado;
 // CAMPOS PARA MOSTRAR JOIN
    private String tipoBus;
    private String departamento;

    // Constructor completo
    
    public Viaje(int idViaje, int codigoViaje, int idRuta, int idBus,
                 int idConductor, int idCopiloto,
                 String fechaSalida, String horaSalida,
                 String fechaLlegada, String horaLlegada,
                 double tarifa, int estado) {
        this.idViaje = idViaje;
        this.codigoViaje = codigoViaje;
        this.idRuta = idRuta;
        this.idBus = idBus;
        this.idConductor = idConductor;
        this.idCopiloto = idCopiloto;
        this.fechaSalida = fechaSalida;
        this.horaSalida = horaSalida;
        this.fechaLlegada = fechaLlegada;
        this.horaLlegada = horaLlegada;
        this.tarifa = tarifa;
        this.estado = estado;
    }

    // Constructor parcial  es sin idViaje sirve cuando la BD lo genera automáticamente)
    
    public Viaje(int codigoViaje, int idRuta, int idBus, int idConductor, int idCopiloto,String fechaSalida, String horaSalida,String fechaLlegada, String horaLlegada,
                 double tarifa, int estado) {
        this(0, codigoViaje, idRuta, idBus, idConductor, idCopiloto,
             fechaSalida, horaSalida, fechaLlegada, horaLlegada, tarifa, estado);
    }

    // Constructor vacío valores por defecto
    public Viaje() {
        this(0,0, 0, 0, 0, "","","","", 0,0);
        		
    }

	public int getIdViaje() {
		return idViaje;
	}

	public void setIdViaje(int idViaje) {
		this.idViaje = idViaje;
	}

	public int getCodigoViaje() {
		return codigoViaje;
	}

	public void setCodigoViaje(int codigoViaje) {
		this.codigoViaje = codigoViaje;
	}

	public int getIdRuta() {
		return idRuta;
	}

	public void setIdRuta(int idRuta) {
		this.idRuta = idRuta;
	}

	public int getIdBus() {
		return idBus;
	}

	public void setIdBus(int idBus) {
		this.idBus = idBus;
	}

	public int getIdConductor() {
		return idConductor;
	}

	public void setIdConductor(int idConductor) {
		this.idConductor = idConductor;
	}

	public int getIdCopiloto() {
		return idCopiloto;
	}

	public void setIdCopiloto(int idCopiloto) {
		this.idCopiloto = idCopiloto;
	}

	public String getFechaSalida() {
		return fechaSalida;
	}

	public void setFechaSalida(String fechaSalida) {
		this.fechaSalida = fechaSalida;
	}

	public String getHoraSalida() {
		return horaSalida;
	}

	public void setHoraSalida(String horaSalida) {
		this.horaSalida = horaSalida;
	}

	public String getFechaLlegada() {
		return fechaLlegada;
	}

	public void setFechaLlegada(String fechaLlegada) {
		this.fechaLlegada = fechaLlegada;
	}

	public String getHoraLlegada() {
		return horaLlegada;
	}

	public void setHoraLlegada(String horaLlegada) {
		this.horaLlegada = horaLlegada;
	}

	public double getTarifa() {
		return tarifa;
	}

	public void setTarifa(double tarifa) {
		this.tarifa = tarifa;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	// se agrega estos get y set para poder hacer el join
	public String getTipoBus() {
	    return tipoBus;
	}

	public void setTipoBus(String tipoBus) {
	    this.tipoBus = tipoBus;
	}

	public String getDepartamento() {
	    return departamento;
	}

	public void setDepartamento(String departamento) {
	    this.departamento = departamento;
	}
	
}
