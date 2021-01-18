package strategy;

public class ElegirAutenticador {
	
	private IEstrategia estrategia;
	
	public ElegirAutenticador(IEstrategia estrategia) {
		this.estrategia = estrategia;
	}
	
	public String ejecutar(String usuario, String password) {
		return this.estrategia.validar(usuario,password);
	}

}
