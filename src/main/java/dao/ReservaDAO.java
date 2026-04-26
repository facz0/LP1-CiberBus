package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.MySQLConexion;
import entidades.Pasajero;
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
			if(r.getIdUsuario() > 0) {
				ps.setInt(1, r.getIdUsuario());
			} else {
				ps.setNull(1, java.sql.Types.INTEGER);
			}
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

	@Override
	public ArrayList<Reserva> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reserva obtener(int idReserva) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public Reserva buscarPorCodigoYApellido(String codigoReserva, String apellido) {
		Reserva reserva = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		System.out.println("codigoReserva:"+codigoReserva);
		System.out.println("apellido:"+apellido);

		try {
			con = MySQLConexion.getConexion();

			String sql = "SELECT DISTINCT r.IdReserva, r.IdUsuario, r.IdViaje, r.CodigoReserva, "
					+ "r.FechaReserva, r.MontoTotal, r.MetodoPago, r.Estado "
					+ "FROM reserva r "
					+ "INNER JOIN detallereserva dr ON r.IdReserva = dr.IdReserva "
					+ "INNER JOIN pasajero p ON dr.IdPasajero = p.IdPasajero "
					+ "WHERE r.CodigoReserva = ? "
					+ "AND UPPER(p.Apellido) LIKE UPPER(?)";

			ps = con.prepareStatement(sql);
			ps.setString(1, codigoReserva);
			ps.setString(2, "%" + apellido + "%");

			rs = ps.executeQuery();

			if (rs.next()) {
				reserva = new Reserva();
				reserva.setIdReserva(rs.getInt("IdReserva"));
				reserva.setIdUsuario(rs.getInt("IdUsuario"));
				reserva.setIdViaje(rs.getInt("IdViaje"));
				reserva.setCodigoReserva(rs.getString("CodigoReserva"));
				reserva.setFechaReserva(rs.getString("FechaReserva"));
				reserva.setMontoTotal(rs.getDouble("MontoTotal"));
				reserva.setMetodoPago(rs.getString("MetodoPago"));
				reserva.setEstado(rs.getString("Estado"));
			}

		} catch (Exception e) {
			System.out.println("Error buscarPorCodigoYApellido: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (Exception e2) {}
		}

		return reserva;
	}
	
	public ArrayList<Pasajero> listarPasajerosPorReserva(int idReserva) {
		ArrayList<Pasajero> lista = new ArrayList<Pasajero>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MySQLConexion.getConexion();

			String sql = "SELECT p.IdPasajero, p.TipoDocumento, p.NroDocumento, p.Nombre, "
					+ "p.Apellido, p.Correo, p.Telefono, p.FechaNacimiento, "
					+ "p.Nacionalidad, p.Genero, p.Estado "
					+ "FROM detallereserva dr "
					+ "INNER JOIN pasajero p ON dr.IdPasajero = p.IdPasajero "
					+ "WHERE dr.IdReserva = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, idReserva);

			rs = ps.executeQuery();

			while (rs.next()) {
				Pasajero p = new Pasajero();
				p.setIdPasajero(rs.getInt("IdPasajero"));
				p.setTipoDocumento(rs.getString("TipoDocumento"));
				p.setNroDocumento(rs.getString("NroDocumento"));
				p.setNombre(rs.getString("Nombre"));
				p.setApellido(rs.getString("Apellido"));
				p.setCorreo(rs.getString("Correo"));
				p.setTelefono(rs.getString("Telefono"));
				p.setFechaNacimiento(rs.getDate("FechaNacimiento").toLocalDate());
				p.setNacionalidad(rs.getString("Nacionalidad"));
				p.setGenero(rs.getString("Genero"));
				p.setEstado(rs.getInt("Estado"));

				lista.add(p);
			}

		} catch (Exception e) {
			System.out.println("Error listarPasajerosPorReserva: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (Exception e2) {}
		}

		return lista;
	}
	
	public String obtenerAsientosPorReserva(int idReserva) {
		String asientos = "";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MySQLConexion.getConexion();

			String sql = "SELECT GROUP_CONCAT(va.NroAsiento ORDER BY va.NroAsiento SEPARATOR ', ') AS Asientos "
					+ "FROM detallereserva dr "
					+ "INNER JOIN viajeasiento va ON dr.IdViajeAsiento = va.IdViajeAsiento "
					+ "WHERE dr.IdReserva = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, idReserva);

			rs = ps.executeQuery();

			if (rs.next()) {
				asientos = rs.getString("Asientos");
			}

		} catch (Exception e) {
			System.out.println("Error obtenerAsientosPorReserva: " + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			} catch (Exception e2) {}
		}

		return asientos;
	}
}
