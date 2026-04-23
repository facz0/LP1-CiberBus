package entidades;

import java.time.LocalDate;

public class Pasajero {
	
	private int idPasajero;
	private String tipoDocumento;
	private String nroDocumento;
	private String nombre;
	private String apellido;
	private String correo;
	private String telefono;
	private LocalDate fechaNacimiento;
	private String nacionalidad;
	private String genero;
	private int estado;
	
	public Pasajero(int idPasajero, String tipoDocumento, String nroDocumento, String nombre, String apellido,
			String correo, String telefono, LocalDate fechaNacimiento, String nacionalidad, String genero, int estado) {
		this.idPasajero = idPasajero;
		this.tipoDocumento = tipoDocumento;
		this.nroDocumento = nroDocumento;
		this.nombre = nombre;
		this.apellido = apellido;
		this.correo = correo;
		this.telefono = telefono;
		this.fechaNacimiento = fechaNacimiento;
		this.nacionalidad = nacionalidad;
		this.genero = genero;
		this.estado = estado;
	}
	
	public Pasajero(String tipoDocumento, String nroDocumento, String nombre, String apellido,
			String correo, String telefono, LocalDate fechaNacimiento, String nacionalidad, String genero, int estado) {
		this(0, tipoDocumento, nroDocumento, nombre, apellido, correo, telefono, fechaNacimiento, nacionalidad, genero, estado);
	}
	
	public Pasajero() {
		this("", "", "", "", "", "", null, "", "", 0);
	}

	public int getIdPasajero() {
		return idPasajero;
	}

	public void setIdPasajero(int idPasajero) {
		this.idPasajero = idPasajero;
	}

	public String getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public String getNroDocumento() {
		return nroDocumento;
	}

	public void setNroDocumento(String nroDocumento) {
		this.nroDocumento = nroDocumento;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getNacionalidad() {
		return nacionalidad;
	}

	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}
	
	
	
	
}
