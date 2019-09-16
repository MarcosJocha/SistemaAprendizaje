<!DOCTYPE html>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Gestion Practicas</title>
<jsp:include page="/resources/include/header-resources.jsp"></jsp:include>
<link href="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/css/boostrap/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/css/boostrap/bootstrap-table.min.css" rel="stylesheet" />
 <link href="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/css/dashboard.css" rel="stylesheet" />
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/bootstrap-table.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/validator.min.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/combos.js"></script>
 <script src="<%=request.getServletContext().getContextPath() %>/MenuAdministrador/js/accionesMenuAdministradors.js"></script>
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
<style>
fieldset{
padding-top:20px;
padding-bottom:20px;
}
</style>
<body class="page-body skin-red" style="padding-top: -0;">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>

		

			<div>
				<form class="form-horizontal" data-toggle="validator" role="form" id="formDocente" name="formulario" enctype="multipart/form-data" method="post" onsubmit = "return validarFormulario()">
						<div class="row">
						
						
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<fieldset>
								<legend align="left">Datos Generales</legend>
								
								
								
								
									<div class="form-group">
									<label for="apellido_paterno" class="col-sm-3 control-label">Apellido
										Paterno:</label>
									<div class="col-sm-9">
										<input id="apeP" type="text" name="apellidopaterno"
											class="form-control input-sm" />
									</div>
								</div>

								<div class="form-group">
									<label for="apellido_materno" class="col-sm-3 control-label">Apellido
										Materno:</label>
									<div class="col-sm-9">
										<input id ="apeM" type="text" name="apellidomaterno"
											class="form-control input-sm"/>
									</div>
								</div>
								

								<div class="form-group">
									<label for="Nombres" class="col-sm-3 control-label">Nombres:
									</label>
									<div class="col-sm-9">
										<input type="text" id="nombres" name="nombres"
											class="form-control input-sm" />
									</div>
								</div>

							

								<div class="form-group">
									<label for="escuela" class="col-sm-3 control-label">Escuela:</label>
									<div class="col-sm-9">
										<select size="1" class="form-control input-sm" id="escuela">
											<option value="Ing.Sistemas">Ing.Sistemas</option>
											<option value="Ing.Industrial">Ing.Industrial</option>
											<option value="Ing.Civil">Ing.Civil</option>
											<option value="Arquitectura">Arquitectura</option>
											<option value="Ciencias Aeronauticas">Ciencias Aeronauticas</option>
										</select>
									</div>
								</div>
								
								
								</fieldset>
								
								</div>
								
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
														
							<fieldset>
								<legend align="left">Medio de contacto</legend>
							
						
								
								<div class="form-group">
									<label for="txt_celular" class="col-sm-3 control-label">Celular:</label>
									<div class="col-sm-9">
										<input id="txt_celular" type="text" name="txt_celular"
											class="form-control input-sm" />
									</div>
									</div>
									<div class="form-group">
									<label for="txt_telefono" class="col-sm-3 control-label">Teléfono:</label>
									<div class="col-sm-9">
										<input id="txt_telefono" type="text" name="txt_telefono"
											class="form-control input-sm" />
									</div>
									</div>
									<div class="form-group">
									<label for="txt_email" class="col-sm-3 control-label">E-mail:</label>
									<div class="col-sm-9">
										<input id="txt_email" type="text" name="txt_email"
											class="form-control input-sm" />
									</div>
									</div>
									
									</fieldset>
							</div>
							

						


						<div class="form-group" style="text-align:center" >
							<input style="margin-top:20px" type="submit" value="Registrar" class="btn btn-primary">
						</div>
						
					</div>
					
					</form>
					
				</div>
						
			</div>
					<jsp:include page="/resources/include/footer.jsp"></jsp:include>
		</div>
		
<iframe name="null" style="display: none;"></iframe>


		<!-- Fin contenido -->
	<jsp:include page="/resources/include/chat.jsp"></jsp:include>
	</div>

	<jsp:include page="/resources/include/footer-resources.jsp"></jsp:include>
<script>

var form =$('#formDocente');
form.validator().on('submit', function (e) {
  if (e.isDefaultPrevented()) {
	  
  } else {
	  e.preventDefault();
	  var dataForm=form.serializeArray();
	  	/*console.log(dataTelefonos);
		dataForm.push(dataTelefonos);*/
		dataForm=camposDinamicosPost(dataForm,"telefono");
		dataForm=camposDinamicosPost(dataForm,"email");
		dataForm=campoDocumentoDinamicosPost(dataForm,"documento");
		dataForm=campoGradoDinamicosPost(dataForm,"gradoAcademico");
	  $.ajax({
		  url: "<%=getServletContext().getContextPath() %>/Gestionar_Docente",
		  method: "POST",
		  data: dataForm,
		  dataType: "json",
		  
		}).done(function( respuesta ) {
			console.log(respuesta);
			if(respuesta.exito){
				resetearFormulario(form);
				$("#msj2").html(respuesta.mensaje);
				$("#msj1").fadeToggle("fast", function() {
					$("#msj1").delay(2000).fadeToggle(1000);
				});;
				
			}
		});
    // everything looks good!
  }
});

function resetearFormulario(form){
	form[0].reset();
	$("select[id*='combo_provincias']").prop('disabled', true);
	$("select[id*='combo_distritos']").prop('disabled', true);
	$("#table_gradoAcademico").bootstrapTable('load', []);
	$("#table_telefono").bootstrapTable('load', []);
	$("#table_documento").bootstrapTable('load', []);
	$("#table_email").bootstrapTable('load', []);
}

function camposDinamicosPost(dataForm,campo){
	
	var dataTable=$('#table_'+campo).bootstrapTable('getData');
	var nuevoCampo=[];
	  $.each( dataTable, function( key, value ) {
		  nuevoCampo.push({
			  "id": value.id,
			  "campo": value.valor
		    });
		});
	  dataForm.push({name:"json_"+campo,value:JSON.stringify(nuevoCampo)});
	  return dataForm;
}

function campoDocumentoDinamicosPost(dataForm,campo){
	var dataTable=$('#table_'+campo).bootstrapTable('getData');
	var nuevoCampo=[];
	  $.each( dataTable, function( key, value ) {
		  nuevoCampo.push({
			  "id": value.id,
			  "tipodoc":value.tipodoc,
			  "campo": value.valor
		    });
		});
	  dataForm.push({name:"json_"+campo,value:JSON.stringify(nuevoCampo)});
	  return dataForm;
}

function campoGradoDinamicosPost(dataForm,campo){
	var dataTable=$('#table_'+campo).bootstrapTable('getData');
	var nuevoCampo=[];
	  $.each( dataTable, function( key, value ) {
		  nuevoCampo.push({
			   "id": value.id,
			   "gradoAcademico": value.gradoAcademico,
	           "profesion":value.profesion,
	           "especialidad": value.especialidad,
	           "institucion":value.institucion,
	           "fechaIngreso":value.fechaIngreso
		    });
		});
	  dataForm.push({name:"json_"+campo,value:JSON.stringify(nuevoCampo)});
	  return dataForm;
}


function validarFormulario(){
	
	var nombreCampo = document.getElementById("nombres").value;
	var apellidoPCampo = document.getElementById("apeP").value;
	var apellidoMCampo = document.getElementById("apeM").value;
	var fechaNacimientoCampo = document.getElementById("fec_nac").value;
	
	
	if(nombreCampo == ""){
		sweetAlert("Error", "Ingrese nombres del docente", "error");
	}else if(apellidoPCampo == ""){
		sweetAlert("Error", "Ingrese apellido paterno del docente", "error");
	}else if(apellidoMCampo == ""){
		sweetAlert("Error", "Ingrese apellido materno del docente", "error");
	}
}

</script>
</body>
</html>