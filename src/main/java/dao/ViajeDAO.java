package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

import db.MySQLConexion;

import java.time.LocalDate;
import java.time.LocalTime;
import entidades.Viaje;
import interfaces.IViajeDAO;

public class ViajeDAO implements IViajeDAO{
	
	//patron singleton
	private static IViajeDAO instancia;
	
	public static IViajeDAO getInstancia() {
		if(instancia == null) {
			instancia = new ViajeDAO();
		}
		return instancia;
	}
	
	public ViajeDAO() {}
	
	@Override
	public int crear(Viaje viaje) {
		int valor = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "INSERT INTO VIAJE (CodigoViaje, IdRuta, IdBus, IdConductor, IdCopiloto, FechaSalida, HoraSalida, FechaLlegada, HoraLlegada, Tarifa, Estado) "
					   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, viaje.getCodigoViaje());
			ps.setInt(2, viaje.getIdRuta());
			ps.setInt(3, viaje.getIdBus());
			ps.setInt(4, viaje.getIdConductor());
			if (viaje.getIdCopiloto() > 0) {
				ps.setInt(5, viaje.getIdCopiloto());
			} else {
				ps.setNull(5, Types.INTEGER);
			}
			ps.setObject(6, viaje.getFechaSalida());
			ps.setObject(7, viaje.getHoraSalida());
			ps.setObject(8, viaje.getFechaLlegada());
			ps.setObject(9, viaje.getHoraLlegada());
			ps.setDouble(10, viaje.getTarifa());
			ps.setInt(11, viaje.getEstado());
			
			valor = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al crear el viaje: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return valor;
	}

	@Override
	public ArrayList<Viaje> listar() {
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT v.*, r.codigo_ruta, b.TipoBus, b.NroAsientos, "
					+ "CONCAT(c.Nombre, ' ', c.Apellido) AS NombreConductor, "
					+ "cp.Ciudad AS CiudadOrigen, cd.Ciudad AS CiudadDestino "
					+ "FROM VIAJE v "
					+ "INNER JOIN BUS b ON v.IdBus = b.IdBus "
					+ "INNER JOIN CONDUCTOR c ON v.IdConductor = c.IdConductor "
					+ "INNER JOIN RUTA r ON v.IdRuta = r.IdRuta "
					+ "INNER JOIN CIUDAD cp ON r.CiudadPartida = cp.IdCiudad "
					+ "INNER JOIN CIUDAD cd ON r.CiudadLlegada = cd.IdCiudad";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Viaje viaje = new Viaje(
						rs.getInt("IdViaje"),
						rs.getString("CodigoViaje"),
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"),
						rs.getInt("IdBus"),
						rs.getInt("IdConductor"),
						rs.getInt("IdCopiloto"),
						rs.getObject("FechaSalida", LocalDate.class),
						rs.getObject("HoraSalida", LocalTime.class),
						rs.getObject("FechaLlegada", LocalDate.class),
						rs.getObject("HoraLlegada", LocalTime.class),
						rs.getDouble("Tarifa"),
						rs.getInt("Estado"),
						rs.getString("TipoBus"),
						rs.getInt("NroAsientos"),
						rs.getString("NombreConductor"),
						rs.getString("CiudadOrigen"),
						rs.getString("CiudadDestino")
				);
				lista.add(viaje);
			}
		} catch (Exception e) {
			System.out.println("Error al listar viajes: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}

	@Override
	public Viaje obtener(int idViaje) {
		Viaje viaje = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT v.*, r.codigo_ruta, b.TipoBus, b.NroAsientos, "
					+ "CONCAT(c.Nombre, ' ', c.Apellido) AS NombreConductor, "
					+ "cp.Ciudad AS CiudadOrigen, cd.Ciudad AS CiudadDestino "
					+ "FROM VIAJE v "
					+ "INNER JOIN BUS b ON v.IdBus = b.IdBus "
					+ "INNER JOIN CONDUCTOR c ON v.IdConductor = c.IdConductor "
					+ "INNER JOIN RUTA r ON v.IdRuta = r.IdRuta "
					+ "INNER JOIN CIUDAD cp ON r.CiudadPartida = cp.IdCiudad "
					+ "INNER JOIN CIUDAD cd ON r.CiudadLlegada = cd.IdCiudad "
					+ "WHERE v.IdViaje = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, idViaje);
			rs = ps.executeQuery();

			if (rs.next()) {
				viaje = new Viaje(
						rs.getInt("IdViaje"),
						rs.getString("CodigoViaje"),
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"), 
						rs.getInt("IdBus"),
						rs.getInt("IdConductor"),
						rs.getInt("IdCopiloto"),
						rs.getObject("FechaSalida", LocalDate.class),
						rs.getObject("HoraSalida", LocalTime.class),
						rs.getObject("FechaLlegada", LocalDate.class),
						rs.getObject("HoraLlegada", LocalTime.class),
						rs.getDouble("Tarifa"),
						rs.getInt("Estado"),
						rs.getString("TipoBus"),
						rs.getInt("NroAsientos"),
						rs.getString("NombreConductor"),
						rs.getString("CiudadOrigen"),
						rs.getString("CiudadDestino")
				);
			}
		} catch (Exception e) {
			System.out.println("Error al obtener el viaje: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return viaje;
	}

	@Override
	public int actualizar(Viaje viaje) {
		int valor = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "UPDATE VIAJE SET CodigoViaje=?, IdRuta=?, IdBus=?, IdConductor=?, IdCopiloto=?, "
					   + "FechaSalida=?, HoraSalida=?, FechaLlegada=?, HoraLlegada=?, Tarifa=?, Estado=? "
					   + "WHERE IdViaje=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, viaje.getCodigoViaje());
			ps.setInt(2, viaje.getIdRuta());
			ps.setInt(3, viaje.getIdBus());
			ps.setInt(4, viaje.getIdConductor());
			if (viaje.getIdCopiloto() > 0) {
				ps.setInt(5, viaje.getIdCopiloto());
			} else {
				ps.setNull(5, Types.INTEGER);
			}
			ps.setObject(6, viaje.getFechaSalida());
			ps.setObject(7, viaje.getHoraSalida());
			ps.setObject(8, viaje.getFechaLlegada());
			ps.setObject(9, viaje.getHoraLlegada());
			ps.setDouble(10, viaje.getTarifa());
			ps.setInt(11, viaje.getEstado());
			ps.setInt(12, viaje.getIdViaje());
			
			valor = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar viaje: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return valor;
	}

	@Override
	public int eliminar(int idViaje) {
		int valor = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "DELETE FROM VIAJE WHERE IdViaje = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idViaje);
			valor = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al eliminar viaje: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return valor;
	}

	@Override
	public ArrayList<Viaje> buscar(String texto) {
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "{CALL usp_buscar_ciudad_viaje(?)}";
			cs = con.prepareCall(sql);
			cs.setString(1, texto);
			
			rs = cs.executeQuery();
			
			while (rs.next()) {
				Viaje viaje = new Viaje(
						rs.getInt("IdViaje"),
						rs.getString("CodigoViaje"),
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"),
						rs.getInt("IdBus"),
						rs.getInt("IdConductor"),
						rs.getInt("IdCopiloto"),
						rs.getObject("FechaSalida", LocalDate.class),
						rs.getObject("HoraSalida", LocalTime.class),
						rs.getObject("FechaLlegada", LocalDate.class),
						rs.getObject("HoraLlegada", LocalTime.class),
						rs.getDouble("Tarifa"),
						rs.getInt("Estado"),
						rs.getString("TipoBus"),
						rs.getInt("NroAsientos"),
						rs.getString("NombreConductor"),
						rs.getString("CiudadOrigen"),
						rs.getString("CiudadDestino")
						);
				
				lista.add(viaje);
			}
			
		} catch (Exception e) {
			System.out.println("Error al buscar viajes: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}

	@Override
	public ArrayList<Viaje> buscarViajesPorRutaYFecha(int idRuta, String fechaSalida) {
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			// PENDIENTE GUARDAR EN UN STORE PROCEDURE
			String sql = "SELECT v.*, r.codigo_ruta, b.TipoBus, b.NroAsientos, "
					+ "CONCAT(c.Nombre, ' ', c.Apellido) AS NombreConductor, "
					+ "cp.Ciudad AS CiudadOrigen, cd.Ciudad AS CiudadDestino "
					+ "FROM VIAJE v "
					+ "INNER JOIN BUS b ON v.IdBus = b.IdBus "
					+ "INNER JOIN CONDUCTOR c ON v.IdConductor = c.IdConductor "
					+ "INNER JOIN RUTA r ON v.IdRuta = r.IdRuta "
					+ "INNER JOIN CIUDAD cp ON r.CiudadPartida = cp.IdCiudad "
					+ "INNER JOIN CIUDAD cd ON r.CiudadLlegada = cd.IdCiudad "
					+ "WHERE v.IdRuta = ? AND v.FechaSalida = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, idRuta);
			ps.setString(2, fechaSalida);
			rs = ps.executeQuery();

			while (rs.next()) {
				Viaje viaje = new Viaje(
						rs.getInt("IdViaje"),
						rs.getString("CodigoViaje"),
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"),
						rs.getInt("IdBus"),
						rs.getInt("IdConductor"),
						rs.getInt("IdCopiloto"),
						rs.getObject("FechaSalida", LocalDate.class),
						rs.getObject("HoraSalida", LocalTime.class),
						rs.getObject("FechaLlegada", LocalDate.class),
						rs.getObject("HoraLlegada", LocalTime.class),
						rs.getDouble("Tarifa"),
						rs.getInt("Estado"),
						rs.getString("TipoBus"),
						rs.getInt("NroAsientos"),
						rs.getString("NombreConductor"),
						rs.getString("CiudadOrigen"),
						rs.getString("CiudadDestino")
				);
				lista.add(viaje);
			}

		} catch (Exception e) {
			System.out.println("Error al buscar viajes por ruta y fecha: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}

		return lista;
	}

	@Override
	public ArrayList<Viaje> buscarViajesPorCiudades(String origen, String destino) {
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT v.*, r.codigo_ruta, b.TipoBus, b.NroAsientos, "
					+ "CONCAT(c.Nombre, ' ', c.Apellido) AS NombreConductor, "
					+ "cp.Ciudad AS CiudadOrigen, cd.Ciudad AS CiudadDestino "
					+ "FROM VIAJE v "
					+ "INNER JOIN BUS b ON v.IdBus = b.IdBus "
					+ "INNER JOIN CONDUCTOR c ON v.IdConductor = c.IdConductor "
					+ "INNER JOIN RUTA r ON v.IdRuta = r.IdRuta "
					+ "INNER JOIN CIUDAD cp ON r.CiudadPartida = cp.IdCiudad "
					+ "INNER JOIN CIUDAD cd ON r.CiudadLlegada = cd.IdCiudad "
					+ "WHERE cp.Ciudad LIKE ? AND cd.Ciudad LIKE ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, origen + "%");
			ps.setString(2, destino + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				Viaje viaje = new Viaje(
						rs.getInt("IdViaje"),
						rs.getString("CodigoViaje"),
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"),
						rs.getInt("IdBus"),
						rs.getInt("IdConductor"),
						rs.getInt("IdCopiloto"),
						rs.getObject("FechaSalida", LocalDate.class),
						rs.getObject("HoraSalida", LocalTime.class),
						rs.getObject("FechaLlegada", LocalDate.class),
						rs.getObject("HoraLlegada", LocalTime.class),
						rs.getDouble("Tarifa"),
						rs.getInt("Estado"),
						rs.getString("TipoBus"),
						rs.getInt("NroAsientos"),
						rs.getString("NombreConductor"),
						rs.getString("CiudadOrigen"),
						rs.getString("CiudadDestino")
				);
				lista.add(viaje);
			}
		} catch (Exception e) {
			System.out.println("Error al buscar viajes por ciudades: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}
	
}
