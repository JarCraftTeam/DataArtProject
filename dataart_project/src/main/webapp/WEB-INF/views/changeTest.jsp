<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change test</title>

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
	href="<spring:url value="/resources/css/"/>" type="text/css" />
	
	<!-- Scripts -->
	<script src="<spring:url value="/resources/js/helper.js"/>"></script>
	<script src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script src="<spring:url value="/resources/js/dynamicAnswers.js"/>"></script>
		
</head>
<body>
<!-- HEADER -->
	<div id="header">
		<div class="wrapper">
			<!-- <img src="/resources/img/logo.png" alt="" /> -->
			<h1 class="fcolor-sky">IT School</h1>
			<div class="admin-panel">
				<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>Admin Panel
			</div>
			<div class="main-nav">
				<ul>
					<li><a href="#">Home</a></li>
					<li ><a href="#">Test List</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</div>
<!-- /HEADER -->

<div class="test-container">
	<div class="main-container">
		<h2>Change Test:</h2>

		<spring:url value="/test/add/changed" var="UrlSave" />
		<form:form id="test-form" action="${UrlSave}" method="post"
			modelAttribute="test">
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

			<div class="row">
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

			<div class="row">
				<label>General Mark:</label>
				<form:input id="testMark" path="mark" placeholder="Total Test mark" />
			</div>

			<div class="row">
				<form:checkbox id="testPrivate" path="priv" />
				<span><Strong>Private</Strong></span>
			</div>



			<h3>
				Questions: <a class="button add-question">Add Question</a>
			</h3>
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
							<div class="six columns">
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
						<h4>
							Answers info: <a class="button add-answer">Add Answer</a>
						</h4>
						<div class="answer-container">
							<div class="row">
								<label>#1</label> <label>Answer Text:</label>
								<form:input id="answerText" path="questions[0].answers[0].text"
									placeholder="Answer text" cssClass="u-full-width" />
							</div>

							<div class="row">
								<form:checkbox id="answerRight"
									path="questions[0].answers[0].right" />
								<span><Strong>Right</Strong></span>
							</div>
						</div>

					</div>


				</div>
			</div>

			<button class="button button-primary" type="submit">Update Test!</button>
			</form:form>
			
			
			
		<spring:url value="/test/delete" var="UrlSave" />
		<form:form id="test-form" action="${UrlSave}" method="get" modelAttribute="test">
			<h3></h3>
			
			<div style="display:none" class="row">
				<label>Id</label>
				<form:input id="testIdJsp" path="id" cssClass="u-full-width"
					placeholder="ID" />
			</div>
			
			<div style="display:none" class="row">
				<label>Name:</label>
				<form:input id="addName" path="name" cssClass="u-full-width"
					placeholder="Name" />
			</div>

			<div style="display:none" class="row">
				<label>About:</label>
				<form:textarea id="addText" path="text" cssClass="u-full-width"
					placeholder="About" />
			</div>

			<div class="row">
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


			<div style="display:none" class="question-container">
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
							<div class="six columns">
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

					<div style="display:none" class="six columns">

						<div class="answer-container">
							<div class="row">
								<label>#1</label> <label>Answer Text:</label>
								<form:input id="answerText" path="questions[0].answers[0].text"
									placeholder="Answer text" cssClass="u-full-width" />
							</div>

							<div class="row">
								<form:checkbox id="answerRight"
									path="questions[0].answers[0].right" />
								<span><Strong>Right</Strong></span>
							</div>
						</div>

					</div>


				</div>
			</div>

			<button class="button button-primary" type="submit">Delete Test!</button>
		</form:form>

	</div>
</div>

	<footer class="footer">
			<div class="wrapper">
				<p>Copyright: JarCraft 2016</p>
			</div>
	</footer>
</body>
</html>