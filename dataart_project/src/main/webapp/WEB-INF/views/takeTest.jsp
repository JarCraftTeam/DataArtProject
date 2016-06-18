<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Taking Test</title>

	<!-- Styles -->
	
	<link rel="stylesheet"
		href="<spring:url value="/resources/css/bootstrap.min.css"/>"
		type="text/css" />
	<link rel="stylesheet"
		href="<spring:url value="/resources/css/bootstrap-theme.css"/>"
		type="text/css" />
	<link rel="stylesheet"
		href="<spring:url value="/resources/css/takeTest.css"/>" type="text/css" />

	<!-- Scripts -->
	
	<script 
		src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<!--  <script 
		src="<spring:url value="/resources/js/helper.js"/>"></script>-->
		
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
			<div class="main-nav">
				<ul>
					<li ><a href="/dataart_project/">Test List</a></li>
					<li><a href="#">About Us</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /HEADER -->
	
	<div class="container">
	
	 <spring:url value="/take/saveAnswers/" var="UrlSave"/>
	 <form:form id="user-form" action="${UrlSave}" method="post"
           modelAttribute="userTest">
	<form:input type="hidden" id="testTakeId" path="test.id" cssClass="u-full-width"
					placeholder="ID" />
     <h1>${userTest.test.name}</h1>
	 <p class="test-info">
	 ${userTest.test.text}
	 </p>
      	<fieldset class="contacts">
	        <legend>Personal information</legend>
	        <div class="row">
 			 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		        <label for="inputFirstName">First Name</label>
		        <form:input path="user.first_name" type="text" id="inputFirstName" cssClass="form-control" placeholder="Name"/>
		     </div>
		     <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		        <label for="inputLastName">Last Name</label>
		        <form:input path="user.second_name" type="text" id="inputPhone" cssClass="form-control" placeholder="Last Name" />
	       	 </div>
	        </div>
	        <div class="row">
 			 	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			        <label for="inputPhone">Phone</label>
			        <form:input path="user.telephone" type="text" id="inputLastName" cssClass="form-control" placeholder="+38 xxx xxx xx xx"/>
		        </div>
		        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			        <label for="inputEmail">Email address</label>
			        <form:input path="user.email" type="email" id="inputEmail" cssClass="form-control" placeholder="Email address" />
			    </div>
		    </div>
        </fieldset>
        <fieldset class="test">
        <legend>Answer the questions</legend>
        <c:forEach items="${userTest.test.questions}" var="question" varStatus="i">
	        <div class="question" id="ques">
				<p><span># ${i.count}</span> ${question.text}</p>
				<c:if test="${question.encryptedImage != 'null'}">
					<img class="que" src="data:image/jpeg;base64,${question.encryptedImage}" alt="No question image">
				</c:if>
	        	<c:choose>
	        	<c:when test="${question.type.id==1}">
	        		<ul>
	        		<c:forEach items="${question.answers}" var="answer" varStatus="j">
	        			<li>
	        				<form:radiobutton path="test.questions[${i.index}].userAnswers" id="ans${i.count}-${j.count}" cssClass="radio-ans" 
	        				value="${answer.id}"/>
			        		<label for="ans${i.count}-${j.count}">${answer.text}</label>
			        		<c:if test="${answer.encryptedImage != 'null'}">
								<img class="ans" src="data:image/jpeg;base64,${answer.encryptedImage}" alt="No question image">
							</c:if>
	        			</li>
	        		</c:forEach>
	        		</ul>
	        	</c:when>
	        	<c:when test="${question.type.id==2}">
	        		<ul>
	        		<c:forEach items="${question.answers}" var="answer" varStatus="j">
	        			<li>
	        				<form:checkbox path="test.questions[${i.index}].userAnswers" id="ans${i.count}-${j.count}" cssClass="checkbox-ans" 
	        				value="${answer.id}"/>
			        		<label for="ans${i.count}-${j.count}">${answer.text}</label>
			        		<c:if test="${answer.encryptedImage != 'null'}">
								<img class="ans" src="data:image/jpeg;base64,${answer.encryptedImage}" alt="No question image">
							</c:if>
	        			</li>
	        		</c:forEach>
	        		</ul>
	        	</c:when>
	        	<c:when test="${question.type.id==3}">
	        		<form:textarea path="test.questions[${i.index}].userAnswers" itemValue="id" type="text"
	        		 cssClass="form-control" placeholder="Enter your answer"/>
	        	</c:when>
	        	</c:choose>
	        	</div>
	        </c:forEach>
        </fieldset>
        <button class="btn __darkblue btn-lg" type="submit">Submit</button>
     </form:form>

    </div>
    
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
	

</body>
</html>