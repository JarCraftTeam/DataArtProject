/**
 * Created by Юлия on 22.04.2016.
 */
$(document).ready(function() {
    $('.custom-img').on('change', function() {
        realVal = $(this).val();
        lastIndex = realVal.lastIndexOf('\\') + 1;
        if(lastIndex !== -1) {
            realVal = realVal.substr(lastIndex);
            $(this).prev('.mask').find('.fileInputText').val(realVal);
        }
    });
});



