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
<%--<spring:url value="/saved" var="UrlSave"/>--%>
<spring:url value="/UserTest/saveAnswers/" var="UrlSave"/>
<form:form id="user-form" action="${UrlSave}" method="post"
           modelAttribute="testForTaking">
    <form:input id="addFirstName" path="user.first_name"
                placeholder="First Name"/>
    <form:input id="addSecondName" path="user.second_name"
                placeholder="Second Name"/>
    <form:input id="addTelephone" path="user.telephone" placeholder="Telephone"/>
    <form:input id="addEmail" path="user.email" placeholder="Email"/>
    <%--<button type="submit" hidden="true">Save</button>--%>
<%--</form:form>--%>

<div class="main-container">
    <h2>Choose the correct answers:</h2>


    <%--<form:form id="test-form" action="${UrlSave}" method="post"--%>
               <%--modelAttribute="testForTaking" >--%>
        <h3>Test info:</h3>

        <%--<div style="display:none" class="row">--%>
            <%--<label>General Mark:</label>--%>
            <%--<form:input id="testMark" path="mark" placeholder="Total Test mark"/>--%>
        <%--</div>--%>

        <%--<div style="display:none" class="row">--%>
            <%--<form:checkbox id="testPrivate" path="priv"/>--%>
            <%--<span><Strong>Private</Strong></span>--%>
        <%--</div>--%>


        <div class="question-container">
            <h5>
                <strong>#1</strong>
            </h5>

            <div class="row">
                <div class="six columns">

                    <c:forEach items="${testForTaking.test.questions}" var="question" varStatus="i">
                        <h4>Question info:</h4>

                        <div class="row">
                            <div class="six columns">
                                <label>Question text:</label>
                                <li>${question.text}</li>
                            </div>
                        </div>
                        <%--<c:forEach items="${question.answers}" var="answer" varStatus="j">--%>
                        <c:if test="${question.type.id==1}">
                            <div class="answer-container">
                                <label>Answer text:</label>
                                <form:radiobuttons path="xxx" items="${question.answers}"/>
                                    <%--</c:forEach>--%>
                            </div>
                        </c:if>
                        <c:if test="${question.type.id==2}">
                            <div class="answer-container">
                                <label>Answer text:</label>
                                <form:checkboxes path="xxx" items="${question.answers}"/>
                                    <%--</c:forEach>--%>
                            </div>
                        </c:if>
                        <c:if test="${question.type.id==3}">
                            <div class="answer-container">
                                <label>Answer text:</label>
                                <form:input path="xxx"  type="text"/>
                                    <%--</c:forEach>--%>
                            </div>
                        </c:if>

                    </c:forEach>
                </div>

                    <%--<div class="six columns">--%>
                    <%----%>
                    <%--<div class="answer-container">--%>
                    <%--&lt;%&ndash;<div class="row">&ndash;%&gt;--%>
                    <%--<label>#1</label> <label>Answer Text:</label>--%>
                    <%--<form:input id="answerText" path="questions[0].answers[0].text"--%>
                    <%--placeholder="Answer text" cssClass="u-full-width" />--%>
                    <%--&lt;%&ndash;<c:forEach items="${testForTaking.questions.answers}" var="answer" varStatus="j">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li>${answer.text} - ${answer.right}</li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
                    <%--</div>--%>

                    <%--<div style="display:none" class="row">--%>
                    <%--<form:checkbox id="answerRight"--%>
                    <%--path="questions[0].answers[0].right" />--%>
                    <%--<span><Strong>Right</Strong></span>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <%--</div>--%>


            </div>
        </div>

        <button class="button button-primary" type="submit" >Save my answers!</button>

    </form:form>

</div>
<script src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
<script src="<spring:url value="/resources/js/dynamicAnswers.js"/>"></script>

</body>
</html>