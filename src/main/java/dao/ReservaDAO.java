package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.MySQLConexion;
import entidades.Reserva;
import interfaces.IReservaDAO;

public class ReservaDAO implements IReservaDAO{

	public int crear(Reserva r) {
		int id = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "INSERT INTO reserva VALUES (null, ?, ?, ?, NOW(), ?, ?, ?)";
			ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			ps.setInt(1, r.getIdUsuario());
			ps.setInt(2, r.getIdViaje());
			ps.setString(3, r.getCodigoReserva());
			ps.setDouble(4, r.getMontoTotal());
			ps.setString(5, r.getMetodoPago());
			ps.setString(6, r.getEstado());

			ps.executeUpdate();

			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Error crear reserva: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}

		return id;
	}
	
}
