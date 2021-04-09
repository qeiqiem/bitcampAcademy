$(document).ready(function() {
    initHeaderEvent();
    headerAlertAjax();
});
function initHeaderEvent() {
    $('#noticeBox ul').on('click','.msgBody',function() {
        alertObj.ano=Number($(this).attr('id').substr(3));
        readAlert();
    });
    $('.fa-bell').click(function() {
        $('#noticeBox').toggle();
        // if($('#bellBox .redDot').css('display')!='none'){//종 빨간 점 없애기
        //     $('#bellBox .redDot').css('display','none');
        
    });
    $('#noticeBox').on('click','i',function() {
        alertObj.ano=Number($(this).attr('id'));
        delHeaderAlert();
    });
}
function readAlert() {//알림 탭 페이지 공용메서드
    console.log('읽기 진입');
    var url;
    if(alertObj.mtype==1){
        url="/jsp/mypageUser/mypagePs.jsp";
    }else if(alertObj.mtype==2){
        url="/jsp/mypageBiz/mpbProg_Num.jsp";
    }
    $.post({
        url:'/updateAlert.do',
        data:alertObj,
        success:function() {
            location.href=url;
        }
    });
}
function delHeaderAlert() {//알림 삭제 메서드
    console.log('알림삭제');
    $.post({
        url:'/delAlert.do',
        data:alertObj,
        success:function() {
            if(!$('.alertLi'+alertObj.ano).hasClass('read')){//읽은 알림이 아니라면
                downDotCount();
            }
            $('.alertLi'+alertObj.ano).remove();
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
    var read;
    var count=list.length;
    $.each(list, function(key,value) {
        if(value.state==2){
            read=' read';
            count--;
        }else {
            read='';
        }
        $('#noticeBox ul').append('<li class="alertLi'+value.ano+read+'">'+
                                    '<div class="msgTop'+read+'">'+
                                        '<span>'+value.typename+'</span>⠀<span id="msg'+value.ano+'" class="msgBody">'+value.msg+'</span>'+
                                    '</div>'+
                                    '<div class="msgBottom'+read+'">'+
                                        '<span class="date">'+value.date+'</span>'+
                                        '<span class="byBs">by '+value.senderName+'</span>'+
                                    '</div>'+
                                    '<i id="'+value.ano+'" class="fas fa-times"></i>'+
                                '</li>'
        );
    });
    printRedDot(count);
}
function initAlertObj() {//객체 초기화 공용 메서드
    delete alertObj.state;
    delete alertObj.typenum;
    delete alertObj.ano;
}
function printRedDot(count){
        $('#bellBox .redDot').text(count);
    if(count!=0){
        $('#bellBox .redDot').show();
    }
}
function downDotCount(){
    var count=Number($('#bellBox .redDot')[0].innerHTML)-1;
    if(count==0){
        $('#bellBox .redDot').hide();
    }
    $('#bellBox .redDot').text(count);
}
function upDotCount(){
    var count=Number($('#bellBox .redDot')[0].innerHTML)+1;
    $('#bellBox .redDot').text(count);
    $('#bellBox .redDot').show();
}
function dotCountZero(){
    $('#bellBox .redDot').hide();//먼저 숨긴다.
    $('#bellBox .redDot').text(0);//숫자를 0으로 돌린다.
}