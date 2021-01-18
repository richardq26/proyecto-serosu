package factory;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Richard
 */
public class ConexionMySQL implements IConexion{
    public static final String URL = "jdbc:mysql://localhost:3306/proyectopatrones?autoReconnect=true&useSSL=false&verifyServerCertificate=false";
    public static final String usuario = "root";
    public static final String contraseña= "";
    
    @Override
    public Connection getConnection(){
    Connection conexion=null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion= (Connection) DriverManager.getConnection(URL, usuario, contraseña);
    }catch(Exception ex){
        System.err.println("Error: "+ex);
    }
    return conexion;
    }

}