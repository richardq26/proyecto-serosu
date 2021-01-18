package DAO;

import DependencyInjection.*;



public interface PersonaDAO extends CRUD<Persona>{

	void mostrarNombre();
	void setConexion(IConexion conexion);
}
