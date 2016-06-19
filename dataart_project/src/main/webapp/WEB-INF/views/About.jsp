<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
<link rel="stylesheet"
		href="<spring:url value="/resources/css/bootstrap.min.css"/>"
		type="text/css" />
	<link rel="stylesheet"
		href="<spring:url value="/resources/css/bootstrap-theme.css"/>"
		type="text/css" />
	<link rel="stylesheet"
		href="<spring:url value="/resources/css/test.css"/>" type="text/css" />

	<!-- Scripts -->
	
	<script 
		src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script 
		src="<spring:url value="/resources/js/helper.js"/>"></script>
</head>
<body>
<!-- HEADER -->
	<div id="header">
		<div class="wrapper">
			<!-- <img src="/resources/img/logo.png" alt="" /> -->
			<h1 class="fcolor-sky">IT School</h1>
			<h2 class="fcolor-sky">
				User panel
			</h2>
			<div class="main-nav">
				<ul>
					<li><a href="/dataart_project/">Test List</a></li>
					<li class="active"><a href="#">About Us</a></li>
				</ul>
			</div>
		</div>
	</div>
<!-- /HEADER -->
<!-- LISTING STARTS HERE -->
<div id="main">
	<div class="global-container">
		<div class="row">
			<h2>About us:</h2>
		</div>

		

	</div>
</div>
	<!-- FOOTER -->
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
	<!-- /FOOTER -->
</body>
</html>