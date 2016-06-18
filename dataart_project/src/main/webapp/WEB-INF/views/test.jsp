<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Panel</title>

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
	<script 
		src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
		
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
					<li><a href="/dataart_project/">Go User</a></li>
					<li class="active"><a href="/dataart_project/admin/">Test List</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- LISTING STARTS HERE -->
	<div id="main">
		<div class="test-container">
		<c:if test="${param.nothing != null}">
        	<div class="row">
        	<div class="alert alert-info text-center">
		  		<h5>There is nothing to check!</h5>
			</div>
			</div>
        </c:if>
			<div class="row align-center">
				<h2>Test list:</h2>
			</div>
			<div class="row align-center __drop">
	
				<a id="add-btn" class="btn __darkblue"
					href="<spring:url value="/admin/add"/>"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new Test</a> 
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
									<a id="del-btn" class="del-btn" href="#"><i id="${test.id}"></i><span class="glyphicon glyphicon-remove fcolor-orange" aria-hidden="true"></span></a>
								</div>
							</td>
							<td class="row"><a id="add-btn" class="btn __darkblue"
				            			href="<spring:url value="/admin/check/${test.id}"/>" style="margin-right:5px;">Check</a></td>
							<td class="row"><a id="add-btn" class="btn __darkblue"
				            			href="<spring:url value="/admin/results/${test.id}"/>">Results</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
		
<div class="modal fade" id="delete-test-dialog" tabindex="-1"
	role="dialog" aria-labelledby="edit" aria-hidden="true">
	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align">Delete Test</h4>
				</div>
				<div class="modal-body">
					<div class="alert alert-danger">
						<h5><span class="glyphicon glyphicon-warning-sign"></span> Are you
						sure you want to delete this test? All results will be lost.</h5>
					</div>

				</div>
				<div class="modal-footer">
					<a id="delTestYes" href="#" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span>Yes
					</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>No
					</button>
				</div>
			</div>
	</div>
</div>
	
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
	

	
	
<script>
$(document).ready(function(){
	$(".del-btn").click(function(e){
		e.preventDefault();
		var id=$(this).children("i").attr("id");
		$("#delete-test-dialog").modal('show');
		$("#delTestYes").attr("href","delete/"+id);
	});
	$("#logout").click(function(e){
		e.preventDefault();
		$("#logout-form").submit();
	});
});
</script>	

</body>
</html>