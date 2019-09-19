<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona =  oUsuario.getPersona();	
	String rol = oUsuario.getRol().toString();	
	String idalumno = oPersona.getIdPersona();
%>


				
<li><a href="#"> <i class="entypo-folder"></i><span

		class="title">Menu Alumno</span></a>
	<ul>
		
			<%if(rol.equalsIgnoreCase("Alumnos")){
%>
				
				<li><a
					href="<%=request.getContextPath()%>/MenuAlumno/Cursos.jsp"><span
						class="title">Cursos</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/calificaciones?id=<%=idalumno%>"><span
						class="title">Calificaciones</span></a></li>
				<li><a
					href="<%=request.getContextPath()%>/avanceAlumno?id=<%=idalumno%>"><span
						class="title">Avance</span></a></li>				
			
	
		
	
				<%} %>
			
		



	</ul></li>