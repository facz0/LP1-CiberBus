package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.MySQLConexion;
import entidades.Conductor;
import interfaces.IConductorDAO;

public class ConductorDAO implements IConductorDAO {
	
	private static IConductorDAO instancia;
	
	public static IConductorDAO getInstancia() {
		if(instancia == null) {
			instancia = new ConductorDAO();
		}
		return instancia;
	}
	
	private ConductorDAO() {}

	@Override
	public int crear(Conductor conductor) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Conductor> listar() {
		ArrayList<Conductor> lista = new ArrayList<Conductor>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "select * from CONDUCTOR";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Conductor conductor = new Conductor(
						rs.getInt("conductorId"),
						rs.getString("tipoDocumento"),
						rs.getInt("numeroDocumento"),
						rs.getString("nombre"),
						rs.getString("apellidos"),
						rs.getString("correo"),
						rs.getString("categoriaLicencia"),
						rs.getString("diaDescanso"),
						rs.getObject("vencimientoLicencia", java.time.LocalDate.class),
						rs.getInt("estado")
						);
				lista.add(conductor);
			}
		} catch(Exception e) {
			System.out.println("Error al listar : " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		
		return lista;
	}

	@Override
	public Conductor obtener(int conductorId) {
		Conductor conductor = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "select * from CONDUCTOR where IdConductor = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, conductorId); 
			rs = ps.executeQuery();
			
			if(rs.next()) {
				conductor = new Conductor(
						rs.getInt("conductorId"),
						rs.getString("tipoDocumento"),
						rs.getInt("numeroDocumento"),
						rs.getString("nombre"),
						rs.getString("apellidos"),
						rs.getString("correo"),
						rs.getString("categoriaLicencia"),
						rs.getString("diaDescanso"),
						rs.getObject("vencimientoLicencia", java.time.LocalDate.class),
						rs.getInt("estado")
						);
			}
		} catch (Exception e) {
			System.out.println("Error al obtener el registro: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return conductor;
	}

	@Override
	public int actualizar(Conductor conductor) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminar(int conductorId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Conductor> buscar(String texto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
