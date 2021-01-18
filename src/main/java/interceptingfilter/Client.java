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
public class Client {
    FilterManager filterManager;
    public void setFilterManager (FilterManager filterManager) {
        this.filterManager = filterManager;
    }
    public String sendRequest (String request) {
        return filterManager.filterRequest(request);
    }
}
