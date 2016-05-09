<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
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
</head>
<body>
	<div class="test-container">
		<div class="row">
			<h2>Test list:</h2>
		</div>
		<div class="row">
			<a id="add-btn" class="button button-primary"
				href="<spring:url value="/test/add"/>">Add new Test</a> <a
				id="cha-btn" class="button button-primary" href="#">Update Test</a>
			<a id="del-btn" class="button button-primary" href="#">Delete
				Test</a>
		</div>


		<table class="test-table">
			<thead>
				<tr>
					<th></th>
					<th>N</th>
					<th>Name</th>
					<th>About</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tests}" var="test" varStatus="i">
					<tr>
						<td><input type="radio" /></td>
						<td class="test-numb"><h5>${i.count}</h5></td>
						<td class="test-name"><a href="<spring:url value="/test/${test.id}"/>"><h5>${test.name}</h5></a></td>
						<td class="test-about">${test.text}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>