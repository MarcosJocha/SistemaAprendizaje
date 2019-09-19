<!DOCTYPE html>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%@page import="practicas.common.bean.Alumno"%>
<%@page import="practicas.common.bean.Evaluacion"%>
<%@page import="practicas.common.bean.Ejercicio"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Listado Ejercicios</title>
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
	List<Ejercicio> listajercicios=(List<Ejercicio>)request.getAttribute("listajercicios");
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();
	String idalumno = oPersona.getIdPersona();
	//request.setAttribute("idalumno", idalumno);
	System.out.print("ID->"+idalumno);
	
	String curso=listajercicios.get(0).getCurso();
	
%>


<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>
			<!-- Contenido -->
			
			<form class="form-horizontal" name="formulario"  method="post"
				action = "<%=getServletContext().getContextPath() %>/listarEjercicios?id=<%=idalumno%>">
				
					<input type="hidden" value="insert" name="tipoRegistro" id="tipoRegistro">
					<div class="row">
						<div class="col-md-6">


								<div class="form-group">
									<label for="escuela" class="col-sm-3 control-label">Curso:</label>
									<div class="col-sm-9">
										<select size="1" class="form-control input-sm" name="curso">
											<option value="1">Matematicas</option>
											<option value="2">Trigonometria</option>
											<option value="3">Algebra</option>
											<option value="4">Aritmetica</option>
											<option value="5">Geometria</option>
											<option value="6">Razonamiento Matematico</option>
											<option value="7">Logica</option>
										</select>
									</div>
								</div>

							<div class="form-group" style="text-align:center" >
							<input style="margin-top:20px" type="submit" value="Ver Ejercicios" class="btn btn-primary">
						</div>
							
							
						</div>
						<div class="col-md-6">

						</div>
					</div>
				</form>
				
				
			<div>Ejercicios Curso:</div>
			<br/>
			<div class="lead alert-info"><%=curso%></div>
			<div>
			<table class="table table-bordered">
						<thead>
							<tr>
								
								<th>Curso</th>
								<th>Descripcion</th>
								<th>Comentario</th>
								<th>Tema</th>
								<th>Dificultad</th>
								<th>Enlace</th>
							</tr>
						</thead>
						<tbody>
						<% for(int i=0; i<listajercicios.size(); i++){ %>
							<tr>
							
								<td><%=listajercicios.get(i).getCurso() %></td>
								<td><%=listajercicios.get(i).getDescripcion() %></td>
								<td><%=listajercicios.get(i).getComentario() %></td>
								<td><%=listajercicios.get(i).getTema() %></td>
								<td><%=listajercicios.get(i).getDificultad() %></td>
								<td><a href="<%=getServletContext().getContextPath() %>/MenuAlumno/Ejercicios/<%=listajercicios.get(i).getNamejsp()%>.jsp"><i >Empezar</i></a></td>
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

