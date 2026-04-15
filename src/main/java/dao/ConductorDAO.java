package dao;

import java.util.ArrayList;

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
		
		return null;
	}

	@Override
	public Conductor obtener(int conductorId) {
		// TODO Auto-generated method stub
		return null;
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
	
	
	
}
