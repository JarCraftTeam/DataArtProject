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
	href="<spring:url value="/resources/css/addTest.css"/>" type="text/css" />
	
	<!-- Scripts -->
	
<script	src="<spring:url value="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"/>"></script>
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
				<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>Exit Admin Panel
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

	<div class="container">	
		<spring:url value="/test/add/saved" var="UrlSave" />
		<form:form id="test-form" action="${UrlSave}" method="post"
			modelAttribute="newTest" enctype="multipart/form-data">
			<div class="formHead">
				<div class="row">
					<div class="col-xs-8 col-sm-8 col-md-6 col-lg-6">
						<label class="testName">
							<span>Name:</span>
							<form:input id="addName" path="name" cssClass="u-full-width form-control" />
						</label>
					</div>
					<div class="activity col-xs-4 col-sm-4 col-md-2 col-lg-2">
					    <form:checkbox id="activity_check" path="priv" />
					    <label for="activity_check">Test on/off</label>
	                </div>
					<div class="date col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<label><span>Start date:</span>
									<form:input id="dateStart" path="date_start" type="text"
									 cssClass="form-control" />
								</label>	
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<label><span>End date:</span>
									<form:input id="dateEnd" path="date_end" type="text"
									 cssClass="u-full-width form-control" />
								 </label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<label>About:</label>
						<form:textarea path="text" cssClass="form-control" rows="5" placeholder="About test"/>
					</div>
				</div>
				<div class="row">
	                <div class="publicity col-xs-6 col-sm-6 col-md-2 col-lg-2">
		                <input id="publicity_check" type="checkbox" />
						<label for="publicity_check">Private</label>
	                </div>
	                <div class="copyLink-btn col-xs-6 col-sm-6 col-md-3 col-lg-3">
	                	<button class="btn __darkblue btn-clipboard" data-clipboard-target="#link" type="button">Copy</button>
		           
	                </div>
	                <div class="link col-xs-12 col-sm-12 col-md-7 col-lg-7">
	                    <p class="">Link</p>
	                    <input id="link" class="form-control" />
	                </div>
	                
	            </div>
            </div>
 			
		<div class="main">
			<div class="question-container">
				<div class="row">
					<div class="question col-xs-12 col-sm-12 col-md-7 col-lg-7">
						<p>Question:</p>
						<div class="del-btn">
							<div class="del-btn-icon-ques" title="Delete question"></div>
						</div>	
						<form:textarea path="questions[0].text" rows="7" class="form-control" placeholder="Question text"/>
					</div>	
					<div class="image-container col-xs-12 col-sm-12 col-md-5 col-lg-5">
						
						<div class="show-img qst col-xs-4 col-sm-4 col-md-8 col-lg-8">
							<img class="img-previewer" src="<spring:url value="../resources/img/no_image.png"/>" alt="No question image">
						</div>
						<div class="add-img col-xs-2 col-sm-2 col-md-4 col-lg-4">	
							<label>
								<div class="add-img-icon" title="add  image"></div>
								<input class="img-loader" name="imageLoaderQst" type="file" style="display: none;">
							</label>
						</div>	
					</div>
				</div>	
				<div class="row">
					<div class="question_type col-xs-6 col-sm-6 col-md-3 col-lg-3">
						<p>Question type:</p>
						<form:select id="addQuestionType1" path="questions[0].type.id"
							cssClass="u-full-width form-control">
							<c:forEach items="${types}" var="qt" varStatus="i">
								<form:option value="${qt.id}">${qt.type}</form:option>
							</c:forEach>
						</form:select>
					</div>	
					<div class="marks col-xs-6 col-sm-6 col-md-4 col-lg-4">
						<p>Mark for the question</p>
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
									<label>correct answer</label>
									<form:input cssClass="form-control" path="questions[0].mark" type="number" value="1"/>
								</div>	
								<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
									<label>incorrect answer</label>
									<input class="form-control" type="number" value="-1"/>
								</div>	
							</div>	
					</div>	
				</div>
				<div class="answer-container">
					<div class="row">
						<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">
			                <form:checkbox  id="1" path="questions[0].answers[0].right"/>
			                <label for="1"></label>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<form:input id="answerText" path="questions[0].answers[0].text"
								placeholder="Answer text" cssClass="u-full-width form-control" />
						</div>		
						<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">
							<img class="img-previewer" src="<spring:url value="../resources/img/no_image.png"/>" alt="No answer image">
						</div>
						<div class="add-img col-xs-2 col-sm-2 col-md-2 col-lg-2">	
							<label>
								<div class="add-img-icon" title="add  image"></div>
								<input class="img-loader" name="imageLoaderQst" type="file" style="display: none;">
							</label>
						</div>	
						
						 <div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">
							<div class="del-btn-icon-answer" title="Delete answer"></div>
						</div>	
					</div>
					
					</div>
					<a class="btn __darkblue add-answer add-answer-beginner">Add Answer</a>
			</div>
		</div>	
			<button class="btn __darkblue button-primary" type="submit">Save Test!</button>
			<a class="btn __darkblue add-question">Add Question</a>

		</form:form>
	</div>
	<script>
    	new Clipboard('.btn-clipboard'); // Для копирования ссылки
	</script>
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
<script src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script src="<spring:url value="/resources/js/imagePreview.js"/>"></script>
</body>
</html>