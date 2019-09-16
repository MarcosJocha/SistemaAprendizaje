package practicas.common.dao.modules;

import practicas.login.dataaccess.MysqlLogin;
import practicas.login.dataaccess.interfaces.DAOLogin;

public class MysqlFactoryGeneral implements DAOFactoryGeneral {

	@Override
	public DAOLogin getLogin() {
		return new MysqlLogin();
	}

	
	
}
