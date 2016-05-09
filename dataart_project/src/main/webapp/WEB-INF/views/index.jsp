<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/index.css"/>" type="text/css" />
</head>
<body>
	<table border="1">
		<c:forEach items="${users}" var="user" varStatus="i">
			<tr>
				<td>${user.first_name}</td>
				<td>${user.second_name}</td>
				<td>${user.telephone}</td>
				<td>${user.email}</td>
			</tr>
		</c:forEach>
	</table>

	<h1>Hello World!</h1>
	<spring:url value="/saved" var="UrlSave" />
	<form:form id="user-form" action="${UrlSave}" method="post"
		modelAttribute="newUser">
		<form:input id="addFirstName" path="first_name"
			placeholder="First Name" />
		<form:input id="addSecondName" path="second_name"
			placeholder="Second Name" />
		<form:input id="addTelephone" path="telephone" placeholder="Telephone" />
		<form:input id="addEmail" path="email" placeholder="Email" />
		<button type="submit">Save</button>
	</form:form>
	
	<a href="<spring:url value="/test/"/>">Tests</a>
</body>
</html>