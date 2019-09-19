<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>


<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());

	String idprofesor=oUsuario.getPersona().getIdPersona().toString();
	Persona oProfesor = oUsuario.getPersona();
	String rol = oUsuario.getRol().toString();
	
%>



	<li><a href="#"> <i class="entypo-folder"></i><span class="title">Menu Profesor</span></a>
		<ul>
			<%if(rol.equalsIgnoreCase("Profesores")){
%>	
			<li><a href="<%=request.getContextPath()%>/listarAlumnosProfesor?id=<%=idprofesor%>"><span class="title">Mis Alumnos</span></a>
			<li><a href="<%=request.getContextPath()%>/MenuDocente/Cursos.jsp"><span class="title">Cursos</span></a>			
			<li><a href="<%=request.getContextPath()%>/RendimientoAlumnoDocente"><span class="title">Rendimiento</span></a>			
		
			<%} %>
				
	</ul>
	</li>
	