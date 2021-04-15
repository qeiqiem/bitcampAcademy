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
        $('#chatCont').hide();//채팅 박스는 숨긴다
    });
    $('#noticeBox').on('click','i',function() {//알림 리스트의 삭제버튼 클릭 시
        alertObj.ano=Number($(this).attr('id').substr(8));
        delHeaderAlert();
    });
    $('.fa-comments').click(function() {
        $('#chatCont').toggle();
        $('#noticeBox').hide();//알림창은 숨긴다
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
function crtRoom(guest) {
    var bno;
    var rooms=$('.chatBox'); //먼저 열려있는 채팅방을 검사한다.
    if(rooms!=undefined){//만약 방이 하나이상 존재한다면,    
        for(var i=0;i<rooms.length;i++){
            bno=rooms.eq(i) //i 번째 방의
                .attr('id') //id 에서
                .split('room')[0] //bno부분을 추출한다.
            if(Number(bno)==chatObj.bno){//열려있는 방 중 이미 상대방과의 채팅방이 있다면,
                return; //아무것도 하지 않고 리턴한다.
            }
        }
    }//열려있는 방 중에 상대방이 없을 경우 ajax 시행으로 넘어감
    $.post({
        url:'/crtRoom.do',
        data:chatObj,
        success:function(result) {//반환값은 map (방번호=roomNum와 채팅로그=charRog가 저장됨)
            var room=JSON.parse(result);
            if(rooms.length==3){//만약 3개의 채팅방이 개설된 상태라면
                rooms.eq(0).remove();//제일 먼저 생성된 채팅방을 지움
            }
            room.guest=guest;//게스트명 입력
            printRoom(room);
            initChatObj();//객체 초기화 메서드
        }
    });
}
function initChatObj(){//초기화
    delete chatObj.mno;//mno지움
    delete chatObj.bno;//bno지움
    delete chatObj.roomNum;//방번호 지움
}
function printRoom(room){
    $('.chatContainer').append(//채팅방을 만듦
        '<li class="chatBox" id="'+chatObj.bno+'room'+room.roomNum+'">'+
            '<div class="chatBoxHeader">'+
                '💬<span>'+room.guest+'</span>'+
                '<i class="fas fa-times closeChatBtn"></i>'+
            '</div>'+
            '<ul class="chatRogUl" id="chatRog'+room.roomNum+'">'+
            '</ul>'+
            '<div class="chatInputBox">'+
                '<textarea class="chatText"placeholder="대화를 입력하세요"></textarea><button class="chatWriteBtn">전송</button>'+
            '</div>'+
        '</li>'
    );
    if(room.chatRog!=undefined){//채팅 로그가 있다면
        var listType; // 보낸 이가 본인일 때 오른쪽, 게스트일 때 왼쪽을 입력
        var chatType; // 보낸 이가 본인일 때 mine, 게스트일 때 guest 입력
        $.each(room.chatRog,function(key,value){
            if(value.sender==chatObj.sender){
                listType='chatRight';
                chatType='chatMine';
            }else{
                listType='chatLeft';
                chatType="chatGuest";
            };
            $('#chatRog'+roomNum).append(
            '<li class="chatRogli '+listType+'">'+
                '<p class="chatRogP '+chatType+'">'+value.content+'</p>'+
                '<p class="timeRog">'+value.stime+'</p>'+
            '</li>'
            );
        });
    }
}
function delHeaderAlert() {//알림 삭제 메서드
    console.log('알림삭제');
    $.post({
        url:'/delAlert.do',
        data:alertObj,
        success:function() {
            if(!$('.alertLi'+alertObj.ano).hasClass('read')){//읽은 알림이 아니라면
                downAlertDotCount();
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
                                        '<span class="msgHeader">'+value.typename+'</span>⠀<span id="msg'+value.ano+'" class="msgBody">'+value.msg+'</span>'+
                                    '</div>'+
                                    '<div class="msgBottom'+read+'">'+
                                        '<span class="date">'+value.date+'</span>'+
                                        '<span class="byBs">by '+value.senderName+'</span>'+
                                    '</div>'+
                                    '<i id="alertDel'+value.ano+'" class="fas fa-times"></i>'+
                                '</li>'
        );
    });
    printAlertDot(count);
}
function initAlertObj() {//객체 초기화 공용 메서드
    delete alertObj.state;
    delete alertObj.typenum;
    delete alertObj.ano;
}
function printAlertDot(count){//알림 출력 메서드
        $('#bellBox .alertDot').text(count);
    if(count!=0){
        $('#bellBox .alertDot').show();
    }
}
function downAlertDotCount(){//알림 카운트 내리기 메서드
    var count=Number($('#bellBox .alertDot')[0].innerHTML)-1;
    if(count==0){
        $('#bellBox .alertDot').hide();
    }
    $('#bellBox .alertDot').text(count);
}
function upAlertDotCount(){//알림 카운트 올리기 메서드
    var count=Number($('#bellBox .alertDot')[0].innerHTML)+1;
    $('#bellBox .alertDot').text(count);
    $('#bellBox .alertDot').show();
}
function alertDotCountZero(){
    $('#bellBox .alertDot').hide();//먼저 숨긴다.
    $('#bellBox .alertDot').text(0);//숫자를 0으로 돌린다.
}