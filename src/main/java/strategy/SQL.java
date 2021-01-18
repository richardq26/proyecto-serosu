/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package strategy;

import java.sql.Connection;

public abstract class SQL implements IEstrategia{
    public abstract Connection getConnection();
    public abstract String validar(String usuario, String password);
}
