<!DOCTYPE html>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Persona"%>
<%@page import="practicas.common.bean.Usuario"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<title>Gestion de Practicas</title>
	<jsp:include page="/resources/include/header-resources.jsp"></jsp:include>
</head>

<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();	
%>

<body class="page-body  skin-red">

	<div class="page-container">
	<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>

		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>
			<hr />

			<div class="mail-env">

			


				<!-- Mail Body -->
				<div class="mail-body">

					<div class="mail-header">
						<!-- title -->						
						<div class="mail-title">
							Envio Mensaje <i class="entypo-pencil"></i>
							<br>
						</div>
						
					</div>
					
					<div class="mail-compose">

						<form action="<%=request.getContextPath()%>/EnviarCorreo" method="post">

							<div class="form-group">
								<label for="subject">Asunto:</label> 
								<input type="text" name="asunto" class="form-control wysihtml5" id="subject" tabindex="1" />
							</div>

							<div class="compose-message-editor">
								<textarea class="form-control wysihtml5"
									data-stylesheet-url="<%=request.getServletContext().getContextPath() %>/resources/assets/css/wysihtml5-color.css"
									name="contenido" id="sample_wysiwyg"></textarea>
							</div>
							
							<div class="row">
								<button class="btn btn-black btn-icon btn-block">Enviar</button>						
							</div>

						</form>

					</div>
				</div>				
						
			</div>

			<hr />
			<!-- Footer -->
			<jsp:include page="/resources/include/footer.jsp"></jsp:include>
		</div>
		<jsp:include page="/resources/include/chat.jsp"></jsp:include>
	</div>
	<jsp:include page="/resources/include/footer-resources.jsp"></jsp:include>

</body>
</html>