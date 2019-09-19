<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%@page import="practicas.common.bean.Alumno"%>
<%@page import="practicas.common.bean.Evaluacion"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Listado Evaluaciones por Alumno</title>
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
	List<Evaluacion> listaEvaluaciones=(List<Evaluacion>)request.getAttribute("listaEvaluaciones");
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();
	String alumno="";
	if(listaEvaluaciones.size()==0){
		 alumno="Alumno sin Evaluaciones Previas";
	}else{
		 alumno=listaEvaluaciones.get(0).getNombrecompleto();

	}
	
	
	
%>


<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>
			<!-- Contenido -->
			<div>Rendimiento:</div>
			<br/>
			<div class="lead alert-info"><%=alumno %></div>
			<div>
			<table class="table table-bordered">
						<thead>
							<tr>
								
								<th>Curso</th>
								<th>Tema</th>
								<th>Ejercicio</th>
								<th>nrointentos</th>
								<th>nota</th>
								<th>Fecha</th>
								<th>Detalle</th>
							</tr>
						</thead>
						<tbody>
					<% if(listaEvaluaciones!=null)	{ for(int i=0; i<listaEvaluaciones.size(); i++){ %>
							<tr>
							
								<td><%=listaEvaluaciones.get(i).getCurso() %></td>
								<td><%=listaEvaluaciones.get(i).getTema() %></td>
								<td><%=listaEvaluaciones.get(i).getEjercicio() %></td>
								<td><%=listaEvaluaciones.get(i).getNrointentos() %></td>
								<td><%=listaEvaluaciones.get(i).getNota() %></td>
								<td><%=listaEvaluaciones.get(i).getFecha_evaluacion() %></td>
								<td><a href=""><i class="download-icons">Ver Detalle</i></a></td>
							</tr>
						<% }} %> 
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

