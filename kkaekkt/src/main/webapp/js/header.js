$(document).ready(function() {
    initHeaderEvent();
    headerAlertAjax();
});
function initHeaderEvent() {
    $('#noticeBox ul').on('click','li',function() {
        alertObj.ano=Number($(this).attr('id'));
        readAlert();
    });
    $('.fa-bell').click(function() {
        $('#noticeBox').toggle();
        if($('#bellBox .redDot').css('display')!='none'){//종 빨간 점 없애기
            $('#bellBox .redDot').css('display','none');
        }
    });
    $('#noticeBox').on('click','i',function() {
        alertObj.ano=Number($(this).attr('id'));
        delHeaderAlert();
    });
}
function readAlert() {//알림 탭 페이지 공용메서드
    $.post({
        url:'/updateAlert.do',
        data:alertObj,
        success:function() {
            location.href="/jsp/mypageUser/mypagePs.jsp";
        }
    });
}
function delHeaderAlert() {//알림 삭제 메서드
    $.post({
        url:'/delAlert.do',
        data:alertObj,
        success:function() {
            $('#noticeBox li#'+alertObj.ano).remove();
            initAlertObj();
        }
    });
}
function headerAlertAjax() {
    console.log('alert초기화 진입');
    alertObj.datediff=7;//7일 내로 온 알림만 추출
    $.post({
        url:'/getAlertList.do',
        data:alertObj,
        success:function(data) {
            var list = JSON.parse(data);
            printHeaderList(list);
            initAlertObj();
        }
    });
}
function printHeaderList(list) {
console.log(list);
    $.each(list, function(key,value) {
    	console.log(key);
        $('#noticeBox ul').append('<li id="'+value.ano+'">'+
                                    '<div class="msgTop '+(value.state==2?'read':'')+'">'+
                                        '<span>'+value.typename+'</span>⠀'+value.msg+
                                    '</div>'+
                                    '<div class="msgBottom '+(value.state==2?'read':'')+'">'+
                                        '<span class="date">'+value.date+'</span>'+
                                        '<span class="byBs">by '+value.senderName+'</span>'+
                                    '</div>'+
                                    '<i id="'+value.ano+'" class="fas fa-times"></i>'+
                                '</li>'
        );
    });
}
function initAlertObj() {//객체 초기화 공용 메서드
    delete alertObj.state;
    delete alertObj.typenum;
    delete alertObj.ano;
}