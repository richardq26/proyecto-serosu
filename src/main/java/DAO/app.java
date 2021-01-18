/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;


import java.util.Iterator;

/**
 *
 * @author Richard
 */
public class app {

    public static void main(String[] args) {

        CRUD<Persona> dao = new PersonaDAOImpl();
        Iterator<Persona> iterador = dao.listarTodos().iterator();
        while (iterador.hasNext()) {
            Persona elemento= iterador.next();
            System.out.println(elemento.getUsuario());
        }

           

        }
    }
