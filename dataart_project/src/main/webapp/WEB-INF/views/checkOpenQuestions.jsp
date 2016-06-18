<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>

    <link href="//fonts.googleapis.com/css?family=Raleway:400,300,600"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet"
          href="<spring:url value="/resources/css/normalize.css"/>"
          type="text/css"/>
    <link rel="stylesheet"
          href="<spring:url value="/resources/css/skeleton.css"/>"
          type="text/css"/>
    <link rel="stylesheet"
          href="<spring:url value="/resources/css/addTest.css"/>" type="text/css"/>
</head>
<body>

<h1>Fill the form, please</h1>

<spring:url value="/test/saveCheckResult" var="UrlSave"/>
<form:form id="check-form" action="${UrlSave}" method="post"
           modelAttribute="testUserAnswer" enctype="multipart/form-data">

    <div class="main-container">
        <h2>Choose the correct answers:</h2>

        <c:forEach items="${testUserAnswer.userAnswers}" var="userAnswer" varStatus="i">
            <%--saving Data for return--%>
            <div style="display:none" class="row">
                <form:input id="userAnswer.id" path="userAnswers[${i.index}].id" cssClass="u-full-width"
                            placeholder="ID"/>
                <form:input id="userAnswer.questionId" path="userAnswers[${i.index}].questionId" cssClass="u-full-width"
                            placeholder="questionId"/>
                <form:input id="userAnswer.UserTestId" path="userAnswers[${i.index}].UserTestId" cssClass="u-full-width"
                            placeholder="UserTestId"/>
                <form:input id="userAnswer.answerText" path="userAnswers[${i.index}].answerText" cssClass="u-full-width"
                            placeholder="answerText"/>
                <form:input id="userAnswer.openQuestionText" path="userAnswers[${i.index}].openQuestionText"
                            cssClass="u-full-width" placeholder="answerText"/>
                <form:input id="userAnswer.maxMark" path="userAnswers[${i.index}].maxMark" cssClass="u-full-width"
                            placeholder="answerText"/>
            </div>


            <label>Question text:</label>
            ${userAnswer.openQuestionText}
            <div class="row">
                <div class="six columns">
                    <label>User Answer text:</label>
                    <li>${userAnswer.answerText}</li>
                </div>
            </div>

            <div class="row">
                <div class="six columns">
                    <label>Answer mark:</label>

                    <p>Max Mark & Mark for the question</p>

                    <input class="form-control" name="userAnswer.maxMark" type="number" title="Max Mark"
                           readonly="true"
                           value="${userAnswer.maxMark}"/>
                    <form:input path="userAnswers[${i.index}].mark" title="Mark" value="0"/>

                </div>
            </div>
        </c:forEach>
    </div>


    <button class="button button-primary" type="submit">Save answers!</button>

</form:form>
</div>
<script src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
<script src="<spring:url value="/resources/js/dynamicAnswers.js"/>"></script>
</div>
</div>
</body>
</html>