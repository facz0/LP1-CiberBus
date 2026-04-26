package interfaces;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.MySQLConexion;
import entidades.Pasajero;
import entidades.Reserva;

public interface IReservaDAO {
	public int crear(Reserva r);
	public ArrayList<Reserva> listar();
	public Reserva obtener (int idReserva);
	public Reserva buscarPorCodigoYApellido(String codigoReserva, String apellido);
	
	public ArrayList<Pasajero> listarPasajerosPorReserva(int idReserva);
	
	public String obtenerAsientosPorReserva(int idReserva);
}
