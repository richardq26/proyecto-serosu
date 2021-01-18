package strategy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Richard
 */
public class AutenticacionSQL extends SQL {

    public static final String URL = "jdbc:mysql://localhost:3306/proyectopatrones?autoReconnect=true&useSSL=true&verifyServerCertificate=false";
    public static final String usuario = "root";
    public static final String contraseña = "";
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public Connection getConnection() {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = (Connection) DriverManager.getConnection(URL, usuario, contraseña);
        } catch (Exception ex) {
            System.err.println("Error: " + ex);
        }
        return conexion;
    }

    @Override
    public String validar(String usuario, String password) {

        boolean existe = false;
        String tipo = null;
        AutenticacionSQL c = new AutenticacionSQL();
        Connection conexion = null;

        try {
            if (usuario.equalsIgnoreCase("admin")) {
                tipo="admin";
                System.out.println(usuario);
                conexion = c.getConnection();
                ps = conexion.prepareStatement("select * from usuarios WHERE us_user= '" + usuario + "'");
                rs = ps.executeQuery();
                if (rs.next()) {
                    existe = true;
                } else {
                    existe = false;
                }
            } else {
                tipo = "usuario";
                System.out.println(usuario);
                conexion = c.getConnection();
                ps = conexion.prepareStatement("select * from usuarios WHERE us_user= '" + usuario + "'");
                rs = ps.executeQuery();
                if (rs.next()) {
                    existe = true;
                } else {
                    existe = false;
                }
            }

        } catch (Exception ex) {
            System.out.println("Error" + ex);
        }

        if (existe == true) {
            if (tipo.equalsIgnoreCase("usuario")) {
                return "valido";
            } else {
                return "admin";
            }

        } else {
            return "invalido";
        }
    }
    

}
