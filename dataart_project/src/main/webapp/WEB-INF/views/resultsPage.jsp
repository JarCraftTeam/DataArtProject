<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- LISTING STARTS HERE -->
	<div id="main">
		<div class="test-container">
			<div class="row align-center">
				<h2>Results of the "########" test</h2>
			</div>
	
	
			<table class="test-table">
				<thead>
					<tr>
						<th>N</th>
						<th>User first name</th>
						<th>User second name</th>
						<th>User phone</th>
						<th>User e-mail</th>
						<th>Summary mark</th>
						<th>test1</th>
						<th>test2</th>
						<th>test3</th>
						<th>test4</th>
						<th>test5</th>		
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userTests}" var="userTest" varStatus="i">
						<tr>
							<td class="test-numb"><h5>${i.count}</h5></td>
							<td class="test-about"><h5>${userTest.user.first_name}</h5></td>
							<td class="test-about"><h5>${userTest.user.second_name}</h5></td>
							<td class="test-about"><h5>${userTest.user.telephone}</h5></td>
							<td class="test-about"><h5>${userTest.user.email}</h5></td>
							<td class="test-about"><h5>${userTest.mark}</h5></td>
							
							<td class="test-about">
								<c:forEach items="${userTest.answers}" var="eachUserAnswer">         
									<h5>${eachUserAnswer.answerId}</h5> <%--NEED TO UPDATE TO <h5>${eachUserAnswer.mark}</h5>--%>
								</c:forEach>
							</td>
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
	

</body>
</html>