package practicas.login.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import practicas.common.action.ActionServlet;
import practicas.common.action.Default;
import practicas.common.action.RequireLogin;

@WebServlet("/index")
public class IndexServlet extends ActionServlet {

	private static final long serialVersionUID = 1L;
       
	@Default
	@RequireLogin(false)
	public void index() throws ServletException, IOException {
		request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	} 

}
