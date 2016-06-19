<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Test Results</title>

	<!-- Styles -->
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
	<script 
		src="<spring:url value="/resources/js/sort.js"/>"></script>	
		
</head>
<body>
	<jsp:include page="headerNonActive.jsp"></jsp:include>
	
	<!-- LISTING STARTS HERE -->
	<div id="main">
		<div class="test-container">
		<h1 class="results">Results for "${test.name}"</h1>
		<a class="btn __darkblue" href="downloadExcel/${test.id}"><span class="glyphicon glyphicon-floppy-disk"></span> Export to Excel</a>
			<table id="results-table" class="results-table table table-striped table-hover">
				<thead>
					<tr>
						<th class="test-numb">N</th>
						<th class="user-info">User first name</th>
						<th class="user-info">User second name</th>
						<th class="user-info">User phone</th>
						<th class="user-info">User e-mail</th>
						<th class="test-numb">Summary mark</th>
						<c:forEach items="${test.questions}" varStatus="status"> 
							<th class="test-numb">Que. ${status.count}</th>
						</c:forEach>
					</tr>
				</thead>
				<tbody class="">
					<c:forEach items="${userTests}" var="userTest" varStatus="i">
						<tr>
							<td>${i.count}</td>
							<td>${userTest.user.first_name}</td>
							<td>${userTest.user.second_name}</td>
							<td>${userTest.user.telephone}</td>
							<td>${userTest.user.email}</td>
							<td>${userTest.mark}</td>
								<c:forEach items="${userTest.userAnswers}" var="eachUserAnswer"> 
								<td>        
									<c:choose>
									<c:when test="${eachUserAnswer.mark == -1}">Not Checked</c:when>
									<c:otherwise>${eachUserAnswer.mark}</c:otherwise>
									</c:choose>
								</td>
								</c:forEach>
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