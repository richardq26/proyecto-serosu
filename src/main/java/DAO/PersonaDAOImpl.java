package DAO;

import DependencyInjection.IConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAOImpl implements PersonaDAO {

    private IConexion conexion2;
    PreparedStatement ps, ps2, ps3;
    ResultSet rs, rs2, rs3;

    Connection conexion = null;
    Persona aux;

    @Override
    public List<Persona> listarTodos() {
        Conexion c = new Conexion();
        List<Persona> lista = new ArrayList<>();

        try {
            conexion = c.getConnection();
            //Busco al usuario en el que estamos en la sesion
            ps = conexion.prepareStatement("select us_id,us_user from usuarios where us_user != 'admin'");
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String user = rs.getString(2);
                aux = new Persona();
                aux.setUsuario(user);
                aux.setId(id);
                lista.add(aux);
            }

        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }
        return lista;
    }

    @Override
    public void eliminar(String usuario) {
        
    }

    @Override
    public void mostrarNombre() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String registrar(String usuario, String clave, String email) {
        Conexion c = new Conexion();
        Connection conexion = null;
        String respuesta = "";
        try {
            conexion = c.getConnection();
            ps = conexion.prepareStatement("select * from usuarios WHERE us_user= '" + usuario + "' ");
            rs = ps.executeQuery();
            if (rs.next()) {
                respuesta = "yaexiste";

            } else {
                try {
                    ps2 = conexion.prepareStatement("insert into usuarios(us_user,us_pass,us_email) values(?,?,?)");
                    ps2.setString(1, usuario);
                    ps2.setString(2, clave);
                    ps2.setString(3, email);
                    int resultado = ps2.executeUpdate();
                    if (resultado > 0) {
                        respuesta = "agregado";
                    } else {
                        respuesta = "error";
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

    @Override
    public void actualizar(Persona t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setConexion(IConexion conexion) {
        this.conexion2 = conexion;

    }

}
