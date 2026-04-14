package interfaces;

import java.util.ArrayList;
import entidades.Viaje;

public interface IViajeModel {
    // El que ya tenías
    public ArrayList<Viaje> buscarViajes(String origen, String destino);
    
    // AGREGA ESTOS DOS:
    public ArrayList<String> listarOrigen();
    public ArrayList<String> listarDestino();
}