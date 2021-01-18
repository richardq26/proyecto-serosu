package mediator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Registrar {

    PreparedStatement ps, ps2, ps3;
    ResultSet rs, rs2, rs3;

    public String insertar(String usuario, String clave, String email) {
        Conexion c = new Conexion();
        Connection conexion = null;
        String respuesta="";
        try {
            conexion = c.getConnection();
            ps = conexion.prepareStatement("select * from usuarios WHERE us_user= '" + usuario + "' ");
            rs = ps.executeQuery();
            if (rs.next()) {
                respuesta= "yaexiste";
                
            } else {
                try {
                    ps2 = conexion.prepareStatement("insert into usuarios(us_user,us_pass,us_email) values(?,?,?)");
                    ps2.setString(1, usuario);
                    ps2.setString(2, clave);
                    ps2.setString(3, email);
                    int resultado = ps2.executeUpdate();
                    if (resultado > 0) {
                        respuesta="agregado";
                    } else {
                        respuesta="error";
                    }
                } catch (SQLException ex) {
                    System.err.println("Error " + ex);
                }
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }
        
        return respuesta;
    }
}
