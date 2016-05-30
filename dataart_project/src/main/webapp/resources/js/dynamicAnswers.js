$(document).ready(function() {
    /*var wrapper_answer = $(".answer-container");*/
	var wrapper_question=$(".main");
    var add_button_answer = $(".add-answer"); 
    var add_button_question= $(".add-question");
    var x = 1, y = 1;
    
    $(document).on('click', '.add-question', function(e){
    	e.preventDefault();
    	var add_question='<div class="question-container">'
    	+'<div class="row">'
    	+'<div class="question col-xs-12 col-sm-12 col-md-7 col-lg-7">'
    	+'<p>#'+(x+1)+'Question:</p>'
    	+'<div class="del-btn">'
    	+'<div class="del-btn-icon-ques" title="Delete question"></div>'
    	+'</div>'
    	+'<textarea id="questions0.text" class="form-control" name="questions['+x+'].text" placeholder="Question text" rows="7"></textarea>'
    	+'</div>'
    	+'<div class="image-container col-xs-12 col-sm-12 col-md-5 col-lg-5">'
    	+'<div class="show-img qst col-xs-4 col-sm-4 col-md-8 col-lg-8">'
		+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No question image">'
		+'</div>'
		+'<div class="add-img col-xs-2 col-sm-2 col-md-4 col-lg-4">'
		+'<label>'	
		+'<div class="add-img-icon" title="add  image"></div>'
		+'<input class="img-loader" name="imageLoaderQst" type="file" style="display: none;">'
		+'</label>'
		+'</div></div></div>'
		+'<div class="row">'
		+'<div class="question_type col-xs-6 col-sm-6 col-md-3 col-lg-3">'
		+'<p>Question type:</p>'
		+'<select id="addQuestionType1" name="questions['+x+'].type.id" class="u-full-width form-control">'
		+'<option value="1">One</option>'
		+'<option value="2">Several</option>'
		+'<option value="3">Full</option>'
		+'</select>'
		+'</div>'
		+'<div class="marks col-xs-6 col-sm-6 col-md-4 col-lg-4">'
		+'<p>Mark for the question</p>'
		+'<div class="row">'
		+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
		+'<label>correct answer</label><input class="form-control" type="number" value="1"/>'
		+'</div>'
		+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
		+'<label>incorrect answer</label><input class="form-control" type="number" value="-1"/>'
		+'</div></div></div></div>'
		+'<div class="answer-container"><div class="row">'
		+'<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">'
		+'<input id="'+x+''+y+'" name="questions['+x+'].answers[0].right" type="checkbox" value="true"><input type="hidden" name="_questions[0].answers[0].right" value="on"><label for="'+x+''+y+'"></label>'
		+'<label for="1"></label>'
		+'</div>'
		+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
		+'<input id ="answerText" name="questions['+x+'].answers[0].text" class="u-full-width form-control" placeholder="Answer text" type="text" value="">'
		+'</div>'
		+'<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">'
		+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No answer image">'
		+'</div>'
		+'<div class="add-img col-xs-2 col-sm-2 col-md-2 col-lg-2"><label>'
		+'<div class="add-img-icon" title="add  image"></div><input class="img-loader" name="imageLoaderQst" type="file" style="display: none;">'
		+'</label></div>'
		+'<div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1"><div class="del-btn-icon-answer" title="Delete answer"></div></div>'
		+'</div></div>'
		+'<a class="btn __darkblue add-answer add-answer-beginner">Add Answer</a></div></div>';
		
    	var new_y=1;
    	var curr_x=x;
    	$(wrapper_question).append(add_question);
    	var new_wrapper_anwer=$(".dynamic-answer-container"+x+"");
    	var new_add_button_answer=$(".dynamic-button"+x+"");
    	
    	$(new_add_button_answer).on('click',function(){
    		
    		var add_answer= '<div class="row">'
            	+'<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">'
            	+'<input type="checkbox" id="'+x+''+y+'" path="questions[0].answers[0].right"/>'
            	+'<label for="'+x+''+y+'"></label>'
        		+'</div>'
        		+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
        		+'<input id ="answerText" name="questions[0].answers['+y+'].text" class="u-full-width form-control" placeholder="Answer text" type="text" value="">'
        		+'</div>'
        		+'<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">'
        		+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No answer image">'
        		+'</div><div class="add-img col-xs-2 col-sm-2 col-md-2 col-lg-2">'
        		+'<label><div class="add-img-icon" title="add  image"></div><input class="img-loader" name="imageLoaderQst" type="file" style="display: none;"></label>'
        		+'</div>'
        		+'<div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">'
    			+'<div class="del-btn-icon-answer" title="Delete answer"></div></div></div>';
    			
                $(new_wrapper_anwer).append(add_answer); 
                new_y++; 
            
    	});
    	x++;
    });
    
    
    
    $(document).on('click', '.add-answer-beginner' ,function(e){
        e.preventDefault();
        
        var add_answer=  '<div class="row">'
        	+'<div class="answers col-xs-1 col-sm-1 col-md-1 col-lg-1">'
        	+'<input type="checkbox" id="'+x+''+y+'" path="questions[0].answers[0].right"/>'
        	+'<label for="'+x+''+y+'"></label>'
    		+'</div>'
    		+'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">'
    		+'<input id ="answerText" name="questions[0].answers['+y+'].text" class="u-full-width form-control" placeholder="Answer text" type="text" value="">'
    		+'</div>'
    		+'<div class="show-img answ col-xs-2 col-sm-2 col-md-2 col-lg-2">'
    		+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No answer image">'
    		+'</div><div class="add-img col-xs-2 col-sm-2 col-md-2 col-lg-2">'
    		+'<label><div class="add-img-icon" title="add  image"></div><input class="img-loader" name="imageLoaderQst" type="file" style="display: none;"></label>'
    		+'</div>'
    		+'<div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">'
			+'<div class="del-btn-icon-answer" title="Delete answer"></div></div></div>';
			var wrapper_answer = $(this).parents(".question-container").find('.answer-container');
    		$('.answer-container').find('.del-btn-icon-answer:first-child').remove();
            $(wrapper_answer).append(add_answer); 
            y++; 
        
    });
   
    $(document).on('click', '.del-btn-icon-answer', function() {
    	var del_btn = '<div class="del-btn col-xs-1 col-sm-1 col-md-1 col-lg-1">'
		+'<div class="del-btn-icon-answer" title="Delete answer"></div></div></div>';
    	$(this).parents('.answer-container').find('.row').find('.del-btn').append(del_btn);
    	$(this).parents('.row').remove();
    	y--;
    });
}); 

