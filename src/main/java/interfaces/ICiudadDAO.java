package interfaces;

import java.util.ArrayList;

import entidades.Ciudad;

public interface ICiudadDAO {
	public int crear(Ciudad ciudad);        
    public ArrayList<Ciudad> listar();    
    public Ciudad obtener(int idCiudad);
    public int actualizar(Ciudad ciudad);    
    public int eliminar(int idCiudad);
    public ArrayList<Ciudad> buscar(String texto);
}
