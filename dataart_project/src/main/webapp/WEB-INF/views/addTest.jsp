<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new test</title>
<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/normalize.css"/>"
	type="text/css" />
<!-- <link rel="stylesheet"
	href="<spring:url value="/resources/css/skeleton.css"/>"
	type="text/css" />-->
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/bootstrap-theme.min.css"/>"
	type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/addTest.css"/>" type="text/css" />
<script	src="<spring:url value="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"/>"></script>
</head>
<body>
	
	<div class="container-fluid">	
		<h1>Add new Test:</h1>
		<spring:url value="/test/add/saved" var="UrlSave" />
		<form:form id="test-form" action="${UrlSave}" method="post"
			modelAttribute="newTest" enctype="multipart/form-data">
			<div class="formHead">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<label class="testName">
							<span>Name:</span>
							<form:input id="addName" path="name" cssClass="u-full-width" />
						</label>
					</div>
					<div class="activity col-xs-1 col-sm-1 col-md-1 col-lg-1 col-xs-offset-2 col-md-offset-2 col-sm-offset-2 col-lg-offset-2">
					    <label for="activity_check">Test on/off</label>
					    <form:checkbox id="activity_check" path="priv" />
	                </div>
					<div class="date col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<label><span>Start date:</span>
									<form:input id="dateStart" path="date_start" type="text"
									 cssClass="" />
								</label>	
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<label><span>End date:</span>
									<form:input id="dateEnd" path="date_end" type="text"
									 cssClass="u-full-width" />
								 </label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<label>About:</label>
				<form:textarea path="text" rows="5" placeholder="About test"/>
				</div>
				</div>
				<div class="row">
	                <div class="publicity bulged-in col-xs-6 col-sm-6 col-md-2 col-lg-2">
		                <input id="publicity_check" type="checkbox" />
						<label for="publicity_check">Private</label>
	                </div>
	                <div class="copyLink-btn col-xs-6 col-sm-6 col-md-3 col-lg-3">
		                <a class="bulged-in btn-clipboard" data-clipboard-target="#link">
		                    Copy link</a>
	                </div>
	                <div class="link col-xs-12 col-sm-12 col-md-7 col-lg-7">
	                    <p class="bulged-in">Link</p>
	                    <input id="link"/>
	                </div>
	                
	            </div>
            </div>
 			
		<div class="main">
			<div class="question-container">
				<div class="row">
					<div class="question col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<p>Question:</p>
						<form:textarea path="questions[0].text" rows="7" placeholder="Question text"/>
					</div>	
					<div class="image-container col-xs-4 col-sm-4 col-md-4 col-lg-4">
					<div class="add-img col-xs-4 col-sm-4 col-md-4 col-lg-4">	
						<span>Add image</span>
						<label><img class="add-img-icon" alt="add image" src="<spring:url value="../resources/img/add_img.png"/>"/>
						<input class="img-loader" name="imageLoaderQst" type="file" style="display: none;"></label>
					</div>	
					
					<div class="show-img qst col-xs-8 col-sm-8 col-md-8 col-lg-8">
					<p>Image preview:</p>
					<img class="img-previewer" src="<spring:url value="../resources/img/no_image.png"/>" alt="No question image">
					</div>
					</div>
					<div class="question_type col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<p>Question type:</p>
						<form:select id="addQuestionType1" path="questions[0].type.id"
							cssClass="u-full-width">
							<c:forEach items="${types}" var="qt" varStatus="i">
								<form:option value="${qt.id}">${qt.type}</form:option>
							</c:forEach>
						</form:select>
						<div class="question_mark">
							<p class="bulged-in">Mark for the question</p>
							<div class="row">
								<div class="bulged-in col-xs-6 col-sm-6 col-md-6 col-lg-6">
									<label>correct answer</label>
									<form:input path="questions[0].mark" type="number" />
								</div>	
								<div class="bulged-in col-xs-6 col-sm-6 col-md-6 col-lg-6">
									<label>incorrect answer</label>
									<input type="number" />
								</div>	
							</div>
						</div>
					</div>	
				</div>
				<div class="answer-container">
							<div class="row">
								<div class="bulged-in col-xs-4 col-sm-4 col-md-4 col-lg-4">
									<label>#1</label> <label>Answer Text:</label>
									<form:input id="answerText" path="questions[0].answers[0].text"
										placeholder="Answer text" cssClass="u-full-width" />
								</div>		
								<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
								<div class="add-img col-xs-4 col-sm-4 col-md-4 col-lg-4">	
									<span>Add image</span>
									<label><img class="add-img-icon" alt="add image" src="<spring:url value="../resources/img/add_img.png"/>"/>
									<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;"></label>
								</div>
								<div class="show-img answ col-xs-8 col-sm-8 col-md-8 col-lg-8">
								<img class="img-previewer" src="<spring:url value="../resources/img/no_image.png"/>" alt="No answer image">
								</div>	
								</div>
								<div class="answers bulged-in col-xs-2 col-sm-2 col-md-2 col-lg-2">
					                <form:checkbox  id="1" path="questions[0].answers[0].right" />
									<label for="1">Correct</label>
								</div>
								 <div class="del-btn col-xs-2 col-sm-2 col-md-2 col-lg-2">
									<img class="del-btn-icon-answer" alt="Delete answer" src="<spring:url value="../resources/img/del-btn.png"/>"/>
								</div>	
							</div>
							
							</div>
							<a class="button add-answer add-answer-beginner">Add Answer</a>
			</div>
		</div>	
			<button class="button button-primary" type="submit">Save Test!</button>
			<a class="button add-question">Add Question</a>

		</form:form>
	</div>
	<script>
    	new Clipboard('.btn-clipboard'); // Для копирования ссылки
	</script>
	<script src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script src="<spring:url value="/resources/js/dynamicAnswers.js"/>"></script>
	<script src="<spring:url value="/resources/js/imagePreview.js"/>"></script>
</body>
</html>