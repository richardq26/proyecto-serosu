package factory;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;

public class AccesoDatos {

    PreparedStatement ps, ps2, ps3;
    ResultSet rs, rs2, rs3;
    Factory factory = new Factory();
    IConexion c = factory.getConnection("MYSQL");

    Connection conexion = null;

    public ArrayList listaCursos(String usuario) {
        ArrayList<Curso> curso = new ArrayList<Curso>();
        Curso aux;
        int idusuario = 0;

        try {
            conexion = c.getConnection();
            //Busco al usuario en el que estamos en la sesion
            ps = conexion.prepareStatement("select us_id from usuarios where us_user='" + usuario + "'");
            rs = ps.executeQuery();
            while (rs.next()) {
                idusuario = rs.getInt(1);
            }
            //Ahora busco los cursos mediante un inner join que relaciona al usuario con sus cursos
            ps2 = conexion.prepareStatement("select curso_nombre,curso_url,curso_img from cursos c inner join usuarios_cursos uc on c.curso_id = uc.curso_id where uc.us_id='" + idusuario + "'");
            rs2 = ps2.executeQuery();
            while (rs2.next()) {
                String nombre = rs2.getString(1);
                String url = rs2.getString(2);
                String imagen = rs2.getString(3);
                aux = new Curso();
                aux.setNombre(nombre);
                aux.setUrl(url);
                aux.setImagen(imagen);
                curso.add(aux);
                
            }

            conexion.close();
        } catch (SQLException ex) {
            System.err.println("Error: " + ex);
        }

        return curso;
    }
/*
    public static void main(String[] args) {
        AccesoDatos n = new AccesoDatos();
        ArrayList<Curso> cursos = n.listaCursos("aicos");
        Iterator<Curso> iterador = cursos.iterator();
        while (iterador.hasNext()) {
            Curso elemento = iterador.next();
            System.out.println(elemento.getNombre());
        }
            
        }
*/
    }
