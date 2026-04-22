package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.MySQLConexion;
import entidades.Ciudad;
import entidades.Conductor;
import interfaces.ICiudadDAO;

public class CiudadDAO implements ICiudadDAO{
	
	private static ICiudadDAO instancia;
	
	public static ICiudadDAO getInstancia() {
		if(instancia == null) {
			instancia = new CiudadDAO();
		}
		return instancia;
	}
	@Override
	public int crear(Ciudad ciudad) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Ciudad> listar() {
		ArrayList<Ciudad> lista = new ArrayList<Ciudad>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "select * from CIUDAD";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Ciudad ciudad = new Ciudad(
						rs.getInt("IdCiudad"),
						rs.getString("ciudad"),
						rs.getString("departamento"),
						rs.getInt("estado")
						);
				lista.add(ciudad);
			}
		} catch(Exception e) {
			System.out.println("Error al listar : " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		
		return lista;
	}

	@Override
	public Ciudad obtener(int idCiudad) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int actualizar(Ciudad ciudad) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminar(int idCiudad) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Ciudad> buscar(String texto) {
		// TODO Auto-generated method stub
		return null;
	}

}
