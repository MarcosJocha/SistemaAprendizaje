<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>


<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oProfesor = oUsuario.getPersona();
	String rol = oUsuario.getRol().toString();
	
%>



	<li><a href="#"> <i class="entypo-folder"></i><span class="title">Menu Profesor</span></a>
		<ul>
			<%if(rol.equalsIgnoreCase("PROFESORES") || rol.equalsIgnoreCase("ADMINISTRADORES") || rol.equalsIgnoreCase("DESARROLLADORES")){
%>	
		
			<li><a href="<%=request.getContextPath()%>/listarAlumnos"><span class="title">Alumnos</span></a>
			<li><a href="<%=request.getContextPath()%>/MenuDocente/Cursos.jsp"><span class="title">Cursos</span></a>			
			<li><a href="<%=request.getContextPath()%>/MenuDocente/Rendimiento.jsp"><span class="title">Rendimiento</span></a>			
		
			<%} %>
				
	</ul>
	</li>
	