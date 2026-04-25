package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.MySQLConexion;
import entidades.DetalleReserva;
import interfaces.IDetalleReservaDAO;

public class DetalleReservaDAO implements IDetalleReservaDAO{

	@Override
	public int crear(DetalleReserva d) {
		int value = 0;
		PreparedStatement ps = null;
		Connection con = null; 
		try {
			con = MySQLConexion.getConexion();
			String sql = "INSERT INTO detallereserva VALUES (null, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, d.getIdReserva());
			ps.setInt(2, d.getIdViajeAsiento());
			ps.setInt(3, d.getIdPasajero());
			ps.setDouble(4, d.getPrecioPagado());

			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error crear detalleReserva: " + e.getMessage());
		} finally {
			try {
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}

		return value;
	}

}
