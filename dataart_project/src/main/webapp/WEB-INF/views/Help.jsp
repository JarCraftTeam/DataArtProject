<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Help</title>

	<!-- Styles -->
		<!-- Styles -->
<link rel="stylesheet"
		href="<spring:url value="/resources/css/normalize.css"/>"
		type="text/css" />
<link rel="stylesheet"
		href="<spring:url value="/resources/fonts/casper.css"/>" type="text/css" />
<link rel="stylesheet"
		href="<spring:url value="/resources/css/bootstrap.min.css"/>"
		type="text/css" />
<link rel="stylesheet"
		href="<spring:url value="/resources/css/bootstrap-theme.css"/>"
		type="text/css" />
	
	<link rel="stylesheet"
		href="<spring:url value="/resources/css/results.css"/>" type="text/css" />

	<!-- Scripts -->
	
	<script 
		src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script 
		src="<spring:url value="/resources/js/helper.js"/>"></script>
		
</head>
<body>
	<div id="header">
		<div class="wrapper">
			<!-- <img src="/resources/img/logo.png" alt="" /> -->
			<h1 class="fcolor-sky">IT School</h1>
			<h2 class="fcolor-sky">
				Admin Panel
			</h2>
			<div class="admin-panel">
				<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
				<a id="logout" href="#">Exit Admin Panel</a>
				<form id="logout-form" action="<c:url value="/logout"/>" method="post">
					<sec:csrfInput/>
				</form>
			</div>
			<div class="main-nav">
				<ul>
					<li><a href="/">Go User</a></li>
					<li><a href="/admin/">Test List</a></li>
					<li class="active"><a href="/admin/help">Help</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- LISTING STARTS HERE -->
	<div id="main">
		<div class="global-container">
		<div class="row wrapper">
		<h2>Help</h2>
			<h4>It's a page to help Admins!
			So if you are here it means you're admin and have some questions.
			<ul>Here's some things you may need to know:
			<li>You can create, copy, edit, delete tests and rank some answers. </li>
			<li>You can add pictures to your tests, but an image CANNOT be bigger that 2MB.</li>
			<li>The number six is magic. Just remember that :)</li>
			</ul>
			If you still have some problems and/or questions, feel free to contact us on help@jarcraft.com
			</h4>
		</div>
	</div>
	
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
	

</body>
</html>