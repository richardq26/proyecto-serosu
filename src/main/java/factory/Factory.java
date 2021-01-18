/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package factory;
import factory.IConexion;
public class Factory {
    public IConexion getConnection(String motor){
        if(motor.equalsIgnoreCase("MYSQL")){
            return new ConexionMySQL();
        }
        
        return new ConexionMySQL();
    }
}
