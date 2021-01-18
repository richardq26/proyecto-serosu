/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptingfilter;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Richard
 */
public class FilterChain {
    private List <Filter> filters = new ArrayList <Filter> ();
    private String resp="";
    private ArrayList<String> respuestas= new ArrayList();
    private Target target;
    
    public void addFilter (Filter filter) {
        filters.add (filter);
    }
    
    public String execute (String request) {
        for (Filter filter: filters) {
            respuestas.add(filter.execute (request));
            resp=filter.execute(request);
        }
        target.execute (request);
        
        return resp;
    }

    public void setTarget (Target target) {
        this.target = target;
    }
}
