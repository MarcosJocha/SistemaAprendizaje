package practicas.common.dataaccess;

import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import practicas.common.bean.Persona;
import practicas.common.bean.Usuario;
import practicas.common.bean.Profesor;
import practicas.common.bean.Alumno;
import practicas.common.bean.Documento;
import practicas.common.bean.Solicitud;
import org.apache.commons.lang3.exception.ExceptionUtils;



import practicas.common.bean.Persona;
import practicas.common.bean.Rol;
import practicas.common.bean.Usuario;
import practicas.common.dao.MySqlDAOFactory;
import practicas.common.dataaccess.interfaces.DAOProyecto;
import practicas.login.dataaccess.interfaces.DAOLogin;

public class MysqlProyecto implements DAOProyecto {

	
	@Override
	public List<Persona> listadosalumnos() throws Exception {
		List<Persona> listpersona = new ArrayList<Persona>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("select p.id, p.apellido_paterno ,p.apellido_materno,p.nombre,g.descripcion,g.nivel from persona p, alumno a,grado g where p.id=a.id  and g.idgrado = a.idgrado order by p.apellido_paterno desc"); 

			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ResultSet rs = ps.executeQuery();
			Persona persona;
			while (rs.next()) {
				persona = new Persona();
				persona.setIdPersona((rs.getString("id")));					
				persona.setNombre((rs.getString("nombre")));
				persona.setApePaterno((rs.getString("apellido_paterno")));							
				persona.setApeMaterno((rs.getString("apellido_materno")));
				persona.setGrado((rs.getString("descripcion")));
				persona.setNivel((rs.getString("nivel")));
				listpersona.add(persona);
			}
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return listpersona;
	}

	
	
	@Override
	public List<Persona> listadosalumnos(String iddocente) throws Exception {
		List<Persona> listpersona = new ArrayList<Persona>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("select p.id, p.apellido_paterno ,p.apellido_materno,p.nombre,g.descripcion,g.nivel from persona p, alumno a,grado g, profesor pf where pf.idgrado=a.idgrado and pf.id="+iddocente+ " and p.id=a.id  and g.idgrado = a.idgrado order by p.apellido_paterno desc"); 
			
			
			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ResultSet rs = ps.executeQuery();
			Persona persona;
			while (rs.next()) {
				persona = new Persona();
				persona.setIdPersona((rs.getString("id")));					
				persona.setNombre((rs.getString("nombre")));
				persona.setApePaterno((rs.getString("apellido_paterno")));							
				persona.setApeMaterno((rs.getString("apellido_materno")));
				persona.setGrado((rs.getString("descripcion")));
				persona.setNivel((rs.getString("nivel")));
				listpersona.add(persona);
			}
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return listpersona;
	}

	
	
	@Override
	public List<Persona> listadoProfesores() throws Exception {
		List<Persona> listpersona = new ArrayList<Persona>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("select p.id, p.apellido_paterno ,p.apellido_materno,p.nombre,c.descripcion as curso from persona p, profesor a, curso c where p.id=a.id  and a.idcurso= c.idcurso order by p.apellido_paterno desc"); 

			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ResultSet rs = ps.executeQuery();
			Persona persona;
			while (rs.next()) {
				persona = new Persona();
				persona.setIdPersona((rs.getString("id")));					
				persona.setNombre((rs.getString("nombre")));
				persona.setApePaterno((rs.getString("apellido_paterno")));							
				persona.setApeMaterno((rs.getString("apellido_materno")));
				persona.setCurso(rs.getString("curso"));
				listpersona.add(persona);
			}
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return listpersona;
	}

}
