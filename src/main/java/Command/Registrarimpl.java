
package Command;
import DAO.*;
public class Registrarimpl implements IOperacion {

	private Persona persona;
        String us,pass,email;
	public Registrarimpl(String us, String pass, String email) {
		this.us=us;
                this.pass=pass;
                this.email=email; 
	}

	@Override
	public String execute(){
            CRUD<Persona> dao = new PersonaDAOImpl();
            String resp= dao.registrar(us,pass,email);
            
            return resp;
	}

}
