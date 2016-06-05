<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List of tests</title>
<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/normalize.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/skeleton.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/test.css"/>" type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/font-awesome.min.css"/>" type="text/css" />
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
			<h1>IT School</h1>
			<h2>
				<small>User Panel</small>
			</h2>
			<div class="main-nav">
				<ul>
					<li><a href="#">Home</a></li>
					<li class="active"><a href="#">Test List</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</div>
<!-- /HEADER -->
<!-- LISTING STARTS HERE -->
<div id="main">
	<div class="test-container">
		<div class="row">
			<h2>Test list:</h2>
		</div>

		<table class="test-table">
			<thead>
				<tr>
					<th>N</th>
					<th>Name</th>
					<th>About</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${openTests}" var="test" varStatus="i">
					<tr>
						
						<td class="test-numb"><h5>${i.count}</h5></td>
						<td class="test-name"><a href="<spring:url value="/test/view/${test.id}"/>"><h5>${test.name}</h5></a></td>
						<td class="test-about">${test.text}</td>
						<td class="row"><a id="add-btn" class="button button-primary"
				            href="<spring:url value="/UserTest/take/${test.id}"/>">Take the test</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

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