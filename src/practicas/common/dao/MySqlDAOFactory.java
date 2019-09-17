package practicas.common.dao;

import java.net.URLDecoder;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import practicas.common.dao.modules.DAOFactoryGeneral;
import practicas.common.dao.modules.DAOFactoryPracticas;
import practicas.common.dao.modules.MysqlFactoryGeneral;
import practicas.common.dao.modules.MysqlFactoryPracticas;
import practicas.common.util.ThreadUtil;


public class MySqlDAOFactory extends DAOFactory {

	
	protected static final Logger log = LogManager.getLogger(MySqlDAOFactory.class);

	public static Session _session = null;
	
	//obtenerConexion
	public static Connection obtenerConexion(){
		Connection con = null;
		try {

			Map<String, String> oParameters = getMysqlJDBC();
			
            Class.forName ("com.mysql.jdbc.Driver").newInstance();
            con = (Connection) DriverManager.getConnection (oParameters.get("jdbc:url"), oParameters.get("usuario"), oParameters.get("clave"));
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
			System.out.print("Connection Failed!");
			e.printStackTrace();
		}
		return con;
	}
	//obtenerConexion


	private static HashMap<String, String> getMysqlJDBC() throws Exception {
		
		HashMap<String, String> oParameters = new HashMap<String, String>();
		String oStrDatabaseEnv = ResourceBundle.getBundle("config").getString("database-environment");
		oStrDatabaseEnv = oStrDatabaseEnv==null? "": oStrDatabaseEnv.trim();
		System.out.println("Database"+oStrDatabaseEnv);
		
		if (oStrDatabaseEnv.equalsIgnoreCase("open")) {
			log.info("connection is Open");
			oParameters.put("jdbc:url", "jdbc:mysql://207.244.103.83:3306/bd_sistemaaprendizaje");
			oParameters.put("usuario", "c0sistemas");
			oParameters.put("clave", "hpvsAVTv!T7");		
		} else { 
			log.info("connection is localhost");			
			oParameters.put("jdbc:url", "jdbc:mysql://localhost:3306/bd_sistemaaprendizaje");
			oParameters.put("usuario", "root");
			oParameters.put("clave", "");
		}		
		log.info("oStrMysqlJDBC: " + oParameters.get("jdbc:url"));
		return oParameters;
	}


	public static void close(Object o) {
		if(o == null)
			return;
		try {
			if (o.getClass() == PreparedStatement.class || o.getClass() == com.mysql.jdbc.JDBC4PreparedStatement.class) {
				((PreparedStatement)o).clearParameters();
				((PreparedStatement)o).close();
			} else if (o.getClass() == Connection.class || o.getClass() == com.mysql.jdbc.JDBC4Connection.class) {
				((Connection)o).close();
				closeSSH();
			} else if (o.getClass() == ResultSet.class || o.getClass() == com.mysql.jdbc.JDBC4ResultSet.class) {
				((ResultSet)o).close();
			} else if (o.getClass() == CallableStatement.class || o.getClass() == com.mysql.jdbc.CallableStatement.class) {
				((CallableStatement) o).clearParameters();
				((CallableStatement) o).close();
			}
			if(o.getClass()==Connection.class && _session!=null) {
				log.info("destroy _session SSH");
				if(_session.isConnected()) { 
					System.err.println("SSH cerrado");
					_session.disconnect();
				}
				_session = null;
			}
		} catch (Exception ex) { 
			log.info(ExceptionUtils.getStackTrace(ex));
		} finally {
			o = null;
		}
	}
	
	private static void closeSSH() {
		if(_session!=null) {
			log.info("destroy _session SSH");
			if(_session.isConnected()) { 
				System.err.println("SSH cerrado");
				_session.disconnect();
			}
			_session = null;
		}
	}
	
	public DAOFactoryGeneral getGeneral() { return new MysqlFactoryGeneral(); }

	//public DAOFactoryMCurricular getMallaCurricular() { return new MySqlFactoryMCurricular(); }

	
	public DAOFactoryPracticas getFunctions() {
		// TODO Auto-generated method stub
		return  new MysqlFactoryPracticas();
	}  
	


}
