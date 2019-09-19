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
import practicas.common.bean.Ejercicio;
import practicas.common.bean.Evaluacion;
import practicas.common.bean.Solicitud;
import org.apache.commons.lang3.exception.ExceptionUtils;



import practicas.common.bean.Persona;
import practicas.common.bean.Rol;
import practicas.common.bean.Usuario;
import practicas.common.dao.MySqlDAOFactory;
import practicas.common.dataaccess.interfaces.DAOProyecto;
import practicas.login.dataaccess.interfaces.DAOLogin;

public class MysqlProyecto implements DAOProyecto {

	//listadoEjercicios
	@Override
	public List<Ejercicio> listadoEjercicios(String idalumno, String idcurso) throws Exception {
		List<Ejercicio> listEjercicios = new ArrayList<Ejercicio>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("select ej.idejercicio, c.descripcion as curso, ej.descripcion as ejercicio, ej.comentario, t.descripcion as tema, ej.dificultad,ej.namejsp from ejercicio ej, alumno a, persona p, tema t, curso c where p.id=a.id and ej.idgrado= a.idgrado and t.idtema=ej.idtema and ej.idcurso = c.idcurso and a.id="+ idalumno+" and ej.idcurso="+idcurso+""); 
			
			
			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ResultSet rs = ps.executeQuery();
			Ejercicio ejercicio;
			while (rs.next()) {
				ejercicio = new Ejercicio();
				ejercicio.setIdejercicio(rs.getInt("idejercicio"));
				ejercicio.setCurso(rs.getString("curso"));	
				ejercicio.setDescripcion(rs.getString("ejercicio"));
				ejercicio.setComentario(rs.getString("comentario"));
				ejercicio.setTema(rs.getString("tema"));
				ejercicio.setDificultad(rs.getString("dificultad"));
				ejercicio.setNamejsp(rs.getString("namejsp"));
				listEjercicios.add(ejercicio);
			}
			
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return listEjercicios;
	}
	
	
	@Override
	public Persona RegistroAlumno(Persona persona) throws Exception {
		
		
		System.out.println("Nombre "+persona.getNombre());
		System.out.println("Apepaterno "+persona.getApePaterno());

		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("CALL INSERT_ALUMNO(?,?,?,?,?,?,?,?)"); 
			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ps.setString(1, persona.getDni());
			ps.setString(2, persona.getNombre());
			ps.setString(3, persona.getApePaterno());
			ps.setString(4, persona.getApeMaterno());
			ps.setString(5, persona.getCelular());
			ps.setInt(6, Integer.parseInt(persona.getNivelceguera()));
			ps.setInt(7, Integer.parseInt(persona.getGrado()));
			ps.setString(8, persona.getUsuario());
			
			ResultSet rs = ps.executeQuery();
			if (rs.rowInserted()) {				
				persona.setExitoInsert(1);
			}
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return persona;
	}

	
	@Override
	public Persona RegistroDocente(Persona persona) throws Exception {

		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("CALL INSERT_PROFESOR(?,?,?,?,?,?,?,?)"); 
			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ps.setString(1, persona.getDni());
			ps.setString(2, persona.getNombre());
			ps.setString(3, persona.getApePaterno());
			ps.setString(4, persona.getApeMaterno());
			ps.setString(5, persona.getCelular());
			ps.setInt(6, Integer.parseInt(persona.getGrado()));
			ps.setInt(7, Integer.parseInt(persona.getCurso()));
			ps.setString(8, persona.getUsuario());
			
			ResultSet rs = ps.executeQuery();
			if (rs.rowInserted()) {				
				persona.setExitoInsert(1);
			}
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return persona;
	}
	
	
	@Override
	public List<Persona> listadosalumnos() throws Exception {
		List<Persona> listpersona = new ArrayList<Persona>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("select p.id, p.apellido_paterno ,p.apellido_materno,p.nombre,g.descripcion,n.nombre as nivelceguera from persona p, alumno a,nivelceguera n,grado g where p.id=a.id and n.idnivelceguera=a.idnivelceguera and g.idgrado = a.idgrado order by a.fecha_registro desc"); 

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
				persona.setNivelceguera((rs.getString("nivelceguera")));
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
			sentencia.append("select p.id, p.apellido_paterno ,p.apellido_materno,p.nombre,g.descripcion,n.nombre as nivelceguera from persona p, alumno a,nivelceguera n,grado g, profesor pf where pf.idgrado=a.idgrado and pf.id="+iddocente+ " and p.id=a.id and n.idnivelceguera=a.idnivelceguera and g.idgrado = a.idgrado order by p.apellido_paterno desc"); 
			
			
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
				persona.setNivelceguera((rs.getString("nivelceguera")));
				listpersona.add(persona);
			}
			System.out.print("ListaProfeAlumnos"+listpersona.size());
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return listpersona;
	}

	
	@Override
	public List<Evaluacion> listadoEvaluaciones(String idalumno) throws Exception {
		List<Evaluacion> listEvaluaciones = new ArrayList<Evaluacion>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("  select p.id as codigo,CONCAT(p.nombre,' ', p.apellido_paterno,' ', p.apellido_materno) AS nombrecompleto,c.descripcion as curso,t.descripcion as tema,ej.descripcion as ejercicio,ev.fecha_evaluacion,ev.nrointentos,ev.nota  from evaluacion ev, ejercicio ej, persona p, alumno a, curso c,tema t where ev.idejercicio=ej.idejercicio  and p.id=a.id and c.idcurso=ej.idcurso and ev.idalumno= a.id and ej.idtema=t.idtema and p.id="+ idalumno+ 
					""); 

			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ResultSet rs = ps.executeQuery();
			Evaluacion evaluacion;
			while (rs.next()) {
				evaluacion = new Evaluacion();
				evaluacion.setNombrecompleto(rs.getString("nombrecompleto"));
				evaluacion.setIdpersona(rs.getString("codigo"));	
				evaluacion.setCurso(rs.getString("curso"));
				evaluacion.setTema(rs.getString("tema"));
				evaluacion.setEjercicio(rs.getString("ejercicio"));
				evaluacion.setFecha_evaluacion(rs.getString("fecha_evaluacion"));
				evaluacion.setNrointentos(rs.getInt("nrointentos"));
				evaluacion.setNota(rs.getInt("nota"));
				listEvaluaciones.add(evaluacion);
			}
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return listEvaluaciones;
	}
	
	
	
	@Override
	public List<Evaluacion> AvanceAlumno(String idalumno) throws Exception {
		List<Evaluacion> listEvaluaciones = new ArrayList<Evaluacion>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("select  c.descripcion as curso, t.descripcion as tema,count(a.id) as CantidadEjercicios,max(ev.nrointentos) as MayorNumIntentos,AVG(ev.nota) as Promedio from evaluacion ev, ejercicio ej, alumno a, curso c,tema t where ev.idejercicio=ej.idejercicio and c.idcurso=ej.idcurso and ej.idtema=t.idtema and a.id=ev.idalumno and a.id="+idalumno+ " group by curso,tema" ); 

			System.out.print("SentenciaAvance "+sentencia+"|Fin");

			PreparedStatement ps =  con.prepareStatement(sentencia.toString());
			ResultSet rs = ps.executeQuery();
			Evaluacion evaluacion;
			while (rs.next()) {
				evaluacion = new Evaluacion();
				evaluacion.setCurso(rs.getString("curso"));
				evaluacion.setTema(rs.getString("tema"));
				evaluacion.setCantidadEjercicios(rs.getInt("CantidadEjercicios"));
				evaluacion.setMayornumIntentos(rs.getInt("MayorNumIntentos"));
				evaluacion.setPromedio(rs.getDouble("Promedio"));
				listEvaluaciones.add(evaluacion);
			}
			MySqlDAOFactory.close(con);
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return listEvaluaciones;
	}
	
	@Override
	public List<Persona> listadoProfesores() throws Exception {
		List<Persona> listpersona = new ArrayList<Persona>();
		Connection con = MySqlDAOFactory.obtenerConexion();
		try {
			StringBuffer sentencia=new StringBuffer();
			sentencia.append("select p.id, p.apellido_paterno ,p.apellido_materno,p.nombre,c.descripcion as curso from persona p, profesor a, curso c where p.id=a.id  and a.idcurso= c.idcurso order by a.fecha_registro desc"); 

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
