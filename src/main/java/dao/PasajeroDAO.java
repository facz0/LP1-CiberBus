package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.MySQLConexion;
import entidades.Pasajero;
import interfaces.IPasajeroDAO;

public class PasajeroDAO implements IPasajeroDAO{

	@Override
	public int buscarIdPorDocumento(Connection con, String nroDocumento) {
		int id = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT IdPasajero FROM pasajero WHERE NroDocumento = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nroDocumento);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt("IdPasajero");
			}
		} catch (Exception e) {
			System.out.println("Error buscarIdPorDocumento: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}

		return id;
	}

	@Override
	public int crear(Pasajero p) {
		int id = 0;
        Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
            con = MySQLConexion.getConexion();
		
			String sql = "INSERT INTO pasajero VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			ps.setString(1, p.getTipoDocumento());
			ps.setString(2, p.getNroDocumento());
			ps.setString(3, p.getNombre());
			ps.setString(4, p.getApellido());
			ps.setString(5, p.getCorreo());
			ps.setString(6, p.getTelefono());
			ps.setObject(7, p.getFechaNacimiento());
			ps.setString(8, p.getNacionalidad());
			ps.setString(9, p.getGenero());
			ps.setInt(10, p.getEstado());

			ps.executeUpdate();

			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Error crear pasajero: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}

		return id;
	}

}
