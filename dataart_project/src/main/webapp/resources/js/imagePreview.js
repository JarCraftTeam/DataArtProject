function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
        	$(input).closest('.add-img').siblings('.show-img').find('.img-previewer').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$(document).on("change",".img-loader",function(){
    readURL(this);
});

