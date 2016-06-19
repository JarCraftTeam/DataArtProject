<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>List of tests</title>

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
		href="<spring:url value="/resources/css/test.css"/>" type="text/css" />
<link rel="stylesheet"
		href="<spring:url value="/resources/css/magnific-popup.css"/>" type="text/css" />

    
	<!-- Scripts -->
	
<script 
		src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
<script 
		src="<spring:url value="/resources/js/helper.js"/>"></script>
<script 
		src="<spring:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
		
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- LISTING STARTS HERE -->
	<div id="main">
		<div class="global-container">
			<div class="row align-center">
				<h2>Test list:</h2>
			</div>
			<div class="row align-center __drop">
	
				<a id="add-btn" class="btn __darkblue"
					href="<spring:url value="/test/add"/>"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new Test</a> 
			</div>
	
	
			<table class="test-table">
				<thead>
					<tr>
						<th>N</th>
						<th>Name</th>
						<th>About</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tests}" var="test" varStatus="i">
						<tr>
							
							<td class="test-numb"><h5>${i.count}</h5></td>
							<td class="test-name"><a href="<spring:url value="/test/view/${test.id}"/>" class="fcolor-orange"><h5>${test.name}</h5></a></td>
							<td class="test-about">${test.text}
								<div class="controls">
							        <a class="functions" href="<spring:url value="/test/check/${test.id}"/>">
							        	<span class="glyphicon glyphicon-ok-circle fcolor-darkblue" aria-hidden="true"></span>Check</a>
							      	<a class="functions" href="<spring:url value="/test/results/${test.id}"/>">
				            			<span class="glyphicon glyphicon-list-alt fcolor-darkblue" aria-hidden="true"></span>Results</a>
									<a class="functions" href="update/${test.id}">
										<span class="glyphicon glyphicon-pencil fcolor-darkblue" aria-hidden="true"></span>Edit</a>
									<a class="functions popup-with-form" href="#test-form">
										<span class="glyphicon glyphicon-book fcolor-darkblue" aria-hidden="true" ></span>Copy</a> 
							
											      <!-- form itself -->
			<form id="test-form" class="mfp-hide white-popup-block f14">
        <h2>Copy "${test.name}"</h2>
        <fieldset style="border:0;">
          <ul class="style-none">
            <li>
              	<label for="name">New name:</label><br/>
              	<input id="name" name="name" type="text" placeholder="Name" class="form-control" required>
            </li>
            <li>
              	<label for="textarea">About</label><br/>
             	<textarea id="textarea" class="form-control">Info about new test</textarea>
            </li>
            <li class="form-checkbox">
           	 	<input type="checkbox" name="publicity_check" value="a1" >Private url<br/>
            </li>
            <li class="combine __1">
            	<label>Start date: (mm/dd/yyyy)</label>
           		<input id="dateStart" path="date_start" type="text" class="form-control" />
            </li>
            <li class="combine __2">
            	<label>End date: (mm/dd/yyyy)</label>
           		<input id="dateEnd" path="date_end" type="text" class="form-control" />
            </li>
            <li>
            	<button class="btn __orange button-primary" type="submit">Create copy!</button>
            </li>
            
            </ul>
        </fieldset>
      </form>
    										
									<a class="functions fcolor-orange" href="delete/${test.id}">
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Delete</a>
								</div>
							</td>
					  </tr>
					</c:forEach>
				</tbody>
			</table>
				<div class="row align-center __drop">
		
					<a id="add-btn" class="btn __darkblue"
						href="<spring:url value="/test/add"/>"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new Test</a> 
				</div>
	
		</div>
	</div>
	
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
<script>
	$(document).ready(function(){
		$("#logout").click(function(e){
			e.preventDefault();
			$("#logout-form").submit();
		});
	});

      $(document).ready(function() {
        $('.popup-with-form').magnificPopup({
          type: 'inline',
          preloader: false,
          focus: '#name',

          // When elemened is focused, some mobile browsers in some cases zoom in
          // It looks not nice, so we disable it:
          callbacks: {
            beforeOpen: function() {
              if($(window).width() < 700) {
                this.st.focus = false;
              } else {
                this.st.focus = '#name';
              }
            }
          }
        });
      });
</script>


</body>
</html>