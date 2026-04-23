package interfaces;

import java.sql.Connection;
import java.util.List;

import entidades.ViajeAsiento;

public interface IViajeAsientoDAO {
	//Interfaz para crear un ViajeAsiento
	public int crear(ViajeAsiento va);
	public List<Integer> obtenerAsientosVendidos(int idViaje);	
	public int buscarIdViajeAsiento(Connection con, int idViaje, int nroAsiento);
	public void actualizarEstado(Connection con, int idViajeAsiento, int estado);
}
