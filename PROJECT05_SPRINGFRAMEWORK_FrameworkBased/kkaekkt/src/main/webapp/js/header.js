$(document).ready(function() {
    initHeaderEvent();
    headerAlertAjax();
    headerRoomLiAjax();
});
function initHeaderEvent() {
    initChatEvent();
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
}
function myAlarm(){
    if(alertObj.mtype==1){
        location.href="/jsp/mypageUser/myalertPs.jsp";
    }else if(alertObj.mtype==2){
        location.href="/jsp/mypageBiz/myalertBs.jsp";
    }else{
        alert('지원하지 않는 기능입니다.');
    }
}
function today() {
    let date=new Date();
    let mm=date.getMonth()+1;
    let dd=date.getDate();
    let today=date.getFullYear()+'.'+(mm<10?'0'+mm:mm)+'.'+(dd<10?'0'+dd:dd);
    return today;
}
function dateTime(){
    let date = new Date();   
    let mm=date.getMonth()+1;
    let dd=date.getDate();
    let hours = date.getHours(); // 시
    let minutes = date.getMinutes();  // 분
    var dateTime=date.getFullYear()+'년 '+mm+'월 '+dd+'일 ';
    dateTime+=(hours<13?'AM '+hours:'PM '+(hours-12))+':'+(minutes<10?'0':'')+minutes;
    return dateTime;
}
function sendAlarm() {//알림 보내는 공용 메서드
    var msgType='0';//메시지 타입은 알람
    var alertType; //알람의 타입
    switch(alertObj.typenum) {
        case 1:alertType='[주문]';
        break;
        case 2:alertType='[결제]';
        break;
        case 3:alertType='[완료]';
        break;
        case 4:alertType='[답글]';
        break;
        case 5:alertType='[취소]';
        break;
    }
    $.post({
        url:'/regitAlert.do',
        data:alertObj,
        success:function(ano) {
            if(socket){
                var receiver=alertObj.addressee;
                var msg='<li class="alertLi'+ano+'">'+
                            '<div class="msgTop">'+
                                '<span class="msgHeader">'+alertType+'</span>⠀<span class="msgBody" id="msg'+ano+'">'+alertObj.msg+'</span>'+
                            '</div>'+
                            '<div>'+
                                '<span class="alertDate">'+today()+'</span>'+
                                '<span class="byBs">by '+alertObj.senderName+'</span>'+
                            '</div>'+
                            '<i id="del'+ano+'"class="fas fa-times alertDelBtn"></i>'+
                        '</li>'
                socket.send(msgType+receiver+'msg:'+msg);
            }
        }
    });
}
function initChatEvent(){
    $('.fa-comments').click(function() { //채팅 아이콘 클릭
        $('#chatCont').toggle();
        $('#noticeBox').hide();//알림창은 숨긴다
    });
    $('.chatContainer').on('click','.closeChatBtn',function() { //메인 채팅방 닫기 버튼
        var array=$(this).attr('id') //버튼의 id에서 
                         .split('clsBtn'); //좌측의 게스트번호와 우측의 방번호를 가져온다.
        $('#'+array[0]+'room'+array[1]).remove();//추출한 정보로 채팅방 id를 만들어 지워준다.                         
    });
    $('.chatContainer').on('click','.chatWriteBtn',function(){ //채팅방에 채팅로그추가버튼
        var content=$(this).siblings()[0].value;//버튼 옆에 textArea에서 사용자가 입력한 텍스트를 입력
        if(content!=''){//입력문자가 공백이 아닐 때에만 채팅 로그를 등록
            var array=$(this).attr('id') //버튼의 id에서 
                             .split('sendBtn');//좌측의 게스트번호와 우측의 방번호를 가져온다.
            chatObj.content=content;
            chatObj.addressee=Number(array[0]);
            chatObj.roomnum=Number(array[1]);

            $(this).siblings()[0].value='';//입력칸 초기화
            var chat={
                roomnum:chatObj.roomnum,
                sender:chatObj.sender,
                content:content,
                stime:dateTime(),
                state:0
            }
            sendChat(chat);//채팅 보내기 메서드
            appendChat(chat);//채팅로그를 채팅방에 올리기 메서드
            $(this).siblings().focus();//채팅인풋에 포커스 주기
        }
    });
    $('.chatfooter').on('click','.chatExitBtn',function(event){
        event.stopPropagation();//버블링 막기
        chatObj.closer=chatObj.sender;//본인 번호를 나간(갈)사람으로 입력한다.
        chatObj.roomnum=Number($(this).attr('id') //버튼의 id에서
                                      .substr(11));//방번호만 추출한다.
        chatRoomExit();//채팅방 나가기 메서드
    });
    $('.chatfooter').on('click','.chatList',function(){//헤더에 채팅방 리스트 누르면 채팅방 띄우기
        var array=$(this).attr('id').split('roomLi');//0=수신자mno, 1=방번호
        var addressee=Number(array[0]);
        var roomnum=Number(array[1]);
        if($('#'+addressee+'room'+roomnum)[0]==undefined){//연결된 채팅방이 없을 때만 만들기
            if($('.chatBox')[2]!=undefined){//만약 열려있는 채팅방이 이미 3개 라면
                $('.chatBox')[0].remove();//제일 처음 생성된 채팅방을 지운다.
            }
            var guest=$('#guest'+addressee).text();
            chatObj.roomnum=roomnum;
            chatObj.closer=chatObj.sender;
            var room={addressee:addressee,roomnum:roomnum,guest:guest}
            printRoom(room);//채팅방 만들기
            getChatRog();//채팅로그 넣기
        }
    });
    $('.chatContainer').on('keydown','.chatText',function(key){
        if(key.keyCode == 13) {
            if($(this)[0].value!=""){
                $(this).siblings() //채팅입력박스 우측에 입력 버튼 지정
                       .trigger('click'); //클릭 이벤트 활성화
            }
        }
    });
}
function rlDotToZero(roomnum){//읽을 때 해당 채팅방의 안읽은 개수 초기화
    $('#rlDot'+roomnum).hide();
    $('#rlDot'+roomnum)[0].innerHTML=0;
    initChatDot();//전체 채팅 안읽은 개수 초기화
}
function initLastChat(roomnum,content){//준비물:객체.roomnum, 객체.content
    $('#lastChat'+roomnum)[0].innerHTML=content;
}
function getChatRog(){
    $.get({
        url:'/getChatRog.do',
        data:chatObj,
        success:function(result){//반환객체:List<ChatVO>
            var list=JSON.parse(result);
            appendChat(list);
            initChatObj();
        }
    })
}
function chatRoomExit(){
    $.get({
        url:'/exitChatRoom.do',
        data:chatObj,
        success:function(){
            $('.chatBox[id$=room'+chatObj.roomnum+']').remove();//방번호로 끝나는 메인채팅방 삭제
            $('.chatList[id$=roomLi'+chatObj.roomnum+']').remove();//방번호로 끝나는 헤더 채팅방 삭제
            initChatObj();
            initChatDot();         
        }
    });
}
function sendChat(chat){
    var msgType='1';//메시지 타입 0=알림, 1=채팅
    var receiver=chatObj.addressee;
    $.get({
        url:'/sendChat.do',
        data:chatObj,
        success:function(result){//정상적으로 메서드가 완료됐다면,
            if(result=="success"){
                if(socket){
                    var msg=chatObj.sender+//메시지의 포맷 = 발신자 번호,name:발신인,roomnum:방번호,content:내용
                            ',name:'+alertObj.senderName+
                            ',roomnum:'+chat.roomnum+
                            ',content:'+chat.content;
                    socket.send(msgType+receiver+'msg:'+msg);//메시지 보냄
                }
            }
        }
    });
    initChatObj();
}
function readChat(data){//방번호와 본인 번호
    $.get({
        url:'/readChat.do',
        data:data
    });
    initChatObj();
}
function appendChat(chat){// 매개변수에 담겨있는 정보-방 번호,발신자 번호,내용,일시
    var roomnum;
    var content;
    var receiver;
    var msgType='2';
    var msg;
    if(chat[0]!=undefined){//배열이라면
        $.each(chat,function(key,value){
            if(value.sender!=chatObj.sender){//만약 보낸 이가 본인이 아니라면,
                receiver=value.sender;//신호를 보낼 수신인으로 설정
            }
            printRog(value);
        });
        roomnum=chat[0].roomnum;
        content=chat[chat.length-1].content;
    }else {//배열이 아니라면
        printRog(chat);
        roomnum=chat.roomnum;
        content=chat.content;
        if(chat.sender!=chatObj.sender){//만약 보낸 이가 본인이 아니라면,
            receiver=chat.sender;//신호를 보낼 수신인으로 설정
        }
    }
    $('#chatRog'+roomnum).scrollTop($('#chatRog'+roomnum)[0].scrollHeight);//스크롤 하단으로 위치하는 코드
    //console.log('스크롤 하단 이동');
    initLastChat(roomnum,content);//헤드 채팅방 목록에 마지막 채팅 갱신하기
    msg=roomnum;
    if(socket){
        socket.send(msgType+receiver+'msg:'+msg);
    }
}
function printRog(chat){
    var listType; // 채팅 li의 말풍선 클래스
    var chatType; // 채팅 p의 글자색 클래스
    var idx=chat.stime.indexOf('일');
    var date=chat.stime.slice(0,idx+1);
    var time=chat.stime.slice(idx+2);
    time=(time.slice(0,2)=='AM'?'오전 ':'오후 ')+time.slice(2);
    if(chat.sender==chatObj.sender){
        listType='chatRight';
        chatType='chatMine';
        divType='timeStDivRight'; // 채팅 1 표시 방향
    }else{
        listType='chatLeft';
        chatType="chatGuest";
        divType='timeStDivLeft';
    };
    if(dateLineChk(date)){//마지막 날짜 로그와 채팅 로그의 날짜가 일치하지 않을 경우
        $('#chatRog'+chat.roomnum).append(
            '<li class="dateLine">'+
                '<hr>'+
                '<p class="dateRog">'+date+'</p>'+
            '</li>'
        );
    };
    $('#chatRog'+chat.roomnum).append(
        '<li class="chatRogli '+listType+'">'+//리스트 타입에 따라 요소의 위치가 달라짐
            (listType=='chatRight'?'':'<p class="chatRogP '+chatType+'">'+chat.content+'</p>')+
            '<div class="timeStDiv '+divType+'"><span class="chatStNum" '+(chat.state==0?'>읽지 않음':'style="color:var(--text-gray)">읽음')+'</span>'+
            '<p class="timeRog">'+time+'</p></div>'+
            (listType=='chatRight'?'<p class="chatRogP '+chatType+'">'+chat.content+'</p>':'')+
        '</li>'
    );
}
function dateLineChk(date){
    var lastDateRog=$('.dateRog').last().text();
    if(date==lastDateRog){//마지막 날짜 로그와 일치함
        return false;
    }
    return true;//마지막 날짜 로그와 일치하지 않음
}
function readAlert(header) {//알림 탭 페이지 공용메서드... 이 부분은 수정 필요
    var url;
    if(alertObj.mtype==1){//만약 개인 회원이라면
        if(header=='[결제]')//헤더가 결제라면
            url="/jsp/mypageUser/mypagePs.jsp";
        else if(header=='[완료]')//헤더가 완료라면..이슈
            url="/jsp/mypageUser/mypagePs_com.jsp";
        else if(header=='[답글]')//헤더가 답글이라면
            url="/jsp/mypageUser/mypagePs_com.jsp";
        else if(header=='[취소]')//헤더가 취소라면..이슈
            url="/jsp/mypageUser/mypagePs_com.jsp";
    }else if(alertObj.mtype==2){//만약 업체회원이라면..리뷰 추가해야할 듯
        if(header=='[결제]')//헤더가 결제라면
            url="/jsp/mypageBiz/mpbProg_Num.jsp";
        else if(header=='[취소]')//헤더가 취소라면..이슈
            url="/jsp/mypageBiz/mypageBs_com.jsp";
        else if(header=='[주문]')
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
function crtRoom(guest) {
    var rooms=$('.chatBox'); //먼저 열려있는 채팅방을 검사한다.
    if(rooms!=undefined){//만약 방이 하나이상 존재한다면,
        for(var i=0;i<rooms.length;i++){
            mno=rooms.eq(i) //i 번째 방의
                .attr('id') //id 에서
                .split('room')[0]; //mno부분을 추출한다.
            if(Number(mno)==chatObj.addressee){//열려있는 방 중 이미 상대방과의 채팅방이 있다면,
                return; //아무것도 하지 않고 리턴한다.
            }
        }
    }//열려있는 방 중에 상대방이 없을 경우 ajax 시행으로 넘어감
    $.post({
        url:'/crtRoom.do',
        data:chatObj,
        success:function(result) {//반환값은 map (방번호=roomnum와 채팅로그=charRog가 저장됨)
            var room=JSON.parse(result);
            if(rooms.length==3){//만약 3개의 채팅방이 개설된 상태라면
                rooms.eq(0).remove();//제일 먼저 생성된 채팅방을 지움
            }
            room.guest=guest;//게스트명 입력
            room.addressee=chatObj.addressee;//수신자 번호 입력
            var guestRoomLi=$('#'+room.addressee+'roomLi'+room.roomnum);
            if(guestRoomLi[0]==undefined){//헤더 채팅방 리스트에 상대방과의 채팅방이 없다면,
                printRoomLi(room);//만들어준다.
            }
            printRoom(room);//채팅방 생성
            if(room.chatRog!=undefined){//채팅 로그가 있다면
                appendChat(room.chatRog);    
            }
            initChatObj();//객체 초기화 메서드
        }
    });
}
function initChatObj(){//초기화
    delete chatObj.mno;//mno지움
    delete chatObj.bno;//bno지움
    delete chatObj.roomnum;//방번호 지움
    delete chatObj.content;//채팅내용 지움
    delete chatObj.addressee;//받는이 지움
}
function rlDotCountUp(roomnum){
    var rl=$('#rlDot'+roomnum);
    rl.text(Number(rl.text())+1);//카운트를 하나 올려서 넣어준다.
    rl.show();//무조건 1 이상이므로, show
    initChatDot();//전체 안읽은 개수 초기화
}
function printRoom(room){//필요한 정보:수신자번호,방번호,수신자 명
    $('.chatContainer').append(//채팅방을 만듦
        '<li class="chatBox" id="'+room.addressee+'room'+room.roomnum+'">'+
            '<div class="chatBoxHeader">'+
                '💬ㅤ<span id="guest'+room.roomnum+'">'+room.guest+'</span>'+
                '<i class="fas fa-times closeChatBtn" id="'+room.addressee+'clsBtn'+room.roomnum+'"></i>'+
            '</div>'+
            '<ul class="chatRogUl" id="chatRog'+room.roomnum+'">'+
            '</ul>'+
            '<div class="chatInputBox">'+
                '<textarea class="chatText"placeholder="대화를 입력하세요"></textarea><button id="'+room.addressee+'sendBtn'+room.roomnum+'" class="chatWriteBtn">전송</button>'+
            '</div>'+
        '</li>'
    );
    rlDotToZero(room.roomnum);//헤더의 채팅방 안읽은 개수 초기화
}
function printRoomLi(room){
    $('.chatfooter').append(
        '<ul class="chatList" id="'+room.addressee+'roomLi'+room.roomnum+'">'+
            '<li>'+
                '<p id="guest'+room.addressee+'">'+room.guest+'</p>'+
                '<p id="lastChat'+room.roomnum+'">'+(room.content==undefined?'':room.content)+'</p>'+//컨텐츠가 없을 때는 공백, 있을 때는 정상출력
                '<span class="rlDot" id="rlDot'+room.roomnum+'">'+(room.counts==undefined?0:room.counts)+'</span>'+ //안 읽은 채팅이 없을 때는 0, 있을 때는 정상출력
            '</li>'+
            '<li>'+
                '<button class="chatExitBtn" id="chatExitBtn'+room.roomnum+'">나가기</button>'+
            '</li>'+
        '</ul>'
    );
    if(room.counts!=undefined && room.counts!=0){ //만약 안읽은 채팅의 개수가 0이 아니라면 보이기
        $('#rlDot'+room.roomnum).show();
    }
    initChatDot();//전체 안읽은 개수 초기화
}
function initChatDot(){
    var list=$('.rlDot');
    var count=0;
    for(var i=0;i<list.length;i++){
        count+=Number(list[i].innerHTML);
    }
    if(count==0){
        $('.chatDot').hide();
        $('.chatDot')[0].innerHTML=count;
    }else{
        $('.chatDot')[0].innerHTML=count;
        $('.chatDot').show();
    }
}
function headerRoomLiAjax() {
    $.get({
        url:'/initRoomLi.do',
        data:chatObj,
        success:function(result){
            var list=JSON.parse(result);
            $.each(list,function(key,value){
                printRoomLi(value);
            });
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