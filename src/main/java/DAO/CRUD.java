package DAO;

import java.util.List;

public interface CRUD<T> {

	List<T> listarTodos();
	
	String registrar(String u, String p, String e);
	void actualizar(T t);
	void eliminar(String us);

    
}
