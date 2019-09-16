<%@page import="practicas.common.action.SessionParameters"%>
<%@page import="practicas.common.bean.Usuario"%>
<%@page import="practicas.common.bean.Persona"%>
<%
	Usuario oUsuario = (Usuario) request.getSession(false).getAttribute(SessionParameters.USUARIO.text());
	Persona oPersona =  oUsuario.getPersona();
	
	
%>

<div class="sidebar-menu">

	<div class="sidebar-menu-inner">

		<header class="logo-env">
			<!-- logo -->
			<div class="logo">
				<a href="<%=request.getServletContext().getContextPath()%>/welcome.jsp">
						<img src="<%=request.getContextPath()%>/resources/assets/images/home.png" alt="">
				</a>
			</div>
			<!--  -->
			<!-- logo collapse icon -->
			<div class="sidebar-collapse">
				<a href="#" class="sidebar-collapse-icon"> <!-- add class "with-animation" if you want sidebar to have animation during expanding/collapsing transition -->
					<i class="entypo-menu"></i>
				</a>
			</div>
			<!-- open/close menu icon (do not remove if you want to enable menu on mobile devices) -->
			<div class="sidebar-mobile-menu visible-xs">
				<a href="#" class="with-animation"> <!-- add class "with-animation" to support animation -->
					<i class="entypo-menu"></i>
				</a>
			</div>
		</header>

		<div class="sidebar-user-info">
			<div class="sui-hover inline-links animate-in">
				<a href="correo.html"> <i class="entypo-mail"></i> Correo
				</a> <a href="login?f=logout""> <i class="entypo-lock"></i> Salir
				</a> <span class="close-sui-popup">&times;</span>
				<!-- this is mandatory -->
			</div>
		</div>
		
		<ul id="main-menu" class="main-menu">
			<li><a href="<%=request.getContextPath()%>/welcome.jsp"><i class=""></i><span class="title">INICIO</span></a></li>
			<jsp:include page="/resources/include/menu/Administrador.jsp"></jsp:include>
			<jsp:include page="/resources/include/menu/Alumno.jsp"></jsp:include>
			<jsp:include page="/resources/include/menu/Docente.jsp"></jsp:include>
			<li><a href="mantenimiento.jsp"> <i class="entypo-folder"></i><span class="title">AYUDA</span></a>
				
				<ul>
				<li><a href="<%=request.getContextPath()%>/EnviarMensaje.jsp"> <i
				class=""></i><span class="title"> Enviar Correo</span></a></li>
				</ul>
			</li>
							
		</ul>
	</div>
	
</div>
<!-- Inicio Modal -->
		
		<!-- Fin Modal -->