package entidades;

import java.time.LocalDate;
import java.time.LocalTime;

public class Viaje {

	private int idViaje;
	private String codigoViaje;
	private int idRuta;
	private String codigoRuta;
	private int idBus;
	private int idConductor;
	private int idCopiloto;
	private LocalDate fechaSalida;
	private LocalTime horaSalida;
	private LocalDate fechaLlegada;
	private LocalTime horaLlegada;
	private double tarifa;
	private int estado;
	private String tipoBus;
	private int nroAsientos;
	private String nombreConductor;
	private String ciudadOrigen;
	private String ciudadDestino;

	public Viaje(int idViaje, String codigoViaje, int idRuta, String codigoRuta, int idBus, int idConductor, int idCopiloto, 
			LocalDate fechaSalida, LocalTime horaSalida, LocalDate fechaLlegada, LocalTime horaLlegada, double tarifa,
			int estado, String tipoBus, int nroAsientos, String nombreConductor, String ciudadOrigen, String ciudadDestino) {
		this.idViaje = idViaje;
		this.codigoViaje = codigoViaje;
		this.idRuta = idRuta;
		this.codigoRuta = codigoRuta;
		this.idBus = idBus;
		this.idConductor = idConductor;
		this.idCopiloto = idCopiloto;
		this.fechaSalida = fechaSalida;
		this.horaSalida = horaSalida;
		this.fechaLlegada = fechaLlegada;
		this.horaLlegada = horaLlegada;
		this.tarifa = tarifa;
		this.estado = estado;
		this.tipoBus = tipoBus;
		this.nroAsientos = nroAsientos;
		this.nombreConductor = nombreConductor;
		this.ciudadOrigen = ciudadOrigen;
		this.ciudadDestino = ciudadDestino;
	}

	public Viaje(String codigoViaje, int idRuta, String codigoRuta, int idBus, int idConductor, int idCopiloto, 
			LocalDate fechaSalida, LocalTime horaSalida, LocalDate fechaLlegada, LocalTime horaLlegada, double tarifa, int estado,
			String tipoBus, int nroAsientos, String nombreConductor, String ciudadOrigen, String ciudadDestino) {
		this(0, codigoViaje, idRuta, codigoRuta, idBus, idConductor, idCopiloto, fechaSalida, horaSalida, fechaLlegada, horaLlegada,
				tarifa, estado, tipoBus, nroAsientos, nombreConductor, ciudadOrigen, ciudadDestino);
	}

	public Viaje() {
		this("", 0, "", 0, 0, 0, null, null, null, null, 0.0, 0, "", 0, "", "", "");
	}

	public int getIdViaje() {
		return idViaje;
	}

	public void setIdViaje(int idViaje) {
		this.idViaje = idViaje;
	}

	public String getCodigoViaje() {
		return codigoViaje;
	}

	public void setCodigoViaje(String codigoViaje) {
		this.codigoViaje = codigoViaje;
	}

	public int getIdRuta() {
		return idRuta;
	}

	public void setIdRuta(int idRuta) {
		this.idRuta = idRuta;
	}

	public String getCodigoRuta() {
		return codigoRuta;
	}

	public void setCodigoRuta(String codigoRuta) {
		this.codigoRuta = codigoRuta;
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

	public LocalDate getFechaSalida() {
		return fechaSalida;
	}

	public void setFechaSalida(LocalDate fechaSalida) {
		this.fechaSalida = fechaSalida;
	}

	public LocalTime getHoraSalida() {
		return horaSalida;
	}

	public void setHoraSalida(LocalTime horaSalida) {
		this.horaSalida = horaSalida;
	}

	public LocalDate getFechaLlegada() {
		return fechaLlegada;
	}

	public void setFechaLlegada(LocalDate fechaLlegada) {
		this.fechaLlegada = fechaLlegada;
	}

	public LocalTime getHoraLlegada() {
		return horaLlegada;
	}

	public void setHoraLlegada(LocalTime horaLlegada) {
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

	public String getTipoBus() {
		return tipoBus;
	}

	public void setTipoBus(String tipoBus) {
		this.tipoBus = tipoBus;
	}

	public int getNroAsientos() {
		return nroAsientos;
	}

	public void setNroAsientos(int nroAsientos) {
		this.nroAsientos = nroAsientos;
	}

	public String getNombreConductor() {
		return nombreConductor;
	}

	public void setNombreConductor(String nombreConductor) {
		this.nombreConductor = nombreConductor;
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

	
}