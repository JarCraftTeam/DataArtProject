<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test Update</title>

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
	href="<spring:url value="/resources/css/updateTest.css"/>" type="text/css" />
	
	
<!-- Scripts -->
	
	<script 
		src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script 
		src="<spring:url value="/resources/js/helper.js"/>"></script>
		
</head>
<body>
<jsp:include page="headerNonActive.jsp"></jsp:include>
<div class="test-container">
	<div class="main-container">
		<h2>Test information:</h2>
		<label class="hashtag">#Name</label>
		<label>${test.name}</label>
		<label class="hashtag">#About</label>
		<label>${test.text}</label>
		<label class="hashtag">#Start Date</label>
		<label>${test.date_start}</label>
		<label class="hashtag">#End Date</label>
		<label>${test.date_end}</label>
		<label class="hashtag">#Total Mark</label>
		<label>${test.mark}</label>
		<label class="hashtag">#Is Private</label>
		<label>${test.priv}</label>
		<br>
		<label class="hashtag">#Questions</label>
		<c:forEach items="${test.questions}" var="question" varStatus="i">
		<label>${question.text}</label>
		<ol>
		<c:forEach items="${question.answers}" var="answer" varStatus="j">
		<li>${answer.text} - ${answer.right}</li>
		</c:forEach>
		</ol>
		</c:forEach>
	</div>
</div>

<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
	

</body>
</html>