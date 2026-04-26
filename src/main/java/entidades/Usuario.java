package entidades;

import java.time.LocalDate;

public class Usuario {
	
	private int idUsuario;
    private String tipoDocumento;
    private String nroDocumento;
    private String nombre;
    private String apellido;
    private String correo;
    private String clave;
    private String telefono;
    private LocalDate fechaNacimiento;
    private String nacionalidad;
    private String genero;
    private String rol;
    private int estado;

    public Usuario(int idUsuario, String tipoDocumento, String nroDocumento, String nombre, String apellido,
            String correo, String clave, String telefono, LocalDate fechaNacimiento, String nacionalidad, 
            String genero, String rol, int estado) {
        this.idUsuario = idUsuario;
        this.tipoDocumento = tipoDocumento;
        this.nroDocumento = nroDocumento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.clave = clave;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.nacionalidad = nacionalidad;
        this.genero = genero;
        this.rol = rol;
        this.estado = estado;
    }

    public Usuario(String tipoDocumento, String nroDocumento, String nombre, String apellido,
            String correo, String clave, String telefono, LocalDate fechaNacimiento, String nacionalidad, 
            String genero, String rol, int estado) {
        this(0, tipoDocumento, nroDocumento, nombre, apellido, correo, clave, telefono, fechaNacimiento, nacionalidad, genero, rol, estado);
    }
    
    public Usuario() {
        this(0, "", "", "", "", "", "", "", null, "", "", "", 0);
    }

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
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

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}
    
    

}
