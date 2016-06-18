<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Test</title>

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
		href="<spring:url value="/resources/css/font-awesome.min.css"/>"
		type="text/css" />
<link rel="stylesheet"
	href="<spring:url value="/resources/css/addTest.css"/>" type="text/css" />
	
	<!-- Scripts -->
	
<script	src="<spring:url value="https://cdn.rawgit.com/zenorocha/clipboard.js/master/dist/clipboard.min.js"/>"></script>
<script src="<spring:url value="/resources/js/helper.js"/>"></script>
<script src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
<script src="<spring:url value="/resources/js/dynamicAnswersChangeTest.js"/>"></script>
	
</head>

<body>
<jsp:include page="headerNonActive.jsp"></jsp:include>

	<div class="container">	
	<br>
	<div class="alert alert-warning">
  		<h5><strong>Warning!</strong> Saving changes on this page will eventually delete all results.</h5>
	</div>
		<spring:url value="/admin/updated" var="UrlSave" />
		<form:form id="test-form" action="${UrlSave}" method="post"
			modelAttribute="test" enctype="multipart/form-data">
			<div class="formHead">
				<div class="row">
					<div class="col-xs-8 col-sm-8 col-md-6 col-lg-6">
						<label class="testName">
							<span>Name:</span>
							<form:input path="id" type="hidden"/>
							<form:input id="addName" path="name" cssClass="u-full-width form-control" />
						</label>
					</div>
					<div class="activity col-xs-4 col-sm-4 col-md-2 col-lg-2">
					    <!--<form:checkbox id="activity_check" path="priv" />
					    <label for="activity_check">Test on/off</label>-->
	                </div>
					<div class="date col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<fmt:formatDate value='${test.date_start}' pattern='dd/MM/yyyy' var="dateStartFormatted" />
								<label><span>Start date:</span>
									<form:input id="dateStart" path="date_start" type="text"
									 cssClass="form-control" value="${dateStartFormatted}"/>
								</label>	
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<fmt:formatDate value='${test.date_end}' pattern='dd/MM/yyyy' var="dateEndFormatted" />
								<label><span>End date:</span>
									<form:input id="dateEnd" path="date_end" type="text"
									 cssClass="u-full-width form-control" value="${dateEndFormatted}"/>
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
		                <form:checkbox id="publicity_check" path="priv" />
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
			<c:forEach items="${test.questions}" var="question" varStatus="i">
			<div class="question-container">
			<input class="question-number" type="hidden" value="${i.index}">
				<div class="row">
					<div class="question col-xs-12 col-sm-12 col-md-7 col-lg-7">
						<p>#${i.count} Question:
						<c:if test="${i.index > 0}"><div class="del-btn">
    					<div class="del-btn-icon-ques" title="Delete question">
						<a type="button" class="btn btn-danger btn-sm">
    					<span class="glyphicon glyphicon-minus"></span>
    					</a>
						</div>
						</div>
						</c:if>
						</p>
						<form:textarea path="questions[${i.index}].text" rows="7" class="form-control" placeholder="Question text"/>
					</div>	
					<div class="image-container col-xs-12 col-sm-12 col-md-5 col-lg-5">
						
						<div class="show-img qst col-xs-4 col-sm-4 col-md-8 col-lg-8">
							<c:choose>
							  <c:when test="${question.encryptedImage == 'null'}">
							    <img class="img-previewer" src="<spring:url value="../../resources/img/no_image.png"/>" alt="No question image">
							  </c:when>
							  <c:otherwise>
							  	<img class="img-previewer" src="data:image/jpeg;base64,${question.encryptedImage}" alt="No question image">
							  </c:otherwise>
							</c:choose>
						</div>
						<div class="add-img col-xs-2 col-sm-2 col-md-4 col-lg-4">	
							<label>
								<a type="button" class="btn __darkblue btn-lg">
  									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</a>
								<input class="img-loader" name="imageLoaderQst" type="file" style="display: none;">
							</label>
						</div>	
					</div>
				</div>	
				<div class="row">
					<div class="question_type col-xs-6 col-sm-6 col-md-3 col-lg-3">
						<p>Question type:</p>
						<form:select id="addQuestionType1" path="questions[${i.index}].type.id"
							cssClass="u-full-width form-control question-type">
							<c:forEach items="${types}" var="qt" varStatus="f">
								<form:option value="${qt.id}">${qt.type}</form:option>
							</c:forEach>
						</form:select>
					</div>	
					<div class="marks col-xs-6 col-sm-6 col-md-4 col-lg-4">
						<p>Mark for the question</p>
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
									<label>correct answer</label>
									<form:input class="form-control" path="questions[${i.index}].mark" type="number"/>
								</div>	
								<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
									<label>incorrect answer</label>
									<input class="form-control" type="number" value="-1"/>
								</div>	
							</div>	
					</div>	
				</div>
				<div class="answer-container">
				<c:forEach items="${question.answers}" var="answer" varStatus="j">
					<div class="row">
						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
			                <h4>#${j.count}</h4>
						</div>
						<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">
			                <form:checkbox  id="${i.count}+${j.count}" path="questions[${i.index}].answers[${j.index}].right"/>
			                <label for="${i.count}+${j.count}"></label>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<form:input id="answerText" path="questions[${i.index}].answers[${j.index}].text"
								placeholder="Answer text" cssClass="u-full-width form-control" />
						</div>		
						<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">
							<c:choose>
							  <c:when test="${answer.encryptedImage == 'null'}">
							    <img class="img-previewer" src="<spring:url value="../../resources/img/no_image.png"/>" alt="No answer image">
							  </c:when>
							  <c:otherwise>
							    <img class="img-previewer" src="data:image/jpeg;base64,${answer.encryptedImage}" alt="No answer image">
							  </c:otherwise>
							</c:choose>
						</div>
						<div class="add-img col-xs-1 col-sm-1 col-md-1 col-lg-1">	
							<label>
								<a type="button" class="btn __darkblue btn-lg">
  									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</a>
								<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;">
							</label>
						</div>	
						
						 <div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">
							<div class="del-btn-icon-answer" title="Delete answer">
							<a type="button" class="btn btn-danger btn-lg">
  								<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
							</a>
							</div>
						</div>	
					</div>
					</c:forEach>
					
					</div>
					<a class="btn __darkblue add-answer add-answer-beginner">Add Answer</a>
			</div>
			</c:forEach>
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
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment-with-locales.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#dateStart").datetimepicker({format: 'DD/MM/YYYY'});
		$("#dateEnd").datetimepicker({format: 'DD/MM/YYYY'});
	});
	</script>
</body>
</html>