$(document).ready(function() { 
	$(function () { 
		var stickyTop = $('.main-nav').offset().top; 
		
		$(window).scroll(function () { 
			if ($(window).scrollTop() > stickyTop) { 
				$("#header").addClass("__fixed"); 
			} else { 
				$("#header").removeClass("__fixed"); 
			} 
		}); 
	});
});