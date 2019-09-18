<!DOCTYPE html>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Gestion de Practicas</title>
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
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/codigo.js"></script>
 
 
 <!--  Sweet Alert  -->
 <script src="<%=request.getServletContext().getContextPath()%>/MenuAdministrador/efectos/dist/sweetalert-dev.js"></script>
 <link rel="stylesheet" href="<%=request.getServletContext().getContextPath()%>/MenuAdministrador/efectos/dist/sweetalert.css">
 <!--  Fin_Sweet Alert -->
 

</head>

<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();
	System.out.print(oUsuario.getRol()+" <-- ROL");
%>

<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>

			<!-- Contenido -->

			
			<div>
				<form class="form-horizontal" name="formulario"  method="post"
				action = "<%=getServletContext().getContextPath() %>/RegistrarAlumno">
				
					<input type="hidden" value="insert" name="tipoRegistro" id="tipoRegistro">
					<div class="row">
						<div class="col-md-6">





							<fieldset>
								<legend align="left">Datos Alumno</legend>
								

								<div class="form-group">
									<label for="Nombres" class="col-sm-3 control-label">Nombres:
									</label>
									<div class="col-sm-9">
										<input type="text" name="nombre"
											required class="form-control input-sm" />
									</div>
								</div>

								<div class="form-group">
									<label for="apellido_paterno" class="col-sm-3 control-label">Apellido
										Paterno:</label>
									<div class="col-sm-9">
										<input type="text" name="apepaterno"
											required class="form-control input-sm" />
									</div>
								</div>

								<div class="form-group">
									<label for="apellido_materno" class="col-sm-3 control-label">Apellido
										Materno:</label>
									<div class="col-sm-9">
										<input  type="text" name="apematerno"
											required class="form-control input-sm"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="apellido_materno" class="col-sm-3 control-label">DNI:</label>
									<div class="col-sm-9">
										<input type="text" name="dni"
											class="form-control input-sm"/>
									</div>
								</div>


								<div class="form-group">
									<label class="col-sm-3 control-label">Celular Contacto:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control input-sm"
											required name="celular" />
									</div>
								</div>
								<div class="form-group">
									<label for="escuela" class="col-sm-3 control-label">Grado:</label>
									<div class="col-sm-9">
										<select size="1" class="form-control input-sm" name="grado">
											<option value="1">1ro Primaria</option>
											<option value="2">2do Primaria</option>
											<option value="3">3ro Primaria</option>
											<option value="4">4to Primaria</option>
											<option value="5">5to Primaria</option>
											<option value="6">6to Primaria</option>
											<option value="7">1ro Secundaria</option>
											<option value="8">2do Secundaria</option>
											<option value="9">3ro Secundaria</option>
											<option value="10">4to Secundaria</option>
											<option value="11">5to Secundaria</option>
										</select>
									</div>
								</div>

								

							</fieldset>

							
							
						</div>
						<div class="col-md-6">

							<fieldset>
								<legend align="left">Datos Ceguera</legend>
								<label class="col-sm-3 control-label">Test Ceguera:</label>
									<div class="col-sm-9">
								<div class="form-group">
									<a href="http://coguada.com/cms/2017/11/08/test-snellen-evaluando-vista/" target="_blank"><img src="<%=request.getContextPath()%>/MenuAdministrador/img/ceguera.png" alt=""> </a>
								</div>
								</div>

								
								<div class="form-group">
									<label for="escuela" class="col-sm-3 control-label">Puntaje Test Ceguera:</label>
									<div class="col-sm-9">
										<select size="1" class="form-control input-sm" name="nivelceguera">
											<option value="1">20</option>
											<option value="2">100</option>
											<option value="3">150</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label">Comentario</label>
									<div class="col-sm-9">
										<input type="text" class="form-control input-sm"
											required name="comentario" />
									</div>
								</div>
								
	
								
						</fieldset>

								
						</div>	
						</div>

						<div class="form-group" style="text-align:center" >
							<input style="margin-top:20px" type="submit" value="Registrar Alumno" class="btn btn-primary">
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