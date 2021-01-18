package Command;

import DAO.Persona;

public class App {

    public static void main(String[] args) {
        String resp;
        Persona perso = new Persona();

        Registrarimpl opRegistro = new Registrarimpl("pruebaporcommand2", "123456", "pruebacommand2@gmail.com");

        Invoker ivk = new Invoker();
        ivk.recibirOperacion(opRegistro);
        resp=ivk.realizarOperaciones();
        System.out.println(resp);
    }

}
