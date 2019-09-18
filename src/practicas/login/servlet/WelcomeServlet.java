package practicas.login.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import practicas.common.action.ActionServlet;
import practicas.common.action.Default;
import practicas.common.action.HttpMethod;
import practicas.common.action.HttpMethodType;
import practicas.common.action.RequireLogin;
import practicas.common.action.SessionParameters;
import practicas.common.bean.Modulo;
import practicas.common.bean.Persona;
import practicas.common.bean.Usuario;
import practicas.common.dao.DAOFactory;


@WebServlet("/welcome")
public class WelcomeServlet extends ActionServlet {

	public static final String MODULES = "modules";
	
	@Default
	@HttpMethod(HttpMethodType.GET)
	public void modules() throws Exception {
		log.info("welcome");
		Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
		log.info("USUARIO "+oUsuario.getPersona().getIdPersona().toString());
		
		request.getServletContext().getRequestDispatcher("/welcome.jsp").forward(request, response);
	} 

}
