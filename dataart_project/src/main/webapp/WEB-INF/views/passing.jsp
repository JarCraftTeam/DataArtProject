<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		href="<spring:url value="/resources/css/passing.css"/>" type="text/css" />

	<!-- Scripts -->
	
	<script 
		src="<spring:url value="/resources/js/jquery-2.2.3.min.js"/>"></script>
	<script 
		src="<spring:url value="/resources/js/helper.js"/>"></script>
		
</head>
<body>
	<!-- HEADER -->
	<div id="header">
		<div class="wrapper">
			<!-- <img src="/resources/img/logo.png" alt="" /> -->
			<h1 class="fcolor-sky">IT School</h1>
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
	
	 <h1>Test name</h1>
	 <p class="test-info">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
		  eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
		  quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
		  Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat 
		  nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
		  officia deserunt mollit anim id est laborum 
	 </p>
	 <form class="form">
      	<fieldset class="contacts">
	        <legend>Personal information</legend>
	        <div class="row">
 			 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		        <label for="inputFirstName">First Name</label>
		        <input type="text" id="inputFirstName" class="form-control" placeholder="Name" required autofocus />
		     </div>
		     <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
		        <label for="inputLastName">Last Name</label>
		        <input type="text" id="inputPhone" class="form-control" placeholder="Last Name" required />
	       	 </div>
	        </div>
	        <div class="row">
 			 	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			        <label for="inputPhone">Phone</label>
			        <input type="text" id="inputLastName" class="form-control" placeholder="+38 xxx xxx xx xx" required />
		        </div>
		        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
			        <label for="inputEmail">Email address</label>
			        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required />
			    </div>
		    </div>
        </fieldset>
        <fieldset class="test">
	        <legend>Answer the questions</legend>
	        <div class="question" id="ques-1">
	        	<p><span>#1 </span>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit 
	        	laboriosam, nisi ut aliquid ex ea commodi consequatur?</p>
	        	<ul>
	        		<li>
			        	<input type="radio" id="ans-1" name="ques-1" class="radio-ans" />
			        	<label for="ans-1">Answer one</label>
	        		</li>
	        		<li>
			        	<input type="radio" id="ans-2" name="ques-1" class="radio-ans" />
			        	<label for="ans-2">Answer two</label>
	        		</li>
	        		<li>
			        	<input type="radio" id="ans-3" name="ques-1" class="radio-ans" />
			        	<label for="ans-3">Answer three</label>
	        		</li>
	        	</ul>	
	        </div>
	        <div class="question" id="ques-2">
	        	<p><span>#2 </span>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit 
	        	aboriosam, isi ut aliquid ex ea commodi consequatur?</p>
	        	<ul>
	        		<li>
			        	<input type="checkbox" id="ans-4" name="ques-2" class="checkbox-ans" />
			        	<label for="ans-4">Answer one</label>
	        		</li>
	        		<li>
			        	<input type="checkbox" id="ans-5" name="ques-2" class="checkbox-ans" />
			        	<label for="ans-5">Answer two</label>
	        		</li>
	        		<li>
			        	<input type="checkbox" id="ans-6" name="ques-2" class="checkbox-ans" />
			        	<label for="ans-6">Answer three</label>
	        		</li>
	        	</ul>	
	        	<div class="question" id="ques-3">
	        	<p><span>#3 </span>Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit 
	        	laboriosam, nisi ut aliquid ex ea commodi consequatur?</p>
	        	<textarea class="form-control" placeholder="Enter your answer"></textarea>
	        	</div>
	        </div>
        </fieldset>
        <button class="btn __darkblue btn-lg" type="submit">Submit</button>
     </form>

    </div>
    
	<footer class="footer">
		<div class="wrapper">
			<p>Copyright: JarCraft 2016</p>
		</div>
	</footer>
	

</body>
</html>