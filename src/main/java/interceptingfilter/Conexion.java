/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptingfilter;


/**
 *
 * @author Richard
 */
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Richard
 */
public class Conexion{
    public static final String URL = "jdbc:mysql://localhost:3306/proyectopatrones?autoReconnect=true&useSSL=true&verifyServerCertificate=false";
    public static final String usuario = "root";
    public static final String contraseña= "";
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

