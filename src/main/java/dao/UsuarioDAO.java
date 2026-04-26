package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.util.ArrayList;

import db.MySQLConexion;
import entidades.Usuario;
import interfaces.IUsuarioDAO;

public class UsuarioDAO implements IUsuarioDAO {
	
	private static IUsuarioDAO instancia;
	
	public static IUsuarioDAO getInstancia() {
		if (instancia == null) {
			instancia = new UsuarioDAO();
		}
		return instancia;
	}

	@Override
	public int crear(Usuario usuario) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "INSERT INTO USUARIO (TipoDocumento, NroDocumento, Nombre, Apellido, Correo, Clave, Telefono, FechaNacimiento, Nacionalidad, Genero) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, usuario.getTipoDocumento());
			ps.setString(2, usuario.getNroDocumento());
			ps.setString(3, usuario.getNombre());
			ps.setString(4, usuario.getApellido());
			ps.setString(5, usuario.getCorreo());
			ps.setString(6, usuario.getClave()); 
			ps.setString(7, usuario.getTelefono());
			ps.setDate(8, Date.valueOf(usuario.getFechaNacimiento()));
			ps.setString(9, usuario.getNacionalidad());
			ps.setString(10, usuario.getGenero());
			
			value = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("Error al crear usuario: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		
		return value;
	}

	@Override
	public ArrayList<Usuario> listar() {
		ArrayList<Usuario> lista = new ArrayList<Usuario>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT * FROM USUARIO";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario u = new Usuario();
				u.setIdUsuario(rs.getInt("IdUsuario"));
				u.setTipoDocumento(rs.getString("TipoDocumento"));
				u.setNroDocumento(rs.getString("NroDocumento"));
				u.setNombre(rs.getString("Nombre"));
				u.setApellido(rs.getString("Apellido"));
				u.setCorreo(rs.getString("Correo"));
				u.setClave(rs.getString("Clave"));
				u.setTelefono(rs.getString("Telefono"));
				u.setFechaNacimiento(rs.getDate("FechaNacimiento").toLocalDate());
				u.setNacionalidad(rs.getString("Nacionalidad"));
				u.setGenero(rs.getString("Genero"));
				u.setRol(rs.getString("Rol"));
				u.setEstado(rs.getInt("Estado"));
				
				lista.add(u);
			}
		} catch (Exception e) {
			System.out.println("Error al listar usuarios: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		
		return lista;
	}

	@Override
	public Usuario obtener(int idUsuario) {
		Usuario u = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "SELECT * FROM USUARIO WHERE IdUsuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idUsuario);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				u = new Usuario();
				u.setIdUsuario(rs.getInt("IdUsuario"));
				u.setTipoDocumento(rs.getString("TipoDocumento"));
				u.setNroDocumento(rs.getString("NroDocumento"));
				u.setNombre(rs.getString("Nombre"));
				u.setApellido(rs.getString("Apellido"));
				u.setCorreo(rs.getString("Correo"));
				u.setClave(rs.getString("Clave"));
				u.setTelefono(rs.getString("Telefono"));
				u.setFechaNacimiento(rs.getDate("FechaNacimiento").toLocalDate());
				u.setNacionalidad(rs.getString("Nacionalidad"));
				u.setGenero(rs.getString("Genero"));
				u.setRol(rs.getString("Rol"));
				u.setEstado(rs.getInt("Estado"));
			}	
		} catch (Exception e) {
			System.out.println("Error al obtener usuario: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return u;
	}

	@Override
	public int actualizar(Usuario usuario) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "UPDATE USUARIO SET TipoDocumento=?, NroDocumento=?, Nombre=?, Apellido=?, Correo=?, Clave=?, Telefono=?, FechaNacimiento=?, Nacionalidad=?, Genero=?, Rol=?, Estado=? WHERE IdUsuario=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, usuario.getTipoDocumento());
			ps.setString(2, usuario.getNroDocumento());
			ps.setString(3, usuario.getNombre());
			ps.setString(4, usuario.getApellido());
			ps.setString(5, usuario.getCorreo());
			ps.setString(6, usuario.getClave());
			ps.setString(7, usuario.getTelefono());
			ps.setDate(8, Date.valueOf(usuario.getFechaNacimiento()));
			ps.setString(9, usuario.getNacionalidad());
			ps.setString(10, usuario.getGenero());
			ps.setString(11, usuario.getRol());
			ps.setInt(12, usuario.getEstado());
			ps.setInt(13, usuario.getIdUsuario());
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al actualizar usuario: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public int eliminar(int idUsuario) {
		int value = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "DELETE FROM USUARIO WHERE IdUsuario = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, idUsuario);
			
			value = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error al eliminar usuario: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return value;
	}

	@Override
	public ArrayList<Usuario> buscar(String texto) {
		ArrayList<Usuario> lista = new ArrayList<Usuario>();
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			con = MySQLConexion.getConexion();
			String sql = "{CALL usp_Buscar_Usuario(?)}";
			cs = con.prepareCall(sql);
			cs.setString(1, texto);
			
			rs = cs.executeQuery();
			
			while(rs.next()) {
				Usuario u = new Usuario();
				u.setIdUsuario(rs.getInt("IdUsuario"));
				u.setTipoDocumento(rs.getString("TipoDocumento"));
				u.setNroDocumento(rs.getString("NroDocumento"));
				u.setNombre(rs.getString("Nombre"));
				u.setApellido(rs.getString("Apellido"));
				u.setCorreo(rs.getString("Correo"));
				u.setTelefono(rs.getString("Telefono"));
				u.setFechaNacimiento(rs.getDate("FechaNacimiento").toLocalDate());
				u.setNacionalidad(rs.getString("Nacionalidad"));
				u.setGenero(rs.getString("Genero"));
				u.setRol(rs.getString("Rol"));
				u.setEstado(rs.getInt("Estado"));
				
				lista.add(u);
			}
			
		} catch (Exception e) {
			System.out.println("Error al buscar usuarios: " + e.getMessage());
		} finally {
			MySQLConexion.closeConexion(con);
		}
		return lista;
	}

	@Override
	public Usuario autenticar(String correo, String clave) {
	    Usuario usuario = null;
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    try {
	        con = MySQLConexion.getConexion();
	        String sql = "SELECT * FROM USUARIO WHERE Correo = ? AND Clave = ? AND Estado = 1";
	        ps = con.prepareStatement(sql);
	        ps.setString(1, correo);
	        ps.setString(2, clave);
	        rs = ps.executeQuery();
	        
	        if (rs.next()) {
	            usuario = new Usuario(
	                    rs.getInt("IdUsuario"),
	                    rs.getString("TipoDocumento"),
	                    rs.getString("NroDocumento"),
	                    rs.getString("Nombre"),
	                    rs.getString("Apellido"),
	                    rs.getString("Correo"),
	                    rs.getString("Clave"),
	                    rs.getString("Telefono"),
	                    rs.getDate("FechaNacimiento").toLocalDate(),
	                    rs.getString("Nacionalidad"),
	                    rs.getString("Genero"),
	                    rs.getString("Rol"),
	                    rs.getInt("Estado")
	            );
	        }	
	    } catch (Exception e) {
	        System.out.println("Error al obtener el registro: " + e.getMessage());
	    } finally {
	        MySQLConexion.closeConexion(con);
	    }
	    return usuario;
	}
}
