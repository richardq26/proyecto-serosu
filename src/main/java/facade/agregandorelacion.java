
package facade;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class agregandorelacion {
    PreparedStatement ps,ps2,ps3;
    ResultSet rs,rs2,rs3;
    public String insertar(String curso, String usuario) throws SQLException{
        int idusuario = 0, idcurso = 0;
        Conexion c= new Conexion();
         Connection conexion=null;
         conexion=c.getConnection();
         //ENCONTRANDO EL ID DEL USUARIO
         ps=conexion.prepareStatement("select us_id from usuarios where us_user='"+usuario+"'");
         rs=ps.executeQuery();
         while(rs.next()){
                   idusuario=rs.getInt(1);
         }
         //ENCONTRANDO EL ID DEL CURSO
         
         ps2=conexion.prepareStatement("select curso_id from cursos where curso_nombre='"+curso+"'");
         conexion= c.getConnection();
         rs2=ps2.executeQuery();
         while(rs2.next()){
             idcurso=rs2.getInt(1);
         }
         
        
         //INSERTANDO LA RELACION AL CURSO
         
         ps3=conexion.prepareStatement("insert into usuarios_cursos(us_id,curso_id) values(?,?)");
         ps3.setInt(1,idusuario);
         ps3.setInt(2, idcurso);
         int resultado=ps3.executeUpdate();
         if(resultado>0){
             return "agregado";
         }else{
             return "error";
         }
         
    }
}
