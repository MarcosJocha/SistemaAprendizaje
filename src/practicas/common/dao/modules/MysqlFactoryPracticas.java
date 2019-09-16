package practicas.common.dao.modules;
import practicas.common.dataaccess.MysqlProyecto;
import practicas.common.dataaccess.interfaces.DAOProyecto;;

public class MysqlFactoryPracticas implements DAOFactoryPracticas{
	@Override
	public DAOProyecto getPracticas() {
		// TODO Auto-generated method stub
		return new MysqlProyecto();
	}
}
