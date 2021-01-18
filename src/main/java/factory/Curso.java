/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package factory;

/**
 *
 * @author Richard
 */
public class Curso {
    private String nombre;
    private String imagen;
    private String url;
    private String ref;
    
    public String getNombre(){
        return nombre;
    }
    public String getImagen(){
        return imagen;
    }
    public String getUrl(){
        return url;
    }
    public String getRef(){
        return ref;
    }
    
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public void setImagen(String imagen){
        this.imagen=imagen;
    }
    public void setUrl(String url){
        this.url=url;
    }
     @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();                                                                   
        sb.append("\nnombre: ");
        sb.append(nombre);
        sb.append("\nimagen: ");
        sb.append(imagen);
        sb.append("\nurl: ");
        sb.append(url); 
        return sb.toString();
    }   
}
