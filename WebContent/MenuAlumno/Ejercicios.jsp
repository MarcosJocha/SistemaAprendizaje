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
	System.out.print(oUsuario.getRol()+" <-- ROL");
%>

<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>

			<!-- Contenido -->

			<div>
				<form class="form-horizontal" data-toggle="validator" role="form" id="formDocente" name="formulario" enctype="multipart/form-data" method="post"
				onsubmit = "return validarFormulario()">
					<input type="hidden" value="insert" name="tipoRegistro" id="tipoRegistro">
					<div class="row">
						<div class="col-md-6">
							<input type="hidden" name="f" value="guardarDocente" />





							<fieldset>
								<legend align="left">Datos Generales</legend>
								

								<div class="form-group">
									<label for="Nombres" class="col-sm-3 control-label">Nombres:
									</label>
									<div class="col-sm-9">
										<input type="text" id="nombre" name="nombre"
											class="form-control input-sm" />
									</div>
								</div>

								<div class="form-group">
									<label for="apellido_paterno" class="col-sm-3 control-label">Apellido
										Paterno:</label>
									<div class="col-sm-9">
										<input id="apematerno" type="text" name="apepaterno"
											class="form-control input-sm" />
									</div>
								</div>

								<div class="form-group">
									<label for="apellido_materno" class="col-sm-3 control-label">Apellido
										Materno:</label>
									<div class="col-sm-9">
										<input id ="apematerno" type="text" name="apematerno"
											class="form-control input-sm"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="apellido_materno" class="col-sm-3 control-label">DNI:</label>
									<div class="col-sm-9">
										<input id ="dni" type="text" name="dni"
											class="form-control input-sm"/>
									</div>
								</div>

								<div class="form-group">
									<label for="escuela" class="col-sm-3 control-label">Especialidad:</label>
									<div class="col-sm-9">
										<select size="1" class="form-control input-sm" id="especialidad">
											<option value="11">ARQUITECTURA</option>
											<option value="12">CIENCIAS AERONAUTICAS</option>
											<option value="13">INGENIERIA CIVIL</option>
											<option value="14">INGENIERIA DE COMPUTACION Y SISTEMAS</option>
											<option value="16">INGENIERIA INDUSTRIAL</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label for="cargo" class="col-sm-3 control-label">
										Cargo:</label>
									<div class="col-sm-9">
										<input id ="cargo" type="text" name="cargo"
											class="form-control input-sm"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="funciones" class="col-sm-3 control-label">
										Funciones :</label>
									<div class="col-sm-9">
										<textarea id ="funciones" name="funciones"
											class="form-control input-sm" placeholder="Escriba las funciones desempeñadas en la organizacion"></textarea>
									</div>
								</div>

								

							</fieldset>

							
							<fieldset>
								<legend align="left">Datos de Contacto</legend>


								</br>

								<div class="form-group">
									<label for=persEncargada class="col-sm-3 control-label">Persona Contacto:</label>
									<div class="col-sm-9">
												<input type="email" class="form-control input-sm" id="persEncargada" />
											</div>
											
								</div>

								<div class="form-group">
									<label for="dniEncargado" class="col-sm-3 control-label">DNI:</label>
									<div class="col-sm-9">
										<input id ="dniEncargado" type="text" name="dniEncargado"
											class="form-control input-sm"/>
											</div>
					
								</div>
								
								</br>

								


							</fieldset>
						</div>
						<div class="col-md-6">

							<fieldset>
								<legend align="left">Datos Empresa</legend>
								<label class="col-sm-3 control-label">Consulta RUC:</label>
									<div class="col-sm-9">
								<div class="form-group">
									<a href="http://www.sunat.gob.pe/cl-ti-itmrconsruc/FrameCriterioBusquedaMovil.jsp" target="_blank"><img src="<%=request.getContextPath()%>/Efectivas/img/sunat.png" alt=""> </a>
								</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">RUC:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control input-sm"
											required id="ruc" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label">Razon Social:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control input-sm"
											required id="razon" />
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-sm-3 control-label">Direccion:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control input-sm"
											required id="dirEmpresa" />
									</div>
								</div>
								

	
								
						</fieldset>
						</div>

						<div class="form-group" style="text-align:center" >
							<input style="margin-top:20px" type="submit" value="Agregar" class="btn btn-primary">
						</div>
						
						
						
					</div>
<input type="hidden" name="nombre" value="" />
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