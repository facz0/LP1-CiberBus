package dao;

import java.sql.CallableStatement;
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
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "insert into CONDUCTOR values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, conductor.getTipoDocumento());
			ps.setInt(2, conductor.getNumeroDocumento());
			ps.setString(3, conductor.getNombre());
			ps.setString(4, conductor.getApellidos());
			ps.setString(5, conductor.getCorreo());
			ps.setInt(6, conductor.getTelefono());
			ps.setString(7, conductor.getCategoriaLicencia());
			ps.setObject(8, conductor.getVencimientoLicencia());
			ps.setString(9, conductor.getDiaDescanso());
			ps.setInt(10, conductor.getEstado());
			
			value = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("Error al crear : " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		
		return value;
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
						rs.getInt("IdConductor"),
						rs.getString("tipoDocumento"),
						rs.getInt("NroDocumento"),
						rs.getString("Nombre"),
						rs.getString("Apellido"),
						rs.getString("Correo"),
						rs.getInt("Telefono"),
						rs.getString("CategoriaLicencia"),
						rs.getObject("VencimientoLicencia", java.time.LocalDate.class),
						rs.getString("DiaDescanso"),
						rs.getInt("Estado")
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
						rs.getInt("IdConductor"),
						rs.getString("tipoDocumento"),
						rs.getInt("NroDocumento"),
						rs.getString("Nombre"),
						rs.getString("Apellido"),
						rs.getString("Correo"),
						rs.getInt("Telefono"),
						rs.getString("CategoriaLicencia"),
						rs.getObject("VencimientoLicencia", java.time.LocalDate.class),
						rs.getString("DiaDescanso"),
						rs.getInt("Estado")
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
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "update CONDUCTOR set tipoDocumento=?, NroDocumento=?, Nombre=?, Apellido=?, Correo=?, telefono=?, categoriaLicencia=?, vencimientoLicencia=?, diaDescanso=?, estado=? where IdConductor=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, conductor.getTipoDocumento());
			ps.setInt(2, conductor.getNumeroDocumento());
			ps.setString(3, conductor.getNombre());
			ps.setString(4, conductor.getApellidos());
			ps.setString(5, conductor.getCorreo());
			ps.setInt(6, conductor.getTelefono());
			ps.setString(7, conductor.getCategoriaLicencia());
			ps.setObject(8, conductor.getVencimientoLicencia());
			ps.setString(9, conductor.getDiaDescanso());
			ps.setInt(10, conductor.getEstado());
			ps.setInt(11, conductor.getConductorId());
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar el registro: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public int eliminar(int conductorId) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "delete from CONDUCTOR where IdConductor = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, conductorId);
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al eliminar el registro: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public ArrayList<Conductor> buscar(String texto) {
		ArrayList<Conductor> lista = new ArrayList<Conductor>();
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "{CALL usp_buscar_nombre_conductor(?)}";
			cs = con.prepareCall(sql);
			cs.setString(1, texto);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				Conductor conductor = new Conductor(
						rs.getInt("IdConductor"),
						rs.getString("tipoDocumento"),
						rs.getInt("NroDocumento"),
						rs.getString("Nombre"),
						rs.getString("Apellido"),
						rs.getString("Correo"),
						rs.getInt("Telefono"),
						rs.getString("CategoriaLicencia"),
						rs.getObject("VencimientoLicencia", java.time.LocalDate.class),
						rs.getString("DiaDescanso"),
						rs.getInt("Estado")
						);
				
				lista.add(conductor);
			}
			
		} catch (Exception e) {
			System.out.println("Error al listar: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}
	
	
}
