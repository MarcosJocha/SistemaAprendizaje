package practicas.common;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;

import practicas.common.action.ActionServlet;
import practicas.common.action.Default;
import practicas.common.action.HttpMethod;
import practicas.common.action.HttpMethodType;
import practicas.common.action.RequireLogin;
import practicas.common.dao.DAOFactory;

@WebServlet("/EnviarCorreo")
public class EnviarCorreo extends ActionServlet {

	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
		
		System.out.println("HOST  " + host);
		System.out.println("PORT " + port);
		System.out.println("USUARIO  " + user);
		System.out.println("PASSWORD " + pass);
	}
	
	@Default()
	@RequireLogin(true)
	@HttpMethod(HttpMethodType.POST)	
	public void SimulacionInicialGeneral() throws Exception {
		

		//String para = request.getParameter("para");
		String asunto = request.getParameter("asunto");
		String contenido = request.getParameter("contenido");
		
		System.out.println("ASUNTO "+ asunto);
		System.out.println("CONTENIDO "+ contenido);
		
		DAOFactory factory =null;
		
		String mensajeCorreo="";	
		try 
		{		
			factory= DAOFactory.getDAOFactory(DAOFactory.MYSQL);
			
			
				String correo="giancarlo.aguado@gmail.com";
				
					System.out.println(correo);				
					EmailUtility.sendEmail(host, port, user, pass, correo, asunto,contenido);	
				
			mensajeCorreo="Se envió corectamente el mensaje a Soporte";
			
			request.setAttribute("mensaje", mensajeCorreo);
			
			
		} catch (Exception ex) {
			ex.printStackTrace();						
			mensajeCorreo="Error al enviar los mensajes a los alumnos.Favor de notificar a Informática " + ex.getMessage();
			
			request.setAttribute("mensajeCorreo", mensajeCorreo);
			System.out.println(mensajeCorreo);
		}
		finally 
		{			
			request.getRequestDispatcher("SimulacionMatricula/mensaje.jsp").forward(request, response);
		}
	}
}
