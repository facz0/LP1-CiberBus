package interfaces;

import java.util.ArrayList;

import entidades.Reserva;

public interface IReservaDAO {
	public int crear(Reserva r);
	public ArrayList<Reserva> listar();
	public Reserva obtener (int idReserva);
}
