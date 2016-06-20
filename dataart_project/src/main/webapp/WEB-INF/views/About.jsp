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
			<div class="admin-panel">
				<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span><a href="admin/">Go Admin Panel</a>
			</div>
			<div class="main-nav">
				<ul>
					<li><a href="/">Test List</a></li>
					<li class="active"><a href="#">About Us</a></li>
				</ul>
			</div>
		</div>
	</div>
<!-- /HEADER -->
<!-- LISTING STARTS HERE -->
<div id="main">
	<div class="global-container">
		<div class="row wrapper">
			<h2>About us:</h2>
				<h4>Hello! We are happy to see you here, dear friend!
				You may wonder what this site is about? Let us tell you!<br/>
				This cozy place is made so everyone can enroll for a free "Vitaliy Lacour" IT courses!<br/>
				Because courses are FREE everyone needs to pass the test first. Sorry, places are limited :)<br/><br/><br/>
				<center>So good luck and may the force be with you!</center> 
				</h4>
				
			<p> Hey! Don't be afraid, it's easy to take the test! Just choose the one you need on the "Test List" page, fill the ankete and answer questions! As easy as that!
			Just don't forget to push "Submit" :)</p>
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