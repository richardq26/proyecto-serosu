/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package strategy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Richard
 */
public class validarusuarioproyecto {

    PreparedStatement ps, ps2, ps3;
    ResultSet rs, rs2, rs3;

    public void buscar(String usuario) {
        Conexion c= new Conexion();
        Connection conexion=null;
        conexion=c.getConnection();
        try {
            conexion = c.getConnection();
            ps = conexion.prepareStatement("select * from usuarios WHERE us_user= '" + usuario + "'");
            rs = ps.executeQuery();
            if(rs.next()){
                System.out.println(rs.getString(2));
            }
        } catch (SQLException ex) {
            System.out.println("Error " + ex);
        }
    }
    
    public static void main(String[] args){
        validarusuarioproyecto a= new validarusuarioproyecto();
        a.buscar("aicos");
    }
}
