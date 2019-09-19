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
import practicas.common.bean.Ejercicio;
import practicas.common.bean.Evaluacion;
import practicas.common.bean.Profesor;
import practicas.common.dao.DAOFactory;


@WebServlet("/listarEjercicios")
public class ListarEjercicios extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ListarEjercicios() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		String idalumno = request.getParameter("idalumno");
		
		if(idalumno==null) {
			Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
			Persona oPersona = oUsuario.getPersona();
			idalumno = oPersona.getIdPersona();
		}
		String idCurso = request.getParameter("curso");		
		
		List<Ejercicio> listajercicios = null;
		try {
			DAOFactory oDAOFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
			listajercicios = oDAOFactory.getFunctions().getPracticas().listadoEjercicios(idalumno,idCurso);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		request.setAttribute("listajercicios", listajercicios);
		request.getRequestDispatcher("/MenuAlumno/ListadoEjercicios.jsp").forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}

