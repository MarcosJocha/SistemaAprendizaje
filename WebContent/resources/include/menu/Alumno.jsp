<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona =  oUsuario.getPersona();
	
	String rol = oUsuario.getRol().toString();	
		
%>


				
<li><a href="#"> <i class="entypo-folder"></i><span

		class="title">Menu Alumno</span></a>
	<ul>
		
			<%if(rol.equalsIgnoreCase("ALUMNOS") || rol.equalsIgnoreCase("ADMINISTRADORES") || rol.equalsIgnoreCase("DESARROLLADORES")){
%>
				
				<li><a
					href="<%=request.getContextPath()%>/MenuAlumno/Teoria.jsp"><span
						class="title">Teoria</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/MenuAlumno/Ejercicios.jsp"><span
						class="title">Ejercicios</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/MenuAlumno/Rendimiento.jsp"><span
						class="title">Rendimiento</span></a></li>				
			
	
		
	
				<%} %>
			
		



	</ul></li>