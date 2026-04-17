package interfaces;

import java.util.ArrayList;

import entidades.Viaje;

public interface IViajeDAO {

	public int crear(Viaje viaje);        
    public ArrayList<Viaje> listar();    
    public Viaje obtener(int idViaje);
    public int actualizar(Viaje viaje);    
    public int eliminar(int idViaje);
    public ArrayList<Viaje> buscar(String texto); 
    public ArrayList<Viaje> buscarViajesPorRutaYFecha(int idRuta, String fechaSalida);
    public ArrayList<Viaje> buscarViajesPorCiudades(String origen, String destino);
	
}
