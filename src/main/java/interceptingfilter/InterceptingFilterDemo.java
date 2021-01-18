/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptingfilter;

import java.util.ArrayList;

/**
 *
 * @author Richard
 */
public class InterceptingFilterDemo {
    public static void main (String [] args) {
        FilterManager filterManager = new FilterManager (new Target ());
        filterManager.setFilter(new AuthenticationFilter ());
        Client client = new Client ();
        client.setFilterManager (filterManager);
        System.out.println(client.sendRequest( "aicos"));
    }
    
    public String ejecutar(String usuario){
        FilterManager filterManager = new FilterManager (new Target ());
        filterManager.setFilter(new AuthenticationFilter ());
        Client client = new Client ();
        client.setFilterManager (filterManager);
        return client.sendRequest(usuario);
    }
    
}
