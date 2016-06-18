<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>List of tests</title>

	<!-- Styles -->
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
					<li><a href="/dataart_project/">Home</a></li>
					<li class="active"><a href="/dataart_project/test/">Test List</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- LISTING STARTS HERE -->
	<div id="main">
		<div class="test-container">
			<div class="row align-center">
				<h2>Test list:</h2>
			</div>
			<div class="row align-center __drop">
	
				<a id="add-btn" class="btn __darkblue"
					href="<spring:url value="/test/add"/>"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new Test</a> 
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
					<c:forEach items="${tests}" var="test" varStatus="i">
						<tr>
							
							<td class="test-numb"><h5>${i.count}</h5></td>
							<td class="test-name"><a href="<spring:url value="/test/view/${test.id}"/>" class="fcolor-orange"><h5>${test.name}</h5></a></td>
							<td class="test-about">${test.text}
								<div class="controls">
									<a id="cha-btn" href="update/${test.id}"><span class="glyphicon glyphicon-pencil fcolor-darkblue" aria-hidden="true"></span></a> 
									<a id="del-btn" href="delete/${test.id}"><span class="glyphicon glyphicon-remove fcolor-orange" aria-hidden="true"></span></a>
								</div>
							</td>
							<td class="row"><a id="add-btn" class="btn btn-primary"
				            			href="<spring:url value="/test/check/${test.id}"/>" style="margin-right:5px;">Check</a></td>
							<td class="row"><a id="add-btn" class="btn btn-primary"
				            			href="<spring:url value="/test/results/${test.id}"/>">Results</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
<script>
$(document).ready(function(){
	$("#logout").click(function(e){
		e.preventDefault();
		$("#logout-form").submit();
	});
});
</script>	

</body>
</html>