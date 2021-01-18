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
public class FilterManager {
    FilterChain filterChain;
    
    public FilterManager(Target target){
        filterChain= new FilterChain();
        filterChain.setTarget(target);
    }
    
    public void setFilter(Filter filter){
        filterChain.addFilter(filter);
    }
    
    public String filterRequest(String request){
        return filterChain.execute(request);
    }

}