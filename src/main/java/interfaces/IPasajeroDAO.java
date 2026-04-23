package interfaces;

import java.sql.Connection;

import entidades.Pasajero;

public interface IPasajeroDAO {
	
	public int buscarIdPorDocumento(Connection con, String nroDocumento);
	public int crear(Pasajero p);

}
