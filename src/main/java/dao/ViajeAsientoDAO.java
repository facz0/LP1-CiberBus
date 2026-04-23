package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.MySQLConexion;
import entidades.ViajeAsiento;
import interfaces.IViajeAsientoDAO;

public class ViajeAsientoDAO implements IViajeAsientoDAO{
	
	public int buscarIdViajeAsiento(Connection con, int idViaje, int nroAsiento) {
		int id = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT IdViajeAsiento FROM viajeasiento WHERE IdViaje = ? AND NroAsiento = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idViaje);
			ps.setInt(2, nroAsiento);
			rs = ps.executeQuery();

			if (rs.next()) {
				id = rs.getInt("IdViajeAsiento");
			}
		} catch (Exception e) {
			System.out.println("Error buscarIdViajeAsiento: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}

		return id;
	}
	
	public int crear(ViajeAsiento va) {
		int id = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "INSERT INTO viajeasiento VALUES (null, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			ps.setInt(1, va.getIdViaje());
			ps.setInt(2, va.getNroAsiento());
			ps.setInt(3, va.getPiso());
			ps.setInt(4, va.getEstado());

			ps.executeUpdate();

			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("Error crear viajeAsiento: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}

		return id;
	}
	
	public void actualizarEstado(Connection con, int idViajeAsiento, int estado) {
		PreparedStatement ps = null;

		try {
			String sql = "UPDATE viajeasiento SET Estado = ? WHERE IdViajeAsiento = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, estado);
			ps.setInt(2, idViajeAsiento);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error actualizarEstado viajeAsiento: " + e.getMessage());
		} finally {
			try {
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}
	}

	@Override
	public List<Integer> obtenerAsientosVendidos(int idViaje) {
		List<Integer> lista = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MySQLConexion.getConexion();
			
			String sql = "SELECT NroAsiento FROM viajeasiento WHERE IdViaje = ? AND Estado = 1";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idViaje);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				lista.add(rs.getInt("NroAsiento"));
			}
			
		} catch (Exception e) {
			System.out.println("Error obtenerAsientosVendidos: " + e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (Exception e2) {}
		}
		
		return lista;
	}
	
	
	
}
