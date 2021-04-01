$(document).ready(function() {
    $('.fa-bell').click(function() {
        $('#noticeBox').toggle();
        if($('#bellBox .redDot').css('display')!='none'){//종 빨간 점 없애기
           $('#bellBox .redDot').css('display','none');
        }
    });
    $('#noticeBox').on('click','i',function() {
        var ano=JSON.parse($(this).attr('id'));
        delAlert(ano);
    });
});
function delAlert(ano) {//알림 삭제 메서드
    $.post({
        url:'/delAlert.do',
        data:{ano:ano},
        success:function() {
            $('#noticeBox li#'+ano).remove();
        }
    });
}