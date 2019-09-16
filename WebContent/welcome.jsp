<!DOCTYPE html>
<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>CEE LUIS BRAILLE</title>
	<jsp:include page="/resources/include/header-resources.jsp"></jsp:include>
</head>

<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona = oUsuario.getPersona();
	String idprofesor = oPersona.getIdPersona();
	request.setAttribute("idprofesor", idprofesor);
	 System.out.println("ESTE ES EL ID ->"+idprofesor);
%>
<body class="page-body skin-blue">
	<div class="page-container">
		<jsp:include page="/resources/include/sidebar-menu.jsp"></jsp:include>
		<div class="main-content">
			<jsp:include page="/resources/include/profile-bar.jsp"></jsp:include>	
			
			<br />
			
			<div  align="center"><h2>OBJETIVO</h2></div>
			
			<div class="panel-body">


				
				<h5>Reforzar la calidad de educacion para las personas invidentes en el colegio CEE Luis Braille</h5>
				<h5>Contribuir a mejorar los niveles de aprendizaje en el curso de matemáticas mediante el sistema inteligente, para el desarrollo del curso teorico y practico.</h5>
				<h5>Evaluar los resultados de aprendizaje que garanticen la igualdad de oportunidades de ninos del grado de estudio.</h5>
				
				
				</div>
			
		
			<br/>
			<jsp:include page="/resources/include/footer.jsp"></jsp:include>
		</div>
		<jsp:include page="/resources/include/chat.jsp"></jsp:include>
		</div>
	<jsp:include page="/resources/include/footer-resources.jsp"></jsp:include>
		
</body>
</html>