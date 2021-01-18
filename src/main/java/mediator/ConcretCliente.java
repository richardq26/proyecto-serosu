/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mediator;

/**
 *
 * @author User
 */
public class ConcretCliente implements ComponentCliente{
    private String email;
    private String nombre;
    private String pass;
    private IMediador mediador;
    

    @Override
    public void recibirMensaje(String mensaje) {
        System.out.println(this.nombre + " recibio mensaje: " + mensaje);
    }
    
    public void setEmail(String email){
        this.email=email;
    }
    public void setPass(String pass){
        this.pass=pass;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public String getEmail(){
        return email;
    }
    public String getNombre(){
        return nombre;
    }
    public String getPass(){
        return pass;
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();                                                                   
        sb.append("\nnombre: ");
        sb.append(nombre);
        sb.append("\nemail: ");
        sb.append(email);
        sb.append("\npass: ");
        sb.append(pass);
        return sb.toString();
    }  
    
}
