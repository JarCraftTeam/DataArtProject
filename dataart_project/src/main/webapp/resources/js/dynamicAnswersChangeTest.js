$(document).ready(function() {
	var wrapper_question=$(".main");
    var add_button_answer = $(".add-answer"); 
    var add_button_question= $(".add-question");
    var x = $(".question-container").size();
    var temporary=0;
    $(document).on('click', '.add-question', function(e){
    	e.preventDefault();
    	var add_question='<div class="question-container">'
    	+'<div class="row">'
		+'<div class="question col-xs-12 col-sm-12 col-md-7 col-lg-7">'
		+'<p>#'+(x+1)+' Question:</p>'
		+'<div class="del-btn">'
    	+'<div class="del-btn-icon-ques" title="Delete question">'
		+'<a type="button" class="btn btn-danger btn-sm">'
    	+'<span class="glyphicon glyphicon-minus"></span>'
    	+'</a>'
		+'</div>'
		+'</div>'
		+'<textarea name="questions['+x+'].text" rows="7" class="form-control" placeholder="Question text" required="true"/>'
		+'</div>'	
		+'<div class="image-container col-xs-12 col-sm-12 col-md-5 col-lg-5">'
		+'<div class="show-img qst col-xs-4 col-sm-4 col-md-8 col-lg-8">'
		+'<img class="img-previewer" src="../../resources/img/no_image.png" alt="No question image">'
		+'</div>'
		+'<div class="add-img col-xs-2 col-sm-2 col-md-4 col-lg-4">'
		+'<label>'
    	+'<a type="button" class="btn __darkblue btn-lg">'
    	+'<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'
    	+'</a>'
    	+'<input class="img-loader" name="imageLoaderQst" type="file" style="display: none;" accept="image/*">'
    	+'</label>'
		+'</div>'	
		+'</div>'
    	+'</div>'
    	+'<div class="row">'
		+'<div class="question_type col-xs-6 col-sm-6 col-md-3 col-lg-3">'
		+'<p>Question type:</p>'
		+'<select name="questions['+x+'].type.id"'
    	+'class="u-full-width form-control question-type">'
    	+'<option value="1">One</option>'
    	+'<option value="2">Several</option>'
    	+'<option value="3">Full</option>'
		+'</select>'
		+'</div>'	
		+'<div class="marks col-xs-6 col-sm-6 col-md-4 col-lg-4">'
		+'<p>Mark for the question</p>'
		+'<div class="row">'
		+'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-md-offset-2">'
    	+'<br>'	
		+'<input class="form-control" name="questions['+x+'].mark" type="number" min="0" max="9" value="1" required="true"/>'
    	+'</div>'	
    	+'</div>'
		+'</div>'
    	+'</div>'
    	+'<div class="answer-container dynamic-'+x+'">'
		+'<div class="row">'
		+'<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">'
        +'<h4>#1</h4>'
		+'</div>'
		+'<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">'
        +'<input type="checkbox"  id="'+x+'d0" path="questions['+x+'].answers[0].right"/>'
        +'<label for="'+x+'d0"></label>'
		+'</div>'
		+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
    	+'<input id="answerText" name="questions['+x+'].answers[0].text"'
    	+'placeholder="Answer text" class="u-full-width form-control" required="true"/>'
		+'</div>'
		+'<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">'
    	+'<img class="img-previewer" src="../../resources/img/no_image.png" alt="No answer image">'
		+'</div>'
		+'<div class="add-img col-xs-1 col-sm-1 col-md-1 col-lg-1">'	
		+'<label>'
    	+'<a type="button" class="btn __darkblue btn-lg">'
    	+'<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'
    	+'</a>'
    	+'<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;" accept="image/*">'
		+'</label>'
		+'</div>'
    	+'<div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">'
		+'<div class="del-btn-icon-answer" title="Delete answer">'
		+'<a type="button" class="btn btn-danger btn-lg">'
		+'<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>'
		+'</a>'
		+'</div>'
		+'</div>'
		+'</div>'
		+'</div>'
		+'<a class="btn __darkblue add-answer dynamic-button-'+x+'">Add Answer</a>'
		+'</div>';
		
    	var new_y=1;
    	var curr_x=x;
    	$(wrapper_question).append(add_question);
    	var new_wrapper_anwer=$(".dynamic-"+x+"");
    	var new_add_button_answer=$(".dynamic-button-"+x+"");
    	
    	$(new_add_button_answer).on('click',function(){
    		
    		var add_answer='<div class="row">'
            	+'<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">'
            	+'<h4>#'+(new_y+1)+'</h4>'
    			+'</div>'
    			+'<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">'
                +'<input type="checkbox" id="'+curr_x+'d'+new_y+'" name="questions['+curr_x+'].answers['+new_y+'].right"/>'
                +'<label for="'+curr_x+'d'+new_y+'"></label>'
    			+'</div>'
    			+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
    			+'<input id="answerText" name="questions['+curr_x+'].answers['+new_y+'].text" '
    			+'placeholder="Answer text" class="u-full-width form-control" required="true"/>'
    			+'</div>'
    			+'<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">'
    			+'<img class="img-previewer" src="../../resources/img/no_image.png" alt="No answer image">'
    			+'</div>'
    			+'<div class="add-img col-xs-1 col-sm-1 col-md-1 col-lg-1">'	
    			+'<label>'
    			+'<a type="button" class="btn __darkblue btn-lg">'
            	+'<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'
    			+'</a>'
    			+'<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;" accept="image/*">'
    			+'</label>'
    			+'</div>'
            	+'<div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">'
            	+'<div class="del-btn-icon-answer" title="Delete answer">'
    			+'<a type="button" class="btn btn-danger btn-lg">'
    			+'<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>'
    			+'</a>'
    			+'</div>'
    			+'</div>'
            	+'</div>';
    			
    		if($(this).parents(".question-container").find("select").val()!=3){
    			$(new_wrapper_anwer).append(add_answer); 
                new_y++; 
    		} 
            
    	});
    	x++;
    });
    
    
    
    $(document).on('click', '.add-answer-beginner' ,function(e){
        e.preventDefault();
        	var xt = $(this).closest(".question-container").children(".question-number").val();
        	var y = $(this).closest(".question-container").children(".answer-container").children(".row").size()+temporary;
        	var add_answer='<div class="row">'
        	+'<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">'
        	+'<h4>#'+(y+1)+'</h4>'
			+'</div>'
			+'<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">'
            +'<input type="checkbox" id="d'+y+'" name="questions['+xt+'].answers['+y+'].right"/>'
            +'<label for="d'+y+'"></label>'
			+'</div>'
			+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
			+'<input id="answerText" name="questions['+xt+'].answers['+y+'].text" '
			+'placeholder="Answer text" class="u-full-width form-control" required="true"/>'
			+'</div>'
			+'<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">'
			+'<img class="img-previewer" src="../../resources/img/no_image.png" alt="No answer image">'
			+'</div>'
			+'<div class="add-img col-xs-1 col-sm-1 col-md-1 col-lg-1">'	
			+'<label>'
			+'<a type="button" class="btn __darkblue btn-lg">'
        	+'<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'
			+'</a>'
			+'<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;" accept="image/*">'
			+'</label>'
			+'</div>'
        	+'<div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">'
			+'<div class="del-btn-icon-answer" title="Delete answer">'
			+'<a type="button" class="btn btn-danger btn-lg">'
			+'<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>'
			+'</a>'
			+'</div>'
			+'</div>'
        	+'</div>';
        
    		var wrapper_answer = $(this).parents(".question-container").find('.answer-container');
    		if($(this).parents(".question-container").find("select").val()!=3){
    			$(wrapper_answer).append(add_answer); 
                y++; 
    		} 
        
    });
   
    $(document).on('click', '.del-btn-icon-answer', function() {
    	$(this).parents('.row').remove();
    	temporary++;
    });
    $(document).on('click', '.del-btn-icon-ques', function() {
    	$(this).parents('.question-container').remove();
    });
    $(document).on('change','.question-type',function(){
    	if($(this).val()==3) {
        	$(this).closest(".row").siblings(".answer-container").empty();
        }else {
        	$(this).closest(".row").siblings(".answer-container").find("input:checkbox").removeAttr('checked');
        }
       });
}); 

