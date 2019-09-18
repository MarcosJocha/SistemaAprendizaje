package practicas.common.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import practicas.common.action.ActionServlet;
import practicas.common.action.HttpMethod;
import practicas.common.action.HttpMethodType;
import practicas.common.action.RequireLogin;
import practicas.common.action.SessionParameters;
import practicas.common.bean.Persona;
import practicas.common.bean.Usuario;
import practicas.common.bean.Alumno;
import practicas.common.bean.Profesor;
import practicas.common.dao.DAOFactory;


@WebServlet("/RegistrarDocente")
public class RegistrarDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegistrarDocente() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		String nombre =request.getParameter("nombre");
		String apepaterno =request.getParameter("apepaterno");
		String apematerno =request.getParameter("apematerno");
		String dni =request.getParameter("dni");
		String direccion =request.getParameter("direccion");
		String celular=request.getParameter("celular");
		String grado =request.getParameter("grado");
		String curso =request.getParameter("curso");
		String usuario=nombre.substring(0,1)+apepaterno;
		
		
		
		Persona persona=new Persona();
		persona.setNombre(nombre);
		persona.setApePaterno(apepaterno);
		persona.setApeMaterno(apematerno);
		persona.setDni(dni);
		persona.setCelular(celular);
		persona.setGrado(grado);
		persona.setCurso(curso);
		persona.setUsuario(usuario);
		
		
		try {
			DAOFactory oDAOFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
			persona = oDAOFactory.getFunctions().getPracticas().RegistroDocente(persona);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		if(persona.getExitoInsert()==1) {
			request.setAttribute("Profesor", persona);
			request.setAttribute("mensaje", "Registro de Profesor Correcto");
		}else {
			request.setAttribute("Profesor", persona);
			request.setAttribute("mensaje", "Registro Fallido");
		}
		request.getRequestDispatcher("/listarDocentes").forward(request, response);
		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
	}
}

