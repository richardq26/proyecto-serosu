package Command;

import DAO.Persona;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Invoker {

	private List<IOperacion> operaciones = new ArrayList<>();
        private List<String> res= new ArrayList<String>();
	public void recibirOperacion(IOperacion operacion) {
		this.operaciones.add(operacion);
	}

	public String realizarOperaciones() {
            Iterator<IOperacion> iterador = operaciones.iterator();
            while(iterador.hasNext()){
                IOperacion elemento= iterador.next();
                res.add(elemento.execute());
            }
            
            if(res.get(0).equalsIgnoreCase("agregado")){
                return "agregado";
            }else{
                return "error";
            }
	}

}
