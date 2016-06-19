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
	<title>Admin Panel</title>

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
		src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
<script 
		src="<spring:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>

		
</head>

<body>
	<div id="header">
		<div class="wrapper">
			<!-- <img src="/resources/img/logo.png" alt="" /> -->
			<h1 class="fcolor-sky">IT School</h1>
			<h2 class="fcolor-sky">
				Admin Panel
			</h2>
			<div class="admin-panel">
				<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
				<a id="logout" href="#">Exit Admin Panel</a>
				<form id="logout-form" action="<c:url value="/logout"/>" method="post">
					<sec:csrfInput/>
				</form>
			</div>
			<div class="main-nav">
				<ul>
					<li><a href="/dataart_project/">Go User</a></li>
					<li class="active"><a href="/dataart_project/admin/">Test List</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</div>

	
	<!-- LISTING STARTS HERE -->
	<div id="main">
		<div class="test-container">
		<c:if test="${param.nothing != null}">
        	<div class="row">
        	<div class="alert alert-info text-center">
		  		<h5>There is nothing to check!</h5>
			</div>
			</div>
        </c:if>
		<div class="global-container">

			<div class="row align-center">
				<h2>Test list:</h2>
			</div>
			<div class="row align-center __drop">
	
				<a id="add-btn" class="btn __darkblue"
					href="<spring:url value="/admin/add"/>"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new Test</a> 
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
							<td class="test-name"><a href="<spring:url value="/admin/view/${test.id}"/>" class="fcolor-orange"><h5>${test.name}</h5></a></td>
							<td class="test-about">${test.text}
								<div class="controls">
							        <a class="functions" href="<spring:url value="/admin/check/${test.id}"/>">
							        	<span class="glyphicon glyphicon-ok-circle fcolor-darkblue" aria-hidden="true"></span>Check</a>
							      	<a class="functions" href="<spring:url value="/admin/results/${test.id}"/>">
				            			<span class="glyphicon glyphicon-list-alt fcolor-darkblue" aria-hidden="true"></span>Results</a>
									<a class="functions" href="update/${test.id}">
										<span class="glyphicon glyphicon-pencil fcolor-darkblue" aria-hidden="true"></span>Edit</a>
									<a class="functions popup-with-form copy-btn" href="#test-form"><i id="${test.id}"></i>
										<span class="glyphicon glyphicon-book fcolor-darkblue" aria-hidden="true" ></span>Copy</a> 
									<a class="functions fcolor-orange popup-with-form del-btn" href="#delete-form"><i id="${test.id}"></i>
										<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Delete</a>
								
								
								</div>
							</td>

					  </tr>
					</c:forEach>
				</tbody>
			</table>
	
		</div>
	</div>
	
	<form id="test-form" class="mfp-hide white-popup-block f14" action="copy" method="post">
        <h2>Copying Test!</h2>
        <fieldset style="border:0;">
          <ul class="style-none">
            <li>
            <input type="hidden" id="testid" name="test-id"></input>
              	<label for="name">New name:</label><br/>
              	<input id="name" name="name" type="text" placeholder="Name" class="form-control" required="true">
            </li>
            <li>
              	<label for="textarea">About</label><br/>
             	<textarea id="textarea" name="about" class="form-control" placeholder="Info about new test" required="true"></textarea>
            </li>
            <li class="form-checkbox">
           	 	<input type="radio" name="publicity_check" value="1">Private<br/>
           	 	<input type="radio" name="publicity_check" value="0">Public<br/>
            </li>
            <li class="combine __1">
            	<label>Start date: (mm/dd/yyyy)</label>
           		<input id="dateStart" name="date_start" type="text" class="form-control" required="true"/>
            </li>
            <li class="combine __2">
            	<label>End date: (mm/dd/yyyy)</label>
           		<input id="dateEnd" name="date_end" type="text" class="form-control" required="true"/>
            </li>
            <li>
            	<button class="btn __orange button-primary" type="submit">Create copy!</button>
            </li>
            <sec:csrfInput/>
            </ul>
        </fieldset>
      </form>
      
      <form id="delete-form" class="mfp-hide white-popup-block f14">
        <h2>Delete Test</h2>
        <fieldset style="border:0;">
          <div class="alert alert-danger">
				<h5><span class="glyphicon glyphicon-warning-sign"></span> Are you
				sure you want to delete this test? All results will be lost.</h5>
		</div>
		<a id="delTestYes" class="btn __orange button-primary">Delete!</a>
        </fieldset>
      </form>
	
	
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
	

	
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment-with-locales.min.js"></script>
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<script>
$(document).ready(function(){
	$("#dateStart").datetimepicker({format: 'DD/MM/YYYY',widgetPositioning: {
        vertical: 'bottom',
        horizontal: 'auto'
    }});
	$("#dateEnd").datetimepicker({format: 'DD/MM/YYYY',widgetPositioning: {
        vertical: 'bottom',
        horizontal: 'auto'
    }});
	$(".del-btn").click(function(e){
		e.preventDefault();
		var id=$(this).children("i").attr("id");
		$("#delTestYes").attr("href","delete/"+id);
	});
	$(".copy-btn").click(function(e){
		e.preventDefault();
		var id=$(this).children("i").attr("id");
		$("#testid").val(id);
	});
	$("#logout").click(function(e){
		e.preventDefault();
		$("#logout-form").submit();
	}); 
	$('.popup-with-form').magnificPopup({
        type: 'inline',
        preloader: false,
        focus: '#name',

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