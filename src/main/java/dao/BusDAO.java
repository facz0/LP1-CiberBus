package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.MySQLConexion;
import entidades.Bus;
import entidades.Conductor;
import interfaces.IBusDAO;

public class BusDAO implements IBusDAO{
	private static IBusDAO instancia;
	
	public static IBusDAO getInstancia() {
		if(instancia == null) {
			instancia = new BusDAO();
		}
		return instancia;
	}
	
	private BusDAO() {}
	
	@Override
	public int crear(Bus bus) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "insert into BUS values (null, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, bus.getNroPlaca());
			ps.setString(2, bus.getMarca());
			ps.setString(3, bus.getTipoBus());
			ps.setInt(4, bus.getCantidadPisos());
			ps.setInt(5, bus.getNroAsientos());
			ps.setInt(6, bus.getEstado());
			
			value = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("Error al crear : " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public ArrayList<Bus> listar() {
		ArrayList<Bus> lista = new ArrayList<Bus>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "select * from BUS";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Bus bus = new Bus(
						rs.getInt("IdBus"),
						rs.getString("NroPlaca"),
						rs.getString("Marca"),
						rs.getString("TipoBus"),
						rs.getInt("CantidadPisos"),
						rs.getInt("NroAsientos"),
						rs.getInt("Estado")
						);
				lista.add(bus);
			}
		} catch(Exception e) {
			System.out.println("Error al listar : " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}

	@Override
	public Bus obtener(int idBus) {
		Bus bus = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "select * from BUS where IdBus = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idBus); 
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bus = new Bus(
						rs.getInt("IdBus"),
						rs.getString("NroPlaca"),
						rs.getString("Marca"),
						rs.getString("TipoBus"),
						rs.getInt("CantidadPisos"),
						rs.getInt("NroAsientos"),
						rs.getInt("Estado")
						);
			}
		} catch (Exception e) {
			System.out.println("Error al obtener el registro: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return bus;
	}

	@Override
	public int actualizar(Bus bus) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "update BUS set NroPlaca=?, Marca=?, TipoBus=?, CantidadPisos=?, NroAsientos=?, Estado=? where IdBus=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, bus.getNroPlaca());
			ps.setString(2, bus.getMarca());
			ps.setString(3, bus.getTipoBus());
			ps.setInt(4, bus.getCantidadPisos());
			ps.setInt(5, bus.getNroAsientos());
			ps.setInt(6, bus.getEstado());
			ps.setInt(7, bus.getIdBus());
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar el registro: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public int eliminar(int idBus) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "delete from BUS where IdBus = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idBus);
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al eliminar el registro: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public ArrayList<Bus> buscar(String texto) {
		ArrayList<Bus> lista = new ArrayList<Bus>();
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "{CALL usp_buscar_tipoBus_bus(?)}";
			cs = con.prepareCall(sql);
			cs.setString(1, texto);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				Bus bus = new Bus(
						rs.getInt("IdBus"),
						rs.getString("NroPlaca"),
						rs.getString("Marca"),
						rs.getString("TipoBus"),
						rs.getInt("CantidadPisos"),
						rs.getInt("NroAsientos"),
						rs.getInt("Estado")
						);
				
				lista.add(bus);
			}
			
		} catch (Exception e) {
			System.out.println("Error al listar: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}

}
