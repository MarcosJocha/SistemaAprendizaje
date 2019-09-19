package practicas.common.dataaccess.interfaces;

import practicas.common.bean.Persona;
import practicas.common.bean.Usuario;
import practicas.common.bean.Evaluacion;
import practicas.common.bean.Profesor;
import practicas.common.bean.Alumno;
import practicas.common.bean.Documento;
import practicas.common.bean.Ejercicio;
import practicas.common.bean.Solicitud;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface DAOProyecto {

	public List<Persona> listadosalumnos() throws Exception;
	public List<Persona> listadoProfesores() throws Exception;
	public List<Persona> listadosalumnos(String iddocente) throws Exception;
	public Persona RegistroAlumno(Persona persona) throws Exception;
	public Persona RegistroDocente(Persona persona) throws Exception;
	public List<Evaluacion> listadoEvaluaciones(String idalumno) throws Exception;
	public List<Ejercicio> listadoEjercicios(String idalumno, String idcurso) throws Exception;
	public List<Evaluacion> AvanceAlumno(String idalumno) throws Exception;
}
