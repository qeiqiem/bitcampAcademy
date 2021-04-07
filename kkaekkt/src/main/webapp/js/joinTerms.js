$(document).ready(function() {
    $('#allChk').click(function() {
        if($(this).prop("checked")){
            $('input[type="checkbox"]').prop('checked',true);
        }else{
            $('input[type="checkbox"]').prop('checked',false);
        }
    })
    $('#ok').click(function() {
        if(allTermsChk()){
            console.log('이동');
        }else{
            alert('미체크존재');
        }
    });
});
function allTermsChk(){
    for(var i=1;i<4;i++){
        if(!$('input[type="checkbox"]').eq(i).is(":checked")){
            $('#termsChk').show();
            $('input[type="checkbox"]').eq(i).focus();
            return false;
        }
    }
    return true;
}