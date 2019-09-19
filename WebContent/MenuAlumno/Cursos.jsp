<!DOCTYPE html>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Cursos</title>
<jsp:include page="/resources/include/header-resources.jsp"></jsp:include>
<link href="<%=request.getServletContext().getContextPath() %>/MenuAlumno/css/boostrap/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getServletContext().getContextPath() %>/MenuAlumno/css/boostrap/bootstrap-table.min.css" rel="stylesheet" />
 <link href="<%=request.getServletContext().getContextPath() %>/MenuAlumno/css/dashboard.css" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/bootstrap-table.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/validator.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/combos.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/accionesRegistroDocentes.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAlumno/js/codigo.js"></script>
 
 
 <!--  Sweet Alert  -->
 <script src="<%=request.getServletContext().getContextPath()%>/MenuAlumno/efectos/dist/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/MenuAlumno/efectos/dist/sweetalert.css">
 <!--  Fin_Sweet Alert -->
 

</head>

<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();
	String idalumno = oPersona.getIdPersona();
	//request.setAttribute("idalumno", idalumno);
	System.out.print("ID"+idalumno);
%>

<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>

			<!-- Contenido -->

			<div>
				<form class="form-horizontal" name="formulario"  method="post"
				action = "<%=getServletContext().getContextPath() %>/listarEjercicios?idalumno=<%=idalumno%>">
				
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
				
			</div>
					<jsp:include page="/resources/include/footer.jsp"></jsp:include>
		</div>
		
<iframe name="null" style="display: none;"></iframe>


		<!-- Fin contenido -->
	<jsp:include page="/resources/include/chat.jsp"></jsp:include>
	</div>

	<jsp:include page="/resources/include/footer-resources.jsp"></jsp:include>

</body>
</html>