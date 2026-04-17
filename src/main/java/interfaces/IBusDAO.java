package interfaces;

import java.util.ArrayList;

import entidades.Bus;

public interface IBusDAO {

	public int crear(Bus bus);        
    public ArrayList<Bus> listar();    
    public Bus obtener(int idBus);
    public int actualizar(Bus bus);    
    public int eliminar(int idBus);
    public ArrayList<Bus> buscar(String texto);
	
}
