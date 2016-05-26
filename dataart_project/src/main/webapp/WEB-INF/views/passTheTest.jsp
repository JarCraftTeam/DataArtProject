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

<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/normalize.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/skeleton.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/addTest.css"/>" type="text/css" />
</head>
<body>

	<h1>Fill the form, please</h1>
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
	
	<div class="main-container">
		<h2>Choose the correct answers:</h2>

		<spring:url value="/test/add/changed" var="UrlSave" />
		<form:form id="test-form" action="${UrlSave}" method="post"
			modelAttribute="testForPass">
			<h3>Test info:</h3>
			
			<div style="display:none" class="row">
				<label>Id</label>
				<form:input id="testIdJsp" path="id" cssClass="u-full-width"
					placeholder="ID" />
			</div>
			
			<div class="row">
				<label>Name:</label>
				<form:input id="addName" path="name" cssClass="u-full-width"
					placeholder="Name" />
			</div>

			<div class="row">
				<label>About:</label>
				<form:textarea id="addText" path="text" cssClass="u-full-width"
					placeholder="About" />
			</div>

			<div style="display:none" class="row">
				<div class="six columns">
					<label>Start date:</label>
					<form:input id="dateStart" path="date_start"
						placeholder="Start Date" cssClass="u-full-width" />
				</div>
				<div class="six columns">
					<label>End date:</label>
					<form:input id="dateEnd" path="date_end" placeholder="End Date"
						cssClass="u-full-width" />
				</div>
			</div>

			<div style="display:none" class="row">
				<label>General Mark:</label>
				<form:input id="testMark" path="mark" placeholder="Total Test mark" />
			</div>

			<div style="display:none" class="row">
				<form:checkbox id="testPrivate" path="priv" />
				<span><Strong>Private</Strong></span>
			</div>


			<div class="question-container">
				<h5>
					<strong>#1</strong>
				</h5>
				<div class="row">
					<div class="six columns">
						<h4>Question info:</h4>
						<div class="row">
							<div class="six columns">
								<label>Question type:</label>
								<form:select id="addQuestionType1" path="questions[0].type.id"
									cssClass="u-full-width">
									<c:forEach items="${types}" var="qt" varStatus="i">
										<form:option value="${qt.id}">${qt.type}</form:option>
									</c:forEach>
								</form:select>
							</div>
							<div style="display:none" class="six columns">
								<label>Question price:</label>
								<form:input id="addQuestionMark1" path="questions[0].mark"
									placeholder="Question mark"/>
							</div>

							<div class="row">
								<label>Question text:</label>
								<form:textarea id="addQuestionText1" path="questions[0].text"
									cssClass="u-full-width" placeholder="Question text" />
							</div>
						</div>
					</div>

					<div class="six columns">
	
						<div class="answer-container">
							<div class="row">
								<label>#1</label> <label>Answer Text:</label>
								<form:input id="answerText" path="questions[0].answers[0].text"
									placeholder="Answer text" cssClass="u-full-width" />
							</div>

							<div style="display:none" class="row">
								<form:checkbox id="answerRight"
									path="questions[0].answers[0].right" />
								<span><Strong>Right</Strong></span>
							</div>
						</div>

					</div>


				</div>
			</div>

			<button class="button button-primary" type="submit">Save my answers!</button>
			</form:form>

	</div>
	<script src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script src="<spring:url value="/resources/js/dynamicAnswers.js"/>"></script>
	
</body>
</html>