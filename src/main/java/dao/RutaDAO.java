package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.sql.CallableStatement;
import db.MySQLConexion;
import entidades.Ruta;
import interfaces.IRutaDAO;

public class RutaDAO implements IRutaDAO{

	//patron singleton
	private static IRutaDAO instancia;
	
	public static IRutaDAO getInstancia() {
		if(instancia == null) {
			instancia = new RutaDAO();
		}
		return instancia;
	}
	
	private RutaDAO() {}
	
	@Override
	public int crear(Ruta ruta) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "insert into RUTA values (null, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, ruta.getCodigoRuta());
			ps.setInt(2, ruta.getIdCiudadOrigen());
			ps.setInt(3, ruta.getIdCiudadDestino());
			ps.setDouble(4, ruta.getHorasEstimadas());
			ps.setInt(5, ruta.getEstado());
			
			value = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("Error al crear la ruta: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		
		return value;
	}

	@Override
	public ArrayList<Ruta> listar() {
		ArrayList<Ruta> lista = new ArrayList<Ruta>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT r.IdRuta, r.codigo_ruta, r.CiudadPartida, r.CiudadLlegada, r.HorasEstimadas, r.Estado, "
					   + "cp.Ciudad AS NombrePartida, "
					   + "cd.Ciudad AS NombreLlegada "
					   + "FROM RUTA r "
					   + "INNER JOIN CIUDAD cp ON r.CiudadPartida = cp.IdCiudad "
					   + "INNER JOIN CIUDAD cd ON r.CiudadLlegada = cd.IdCiudad";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Ruta ruta = new Ruta(
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"),
						rs.getInt("CiudadPartida"),
						rs.getInt("CiudadLlegada"),
						rs.getDouble("HorasEstimadas"),
						rs.getInt("Estado"),
						rs.getString("NombrePartida"),
						rs.getString("NombreLlegada")
				);
				lista.add(ruta);
			}

		} catch (Exception e) {
			System.out.println("Error al listar todas las rutas: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}

		return lista;
	}

	@Override
	public Ruta obtener(int idRuta) {
		Ruta ruta = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT r.IdRuta, r.codigo_ruta, r.CiudadPartida, r.CiudadLlegada, r.HorasEstimadas, r.Estado, "
					   + "cp.Ciudad AS NombrePartida, "
					   + "cd.Ciudad AS NombreLlegada "
					   + "FROM RUTA r "
					   + "INNER JOIN CIUDAD cp ON r.CiudadPartida = cp.IdCiudad "
					   + "INNER JOIN CIUDAD cd ON r.CiudadLlegada = cd.IdCiudad "
					   + "WHERE r.IdRuta = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, idRuta); 
			rs = ps.executeQuery();
			
			if(rs.next()) {
				ruta = new Ruta(
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"),
						rs.getInt("CiudadPartida"),
						rs.getInt("CiudadLlegada"),
						rs.getDouble("HorasEstimadas"),
						rs.getInt("Estado"),
						rs.getString("NombrePartida"),
						rs.getString("NombreLlegada")
				);
			}
		} catch (Exception e) {
			System.out.println("Error al obtener la ruta: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return ruta;
	}

	@Override
	public int actualizar(Ruta ruta) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "update RUTA set CodigoRuta=?, CiudadPartida=?, CiudadLlegada=?, HorasEstimadas=?, Estado=? where IdRuta=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, ruta.getCodigoRuta());
			ps.setInt(2, ruta.getIdCiudadOrigen());
			ps.setInt(3, ruta.getIdCiudadDestino());
			ps.setDouble(4, ruta.getHorasEstimadas());
			ps.setInt(5, ruta.getEstado());
			ps.setInt(6, ruta.getIdRuta());
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar la ruta: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override 
	public int eliminar(int idRuta) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "delete from RUTA where IdRuta = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idRuta);
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al eliminar la ruta: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public ArrayList<Ruta> buscar(String texto) {
		ArrayList<Ruta> lista = new ArrayList<Ruta>();
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "{CALL usp_buscar_ciudad_ruta(?)}";
			cs = con.prepareCall(sql);
			cs.setString(1, texto);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				Ruta ruta = new Ruta(
						rs.getInt("IdRuta"),
						rs.getString("codigo_ruta"),
						rs.getInt("CiudadPartida"),
						rs.getInt("CiudadLlegada"),
						rs.getDouble("HorasEstimadas"),
						rs.getInt("Estado"),
						rs.getString("NombrePartida"),
						rs.getString("NombreLlegada")   
						);
				
				lista.add(ruta);
			}
			
		} catch (Exception e) {
			System.out.println("Error al buscar la ruta: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}

	@Override
	public ArrayList<Ruta> listarCiudadesPartida() {
		ArrayList<Ruta> lista = new ArrayList<Ruta>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT DISTINCT r.CiudadPartida, c.Ciudad AS ciudadOrigen "
					   + "FROM RUTA r "
					   + "INNER JOIN CIUDAD c ON r.CiudadPartida = c.IdCiudad";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Ruta ruta = new Ruta(0,"",
						rs.getInt("CiudadPartida"), 0, 0.0, 0,
						rs.getString("ciudadOrigen"), ""
				);
				lista.add(ruta);
			}

		} catch (Exception e) {
			System.out.println("Error al listar ciudades de partida: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}

		return lista;
	}

	@Override
	public ArrayList<Ruta> listarDestinosPorOrigen(int idCiudadOrigen) {
		ArrayList<Ruta> lista = new ArrayList<Ruta>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT r.IdRuta, r.codigo_ruta, r.CiudadLlegada, c.Ciudad AS ciudadDestino "
					   + "FROM RUTA r "
					   + "INNER JOIN CIUDAD c ON r.CiudadLlegada = c.IdCiudad "
					   + "WHERE r.CiudadPartida = ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, idCiudadOrigen);
			rs = ps.executeQuery();

			while (rs.next()) {
				Ruta ruta = new Ruta(
						rs.getInt("IdRuta"), 
						rs.getString("codigo_ruta"),
						idCiudadOrigen,
						rs.getInt("CiudadLlegada"),
						0.0, 0, "",
						rs.getString("ciudadDestino")
				);
				lista.add(ruta);
			}

		} catch (Exception e) {
			System.out.println("Error al listar destinos: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}

		return lista;
	}

}
