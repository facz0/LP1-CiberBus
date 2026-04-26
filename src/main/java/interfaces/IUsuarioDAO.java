package interfaces;

import java.util.ArrayList;

import entidades.Usuario;

public interface IUsuarioDAO {
	public int crear(Usuario usuario);
	public ArrayList<Usuario> listar();
	public Usuario obtener(int idUsuario);
	public int actualizar(Usuario usuario);
	public int eliminar(int idUsuario);
	
	public ArrayList<Usuario> buscar(String texto);
	public Usuario autenticar(String correo, String clave);
}
