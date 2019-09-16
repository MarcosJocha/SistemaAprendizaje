package practicas.login.dataaccess.interfaces;

import practicas.common.bean.Persona;
import practicas.common.bean.Usuario;

public interface DAOLogin {

	public Usuario getUsuario(String user, String password) throws Exception;
	
}
