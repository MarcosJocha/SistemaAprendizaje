package practicas.login.dataaccess;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.exception.ExceptionUtils;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import practicas.common.bean.Persona;
import practicas.common.bean.Rol;
import practicas.common.bean.Usuario;
import practicas.common.dao.MySqlDAOFactory;
import practicas.login.dataaccess.interfaces.DAOLogin;

public class MysqlLogin implements DAOLogin {

	
	@Override
	public Usuario getUsuario(String user, String password) throws Exception {
		Connection oCn = null;
		PreparedStatement oPs = null;
		ResultSet oRs = null;
		Usuario oUser = null;
		try {
			oCn = (Connection) MySqlDAOFactory.obtenerConexion(); 
			oPs = (PreparedStatement) oCn.prepareStatement("{call GET_USUARIO(?,?)}");
			oPs.setString(1, user);
			oPs.setString(2, password);
			oRs = oPs.executeQuery();
			if(oRs.next()) {
				oUser = new Usuario();
				Persona oPersona = new Persona();
				oPersona.setNombre(oRs.getString("nombre"));
				oPersona.setApePaterno(oRs.getString("apellido_paterno"));
				oPersona.setApeMaterno(oRs.getString("apellido_materno"));
				oPersona.setIdPersona(oRs.getString("id"));
				oUser.setLoginUser(oRs.getString("usuario"));
				oUser.setActivate(oRs.getBoolean("estado"));
				oUser.setPersona(oPersona);
				System.out.println("IDPERSONA LOGGED: "+oPersona.getNombre());
			}
			MySqlDAOFactory.close(oRs);
			if(oUser!=null && oPs.getMoreResults()) {
				oRs = oPs.getResultSet();
				if(oRs.next())
					oUser.setRol( Rol.get(oRs.getInt("rol_id")) );
				
			}
		} finally {
			MySqlDAOFactory.close(oRs); oRs = null;
			MySqlDAOFactory.close(oPs); oPs = null;
			MySqlDAOFactory.close(oCn);	oCn = null;
		}
		return oUser;
	}


}
