<!DOCTYPE html>
<%@page import="java.util.Vector"%>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%@page import="practicas.common.bean.Alumno"%>
<%@page import="practicas.common.bean.Documento"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Gestion Practicas</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<jsp:include page="/resources/include/header-resources.jsp"></jsp:include>
<link href="<%=request.getServletContext().getContextPath() %>/MenuAlumno/css/boostrap/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getServletContext().getContextPath() %>/MenuAlumno/css/boostrap/bootstrap-table.min.css" rel="stylesheet" />
 <link href="<%=request.getServletContext().getContextPath() %>/MenuAlumno/css/dashboard.css" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/bootstrap-table.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/validator.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/combos.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/accionesMenuAlumnos.js"></script>

</head>

<%
Vector<Documento> listaDocumentos=(Vector)request.getAttribute("listadocumentos");

	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();
%>


<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>

			<!-- Contenido -->
			<div>Alumnos</div>
			<div>
			<table data-search="true" id="table_telefono" data-height="600"
						data-click-to-select="true">
						<thead>
							<tr>
								
								<th>Codigo</th>
								<th>Alumno</th>
								<th>TipoDocumento</th>
								<th>Nombre</th>
								<th>Estado</th>
								<th>Archivo</th>
							</tr>
						</thead>
						
						<% for(int i=0; i<listaDocumentos.size(); i++){ %>
							<tr>
							
								<td><%=listaDocumentos.get(i).getIdDocumento() %></td>
								<td><%=listaDocumentos.get(i).getNombreAlumno() %></td>
								<td><%=listaDocumentos.get(i).getNombreDocumento() %></td>
								<%if(listaDocumentos.get(i).getEstado().equals("PENDIENTE")){ %>
								<td>Por Revisar</td>
								<%}else{ %>
								<td>Revisado</td>
								<%} %>
								<td><a href="Gestionar_Docente?f=eliminarDocente&dato=<%=listaDocumentos.get(i).getIdDocumento() %>")>
								<i class="material-icons">Descargar</i>
								</a></td>
							</tr>
						<% } %> 
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

