package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.MySQLConexion;
import entidades.Viaje;
import interfaces.IViajeModel;

public class ViajeModel implements IViajeModel {

    @Override
    public ArrayList<Viaje> buscarViajes(String origen, String destino) {

        ArrayList<Viaje> lista = new ArrayList<>();

        try {
            Connection con = MySQLConexion.getConexion();

            String sql = "SELECT b.TipoBus, r.Departamento, v.HoraSalida, v.HoraLlegada, v.Tarifa " +
                         "FROM viaje v " +
                         "JOIN ruta r ON v.IdRuta = r.IdRuta " +
                         "JOIN bus b ON v.IdBus = b.IdBus " +
                         "WHERE r.Origen = ? AND r.Destino = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, origen);
            ps.setString(2, destino);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Viaje v = new Viaje();

                v.setTipoBus(rs.getString("TipoBus"));
                v.setDepartamento(rs.getString("Departamento"));
                v.setHoraSalida(rs.getString("HoraSalida"));
                v.setHoraLlegada(rs.getString("HoraLlegada"));
                v.setTarifa(rs.getDouble("Tarifa"));

                lista.add(v);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
    public ArrayList<String> listarOrigen() {
        ArrayList<String> lista = new ArrayList<>();

        try {
            Connection con = MySQLConexion.getConexion();
            String sql = "SELECT DISTINCT Origen FROM ruta";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(rs.getString("Origen"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
    public ArrayList<String> listarDestino() {
        ArrayList<String> lista = new ArrayList<>();

        try {
            Connection con = MySQLConexion.getConexion();
            String sql = "SELECT DISTINCT Destino FROM ruta";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(rs.getString("Destino"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lista;
    }
}