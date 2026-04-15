package entidades;

import java.time.LocalDate;

public class Conductor {
	private int conductorId;
	private String tipoDocumento;
	private int numeroDocumento;
	private String nombre;
	private String apellidos;
	private String correo;
	private String categoriaLicencia;
	private String disDescanso;
	private LocalDate vencimientoLicencia;
	private int estado;
	
	public Conductor(int conductorId, String tipoDocumento, int numeroDocumento, String nombre, String apellidos,
			String correo, String categoriaLicencia, String disDescanso, LocalDate vencimientoLicencia, int estado) {
		super();
		this.conductorId = conductorId;
		this.tipoDocumento = tipoDocumento;
		this.numeroDocumento = numeroDocumento;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.correo = correo;
		this.categoriaLicencia = categoriaLicencia;
		this.disDescanso = disDescanso;
		this.vencimientoLicencia = vencimientoLicencia;
		this.estado = estado;
	}
	
	public Conductor(String tipoDocumento, int numeroDocumento, String nombre, String apellidos,
			String correo, String categoriaLicencia, String disDescanso, LocalDate vencimientoLicencia, int estado) {
		this(0, tipoDocumento, numeroDocumento, nombre, apellidos, correo, categoriaLicencia, disDescanso,
				vencimientoLicencia, estado);
	}
	
	public Conductor() {
		this("", 0, "", "", "", "", "", null, 0);
	}

	public int getConductorId() {
		return conductorId;
	}

	public void setConductorId(int conductorId) {
		this.conductorId = conductorId;
	}

	public String getTipoDocumento() {
		return tipoDocumento;
	}

	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}

	public int getNumeroDocumento() {
		return numeroDocumento;
	}

	public void setNumeroDocumento(int numeroDocumento) {
		this.numeroDocumento = numeroDocumento;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getCategoriaLicencia() {
		return categoriaLicencia;
	}

	public void setCategoriaLicencia(String categoriaLicencia) {
		this.categoriaLicencia = categoriaLicencia;
	}

	public String getDisDescanso() {
		return disDescanso;
	}

	public void setDisDescanso(String disDescanso) {
		this.disDescanso = disDescanso;
	}

	public LocalDate getVencimientoLicencia() {
		return vencimientoLicencia;
	}

	public void setVencimientoLicencia(LocalDate vencimientoLicencia) {
		this.vencimientoLicencia = vencimientoLicencia;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}
	
}
