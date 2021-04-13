$(document).ready(function() {
    initHeaderEvent();
    headerAlertAjax();
});
function initHeaderEvent() {
    $('#noticeBox ul').on('click','.msgBody',function() {//알림 리스트의 제목 클릭 시
        alertObj.ano=Number($(this).attr('id').substr(3));
        var header=$(this).siblings()[0].innerHTML;
        readAlert(header);
    });
    $('.fa-bell').click(function() {//종을 누를 경우 알림 리스트 출력/숨기기
        $('#noticeBox').toggle();        
    });
    $('#noticeBox').on('click','i',function() {//알림 리스트의 삭제버튼 클릭 시
        alertObj.ano=Number($(this).attr('id').substr(8));
        delHeaderAlert();
    });
}
function readAlert(header) {//알림 탭 페이지 공용메서드... 이 부분은 수정 필요
    console.log('읽기 진입');
    var url;
    if(alertObj.mtype==1){//만약 개인 회원이라면
        if(header=='[결제]')//헤더가 결제라면
            url="/jsp/mypageUser/mypagePs.jsp";
        else if(header=='[완료]')//헤더가 완료라면..이슈
            url="/jsp/mypageUser/mypagePs.jsp";
        else if(header=='[답글]')//헤더가 답글이라면
            url="/jsp/mypageUser/mypagePs.jsp";
        else if(header=='[취소]')//헤더가 취소라면..이슈
            url="/jsp/mypageUser/mypagePs.jsp";
    }else if(alertObj.mtype==2){//만약 업체회원이라면..리뷰 추가해야할 듯
        if(header=='[결제]')//헤더가 결제라면
            url="/jsp/mypageBiz/mpbProg_Num.jsp";
        else if(header=='[취소]')//헤더가 취소라면..이슈
            url="/jsp/mypageBiz/mypageBs_com.jsp";
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
function printHeaderList(list) {//헤더에 알림 리스트 출력
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
                                    '<i id="alertDel'+value.ano+'" class="fas fa-times"></i>'+
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
function printRedDot(count){//알림 출력 메서드
        $('#bellBox .redDot').text(count);
    if(count!=0){
        $('#bellBox .redDot').show();
    }
}
function downDotCount(){//알림 카운트 내리기 메서드
    var count=Number($('#bellBox .redDot')[0].innerHTML)-1;
    if(count==0){
        $('#bellBox .redDot').hide();
    }
    $('#bellBox .redDot').text(count);
}
function upDotCount(){//알림 카운트 올리기 메서드
    var count=Number($('#bellBox .redDot')[0].innerHTML)+1;
    $('#bellBox .redDot').text(count);
    $('#bellBox .redDot').show();
}
function dotCountZero(){
    $('#bellBox .redDot').hide();//먼저 숨긴다.
    $('#bellBox .redDot').text(0);//숫자를 0으로 돌린다.
}