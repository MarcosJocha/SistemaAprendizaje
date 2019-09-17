package practicas.common.dataaccess.interfaces;

import practicas.common.bean.Persona;
import practicas.common.bean.Usuario;
import practicas.common.bean.Profesor;
import practicas.common.bean.Alumno;
import practicas.common.bean.Documento;
import practicas.common.bean.Solicitud;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface DAOProyecto {

	public List<Persona> listadosalumnos() throws Exception;
	public List<Persona> listadoProfesores() throws Exception;
	List<Persona> listadosalumnos(String iddocente) throws Exception;
}
