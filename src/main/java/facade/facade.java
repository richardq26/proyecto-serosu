
package facade;

import java.sql.SQLException;

public class facade {
    private agregandorelacion agregar;
    
    public facade(){
        agregar= new agregandorelacion();
        
    }
    
    public String insertar(String curso, String usuario) throws SQLException{
        return agregar.insertar(curso,usuario);
    }
}
