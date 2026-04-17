package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	private ViajeDAO() {}
	
	@Override
	public int crear(Viaje viaje) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Viaje> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Viaje obtener(int idViaje) {
		Viaje viaje = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT v.*, b.TipoBus, b.NroAsientos, "
					+ "CONCAT(c.Nombre, ' ', c.Apellido) AS NombreConductor, "
					+ "CONCAT(cp.Ciudad, ' - ', cd.Ciudad) AS NombreRuta "
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
						rs.getString("NombreRuta")
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminar(int idViaje) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Viaje> buscar(String texto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Viaje> buscarViajesPorRutaYFecha(int idRuta, String fechaSalida) {
		ArrayList<Viaje> lista = new ArrayList<Viaje>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			//PENDIENTE GUARDAR EN UN STORE PROCEDURE
			String sql = "SELECT v.*, b.TipoBus, b.NroAsientos, "
					+ "CONCAT(c.Nombre, ' ', c.Apellido) AS NombreConductor, "
					+ "CONCAT(cp.Ciudad, ' - ', cd.Ciudad) AS NombreRuta "
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
						rs.getString("NombreRuta")
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
		// TODO Auto-generated method stub
		return null;
	}
	
}
