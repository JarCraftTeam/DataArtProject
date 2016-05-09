$(document).ready(function() {
    var max_fields      = 4;
	var wrapper_answer     = $(".answer-container");
	var wrapper_question=$(".question-container");
    var add_button_answer = $(".add-answer"); 
    var add_button_question= $(".add-question");
   
    var x = 1; 
    var y = 1;
    
    $(add_button_question).click(function(e){
    	e.preventDefault();
    	var add_question='<h5><strong>#'+(x+1)+'</strong></h5>'
		+'<div class="row">'
		+'<div class="six columns">'
		+'<h4>Question info:</h4>'
		+'<div class="row">'
		+'<div class="six columns">'
		+'<label>Question type:</label>'
		+'<select id="addQuestionType1" name="questions['+x+'].type.id" class="u-full-width">'
		+'<option value="1">One</option>'
		+'<option value="2">Several</option>'
		+'<option value="3">Full</option>'
		+'</select>'
		+'</div>'
		+'<div class="six columns">'
		+'<label>Question price:</label>'
		+'<input id="addQuestionMark1" name="questions['+x+'].mark" placeholder="Question mark" type="text" value="0">'
		+'</div>'
		+'<div class="row">'
		+'<label>Question text:</label>'
		+'<textarea id="addQuestionText1" name="questions['+x+'].text" class="u-full-width" placeholder="Question text"></textarea>'
		+'</div>'
		+'</div>'
		+'</div>'
		+'<div class="six columns">'
		+'<h4>Answers info: <a class="button add-answer'+x+'">Add Answer</a></h4>'
		+'<div class="answer-container'+x+'">'
		+'<div class="row">'
		+'<label>#1</label>'
		+'<label>Answer Text:</label>'
		+'<input id="answerText" name="questions['+x+'].answers[0].text" class="u-full-width" placeholder="Answer text" type="text" value="">'
		+'</div>'
		+'<div class="row">'
		+'<input id="answerRight" name="questions['+x+'].answers[0].right" type="checkbox" value="true"><input type="hidden" name="_questions[0].answers[0].right" value="on"><span><strong>Right</strong></span>'
		+'</div>'
		+'</div>'
		+'</div>'
		+'</div>';
    	var new_y=1;
    	var curr_x=x;
    	$(wrapper_question).append(add_question);
    	var new_wrapper_anwer=$(".answer-container"+x+"");
    	var new_add_button_answer=$(".add-answer"+x+"");
    	$(new_add_button_answer).on('click',function(){
    		var add_answer= '<div class="row">'
        		+'<label>#'+(new_y+1)+'</label>'
        		+'<label>Answer Text:</label>'
        		+'<input id ="answerText" name="questions['+curr_x+'].answers['+new_y+'].text" class="u-full-width" placeholder="Answer text" type="text" value="">'
        		+'</div>'
        		+'<div class="row">'
        		+'<input id="answerRight" name="questions['+curr_x+'].answers['+new_y+'].right" type="checkbox" value="true"><input type="hidden" name="_questions[0].answers[0].right" value="on"><span><strong>Right</strong></span>'
        		+'</div>';
    		if(new_y < max_fields){ 
                $(new_wrapper_anwer).append(add_answer); 
                new_y++; 
            }
    	});
    	x++;
    });
    
    
    
    $(add_button_answer).on('click',function(e){
        e.preventDefault();
        var add_answer= '<div class="row">'
    		+'<label>#'+(y+1)+'</label>'
    		+'<label>Answer Text:</label>'
    		+'<input id ="answerText" name="questions[0].answers['+y+'].text" class="u-full-width" placeholder="Answer text" type="text" value="">'
    		+'</div>'
    		+'<div class="row">'
    		+'<input id="answerRight" name="questions[0].answers['+y+'].right" type="checkbox" value="true"><input type="hidden" name="_questions[0].answers[0].right" value="on"><span><strong>Right</strong></span>'
    		+'</div>';
    	if(y < max_fields){ 
            $(wrapper_answer).append(add_answer); 
            y++; 
        }
    });
    
    $(wrapper_question).on("click",".remove_field", function(e){ 
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
}); 