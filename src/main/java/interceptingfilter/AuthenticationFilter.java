/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptingfilter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Richard
 */
public class AuthenticationFilter implements Filter {
    PreparedStatement ps,ps2,ps3;
    ResultSet rs,rs2,rs3;
    public String execute(String request) {
        String resp = null;
        Conexion c= new Conexion();
        Connection conexion=null;
        conexion=c.getConnection();
        try{
            ps=conexion.prepareStatement("select us_id from usuarios where us_user='"+request+"'");
            rs=ps.executeQuery();
            if(rs.next()){
                resp="autorizado";
            }else{
                resp= "inautorizado";
            }
        }catch(SQLException ex){
            System.out.println("Error"+ex);
        }
        return resp;
    }
}
