package db;

public class PruebaConexion {
    public static void main(String[] args) {
        // Llamamos al método de tu clase
        if (db.MySQLConexion.getConexion() != null) {
            System.out.println("El vínculo funciona correctamente.");
        } else {
            System.out.println("El vínculo falló.");
        }
    }
}
