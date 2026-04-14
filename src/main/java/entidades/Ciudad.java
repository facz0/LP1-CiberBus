package entidades;

public class Ciudad {

    private int idCiudad;
    private String ciudad;
    private String departamento;
    private int estado;

    // Constructor completo
    
    public Ciudad(int idCiudad, String ciudad, String departamento, int estado) {
        this.idCiudad = idCiudad;
        this.ciudad = ciudad;
        this.departamento = departamento;
        this.estado = estado;
    }

    public Ciudad(String ciudad, String departamento, int estado) {
        this(0, ciudad, departamento, estado);
    }

    // Constructor vacío 
    public Ciudad() {
        this(0, "", "", 0);
    }

	public int getIdCiudad() {
		return idCiudad;
	}

	public void setIdCiudad(int idCiudad) {
		this.idCiudad = idCiudad;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

   
    }


