package interfaces;

import java.util.ArrayList;

import entidades.Ruta;

public interface IRutaDAO {
	
	public int crear(Ruta ruta);        
    public ArrayList<Ruta> listar();    
    public Ruta obtener(int idRuta);
    public int actualizar(Ruta ruta);    
    public int eliminar(int idRuta);
    public ArrayList<Ruta> buscar(String texto); 
    public ArrayList<Ruta> listarCiudadesPartida();
    public ArrayList<Ruta> listarDestinosPorOrigen(int idCiudadOrigen);
	
}
