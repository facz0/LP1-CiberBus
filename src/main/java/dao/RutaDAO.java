package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Ruta> listar() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Ruta obtener(int idRuta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int actualizar(Ruta ruta) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override 
	public int eliminar(int idRuta) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Ruta> buscar(String texto) {
		// TODO Auto-generated method stub
		return null;
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
				Ruta ruta = new Ruta(0,
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
		// TODO Auto-generated method stub
		return null;
	}

}
