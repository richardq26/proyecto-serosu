package DependencyInjection;

import static DAO.Conexion.URL;
import static DAO.Conexion.contraseña;
import static DAO.Conexion.usuario;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionMySQL implements IConexion {

    //public static final String URL = "jdbc:mysql://localhost:3306/pruebapatrones?autoReconnect=true&useSSL=true&verifyServerCertificate=false";
    //public static final String usuario = "root";
    //public static final String contraseña = "";
    private String usuario;
    private String clave;
    private String host;

    public ConexionMySQL(String usuario, String clave, String host) {
        this.usuario = usuario;
        this.clave = clave;
        this.host = host;
    }

    @Override
    public Connection conectar() {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = (Connection) DriverManager.getConnection(URL, usuario, contraseña);
        } catch (Exception ex) {
            System.err.println("Error: " + ex);
        }
        return conexion;
    }

}
