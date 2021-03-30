$(document).ready(function() {
    $('.fa-bell').click(function() {
        $('#noticeBox').toggle();
        if($('#bellBox .redDot').css('display')!='none'){//종 빨간 점 없애기
           $('#bellBox .redDot').css('display','none');
        }
    });
});