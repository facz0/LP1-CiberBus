package interfaces;

import java.util.ArrayList;

import entidades.Conductor;

public interface IConductorDAO {

	public int crear(Conductor conductor);		
	public ArrayList<Conductor> listar();	
	public Conductor obtener(int conductorId);
	public int actualizar(Conductor conductor);	
	public int eliminar(int conductorId);
	
}
