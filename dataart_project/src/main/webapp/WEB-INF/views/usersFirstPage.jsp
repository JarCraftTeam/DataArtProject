<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JarCraft Project</title>

<!-- STYLES -->
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
					<li class="active"><a href="#">Test List</a></li>
					<li><a href="about/">About Us</a></li>
				</ul>
			</div>
		</div>
	</div>
<!-- /HEADER -->
<!-- LISTING STARTS HERE -->
<div id="main">
	<div class="global-container">
		<div class="row">
			<h2>Test list:</h2>
		</div>
		<jsp:useBean id="now" class="java.util.Date"/>
		<table class="test-table-client">
			<thead>
				<tr>
					<th>N</th>
					<th>Name</th>
					<th>About</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${openTests}" var="test" varStatus="i">
					<tr>
						<td class="test-numb"><h4>${i.count}</h4></td>
						<td class="test-name"><h4 style="color:#F26101">${test.name}</h4></td>
						<td class="test-about">${test.text}</td>
						<fmt:formatDate value='${test.date_start}' pattern='dd/MM/yyyy' var="dateStartFormatted" />
						<td class="test-start"><h4>${dateStartFormatted}</h4></td>
						<fmt:formatDate value='${test.date_end}' pattern='dd/MM/yyyy' var="dateEndFormatted" />
						<td class="test-end"><h4>${dateEndFormatted}</h4></td>
						<td class="test-action">
						<c:choose>
						<c:when test="${now < test.date_start}">
					       Will be opened soon.
					    </c:when>
					    <c:when test="${now > test.date_end}">
					        Is now closed.
					    </c:when>
					    <c:otherwise>
					     <a id="add-btn" class="btn __darkblue"
				            href="<spring:url value="/take/${test.id}"/>">Take the test</a>
					    </c:otherwise>
					    </c:choose>
						</td>
						
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