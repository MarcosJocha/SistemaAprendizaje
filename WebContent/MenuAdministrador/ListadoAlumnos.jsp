<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%@page import="practicas.common.bean.Alumno"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Gestion Practicas</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<jsp:include page="/resources/include/header-resources.jsp"></jsp:include>
<link href="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/css/boostrap/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/css/boostrap/bootstrap-table.min.css" rel="stylesheet" />
 <link href="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/css/dashboard.css" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/bootstrap-table.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/validator.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/combos.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/accionesRegistroDocentes.js"></script>

</head>

<%
	List<Persona> listaAlumnos=(List<Persona>)request.getAttribute("listaAlumnos");
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();
	String mensaje="";
	String text="",display="";
	if(request.getAttribute("mensaje")!=null){
		
		 mensaje= request.getAttribute("mensaje").toString();
		 text="alert-success";
		 display="";
		 
		 }else{
		 mensaje="";
		 text="";
		 display="hidden";
	}
	
%>


<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>
			<div class="alert <%=text%> " role="alert"><%=mensaje%></div>
			<!-- Contenido -->
			<div>Alumnos General</div>
			<div>
			<table class="table table-bordered">
						<thead>
							<tr>
								
								<th>Codigo</th>
								<th>Nombre</th>
								<th>Apellido Paterno</th>
								<th>Apellido Materno</th>
								<th>Grado</th>
								<th>Nivel Ceguera</th>
								<th>Rendimiento</th>
							</tr>
						</thead>
						<tbody>
						<% for(int i=0; i<listaAlumnos.size(); i++){ %>
							<tr>
							
								<td><%=listaAlumnos.get(i).getIdPersona() %></td>
								<td><%=listaAlumnos.get(i).getNombre() %></td>
								<td><%=listaAlumnos.get(i).getApePaterno() %></td>
								<td><%=listaAlumnos.get(i).getApeMaterno() %></td>
								<td><%=listaAlumnos.get(i).getGrado() %></td>
								<td><%=listaAlumnos.get(i).getNivelceguera() %></td>
								<td><a href="RendimientoAlumno?id=<%=listaAlumnos.get(i).getIdPersona()%>">
								<i class="download-icons">Ver Rendimiento</i>
								</a></td>
							</tr>
						<% } %> 
						</tbody>
					</table>
			</div>
			
					<jsp:include page="/resources/include/footer.jsp"></jsp:include>
		</div>



		<!-- Fin contenido -->
	<jsp:include page="/resources/include/chat.jsp"></jsp:include>
	</div>
	</div>

	<jsp:include page="/resources/include/footer-resources.jsp"></jsp:include>

</body>
</html>

