<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona =  oUsuario.getPersona();
	
	String rol = oUsuario.getRol().toString();	
		
%>



<li><a href="#"> <i class="entypo-folder"></i><span
		class="title">Menu Administrador</span></a>
	<ul>
	
	<%if(rol.equalsIgnoreCase("ALUMNOS") || rol.equalsIgnoreCase("ADMINISTRADORES") || rol.equalsIgnoreCase("DESARROLLADORES")){
%>

			
				<li><a
					href="<%=request.getContextPath()%>/MenuAdministrador/RegistroAlumno.jsp"><span
						class="title">Ficha de Registro Alumno</span></a></li>
						<li><a
					href="<%=request.getContextPath()%>/listarAlumnos"><span
						class="title">Listado Alumnos</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/MenuAdministrador/RegistroDocente.jsp"><span
						class="title">RegistroProfesor</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/listarDocentes"><span
						class="title">ListadoProfesor</span></a></li>
				
				
				<%} %>
	</ul></li>