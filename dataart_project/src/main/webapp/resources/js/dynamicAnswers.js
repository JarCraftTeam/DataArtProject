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
    	+'<div class="question col-xs-4 col-sm-4 col-md-4 col-lg-4">'
    	+'<p>#'+(x+1)+'Question:</p>'
    	+'<textarea id="questions0.text" name="questions['+x+'].text" placeholder="Question text" rows="7"></textarea>'
    	+'</div>'
    	+'<div class="image-container col-xs-4 col-sm-4 col-md-4 col-lg-4">'
    	+'<div class="add-img col-xs-4 col-sm-4 col-md-4 col-lg-4">'
		+'<span>Add image</span>'
		+'<label><img class="add-img-icon" alt="add image" src="../resources/img/add_img.png">'
		+'<input class="img-loader" name="imageLoaderQst" type="file" style="display: none;"></label>'
		+'</div>'	
		+'<div class="show-img qst col-xs-8 col-sm-8 col-md-8 col-lg-8">'
		+'<p>Image preview:</p>'
		+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No question image">'
		+'</div>'
		+'</div>'
    	+'<div class="question_type col-xs-4 col-sm-4 col-md-4 col-lg-4">'
    	+'<p>Question type:</p>'
    	+'<select id="addQuestionType1" name="questions['+x+'].type.id" class="u-full-width">'
    	+'<option value="1">One</option>'
		+'<option value="2">Several</option>'
		+'<option value="3">Full</option>'
		+'</select>'
    	+'<div class="question_mark">'
    	+'<p class="bulged-in">Mark for the question</p>'
    	+'<div class="row">'
    	+'<div class="bulged-in col-xs-6 col-sm-6 col-md-6 col-lg-6">'
    	+'<label>correct answer</label>'
    	+'<input id="questions0.mark" name="questions['+x+'].mark" type="number" value="0">'
    	+'</div>'
    	+'<div class="bulged-in col-xs-6 col-sm-6 col-md-6 col-lg-6">'
    	+'<label>incorrect answer</label>'
    	+'<input type="number" />'
    	+'</div></div></div></div></div>'
    	+'<div class="answer-container dynamic-answer-container'+x+'">'
		+'<div class="row">'
    	+'<div class="bulged-in col-xs-4 col-sm-4 col-md-4 col-lg-4">'
		+'<label>#1</label>'
		+'<label>Answer Text:</label>'
		+'<input id ="answerText" name="questions['+x+'].answers[0].text" class="u-full-width" placeholder="Answer text" type="text" value="">'
		+'</div>'
		+'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'
		+'<div class="add-img col-xs-4 col-sm-4 col-md-4 col-lg-4">'
		+'<span>Add image</span>'
		+'<label><img class="add-img-icon" alt="add image" src="../resources/img/add_img.png">'
		+'<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;"></label>'
		+'</div>'
		+'<div class="show-img answ col-xs-8 col-sm-8 col-md-8 col-lg-8">'
		+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No answer image">'
		+'</div>'	
		+'</div>'
		+'<div class="answers bulged-in col-xs-2 col-sm-2 col-md-2 col-lg-2">'
		+'<input id="'+x+''+y+'" name="questions['+x+'].answers[0].right" type="checkbox" value="true"><input type="hidden" name="_questions[0].answers[0].right" value="on"><label for="'+x+''+y+'">Correct</label>'
		+'</div>'
		+'<div class="del-btn col-xs-2 col-sm-2 col-md-2 col-lg-2">'
		+'<img class="del-btn-icon-answer" alt="Delete answer" src="../resources/img/del-btn.png"/>'
		+'</div>'
		+'</div>'
		+'</div>'
		+'<a class="button add-answer dynamic-button'+x+'">Add Answer</a>'
		+'</div>';
    	var new_y=1;
    	var curr_x=x;
    	$(wrapper_question).append(add_question);
    	var new_wrapper_anwer=$(".dynamic-answer-container"+x+"");
    	var new_add_button_answer=$(".dynamic-button"+x+"");
    	
    	$(new_add_button_answer).on('click',function(){
    		
    		var add_answer= '<div class="row">'
            	+'<div class="bulged-in col-xs-4 col-sm-4 col-md-4 col-lg-4">'
        		+'<label>#'+(new_y+1)+'</label>'
        		+'<label>Answer Text:</label>'
        		+'<input id ="answerText" name="questions['+curr_x+'].answers['+new_y+'].text" class="u-full-width" placeholder="Answer text" type="text" value="">'
        		+'</div>'
        		+'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'
				+'<div class="add-img col-xs-4 col-sm-4 col-md-4 col-lg-4">'
				+'<span>Add image</span>'
				+'<label><img class="add-img-icon" alt="add image" src="../resources/img/add_img.png">'
				+'<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;"></label>'
				+'</div>'
				+'<div class="show-img answ col-xs-8 col-sm-8 col-md-8 col-lg-8">'
				+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No answer image">'
				+'</div>'	
				+'</div>'
        		+'<div class="answers bulged-in col-xs-2 col-sm-2 col-md-2 col-lg-2">'
        		+'<input id="'+x+''+y+'" name="questions['+curr_x+'].answers['+new_y+'].right" type="checkbox" value="true"><input type="hidden" name="_questions[0].answers[0].right" value="on"><label for="'+x+''+y+'">Correct</label>'
        		+'</div>'
        		+'<div class="del-btn col-xs-2 col-sm-2 col-md-2 col-lg-2">'
        		+'<img class="del-btn-icon-answer" alt="Delete answer" src="../resources/img/del-btn.png"/>'
        		+'</div>'
        		+'</div>';
    			
                $(new_wrapper_anwer).append(add_answer); 
                new_y++; 
            
    	});
    	x++;
    });
    
    
    
    $(document).on('click', '.add-answer-beginner' ,function(e){
        e.preventDefault();
        
        var add_answer=  '<div class="row">'
        	+'<div class="bulged-in col-xs-4 col-sm-4 col-md-4 col-lg-4">'
    		+'<label>#'+(y+1)+'</label>'
    		+'<label>Answer Text:</label>'
    		+'<input id ="answerText" name="questions[0].answers['+y+'].text" class="u-full-width" placeholder="Answer text" type="text" value="">'
    		+'</div>'
    		+'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'
			+'<div class="add-img col-xs-4 col-sm-4 col-md-4 col-lg-4">'	
			+'<span>Add image</span>'
			+'<label><img class="add-img-icon" alt="add image" src="../resources/img/add_img.png">'
			+'<input class="img-loader" name="imageLoaderAnsw" type="file" style="display: none;"></label>'
			+'</div>'
			+'<div class="show-img answ col-xs-8 col-sm-8 col-md-8 col-lg-8">'
			+'<img class="img-previewer" src="../resources/img/no_image.png" alt="No answer image">'
			+'</div>'	
			+'</div>'
    		+'<div class="answers bulged-in col-xs-2 col-sm-2 col-md-2 col-lg-2">'
    		+'<input id="'+x+''+y+'" name="questions[0].answers['+y+'].right" type="checkbox" value="true"><input type="hidden" name="_questions[0].answers[0].right" value="on"><label for="'+x+''+y+'">Correct</label>'
    		+'</div>'
    		+'<div class="del-btn col-xs-2 col-sm-2 col-md-2 col-lg-2">'
    		+'<img class="del-btn-icon-answer" alt="Delete answer" src="../resources/img/del-btn.png"/>'
    		+'</div>'
    		+'</div>';
    		var wrapper_answer = $(this).parents(".question-container").find('.answer-container');
    		$('.answer-container').find('.del-btn-icon-answer:first-child').remove();
            $(wrapper_answer).append(add_answer); 
            y++; 
        
    });
   
    $(document).on('click', '.del-btn-icon-answer', function() {
    	var del_btn = '<img class="del-btn-icon-answer" alt="Delete answer" src="../resources/img/del-btn.png"/>';
    	console.log(this);
    	$(this).parents('.answer-container').find('.row').find('.del-btn').append(del_btn);
    	$(this).parents('.row').remove();
    	y--;
    });
}); 

