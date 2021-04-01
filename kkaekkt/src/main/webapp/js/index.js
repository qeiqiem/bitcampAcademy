//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;
 
$(document).ready(function (){
    connectWs();
    initAlertList();
	initEvent();
});
function connectWs(){
    socket = new WebSocket("ws://localhost:8080/echo.do");
    socket.onopen = function() {
        console.log('info: connection opened.');
    };
    socket.onmessage = function(evt) { //socket.send 했을 때 데이터를 받는 메서드이다.
        var data = evt.data;
        console.log($('#noticeBox ul'));
        $('#noticeBox ul').prepend(data);
        $('#bellBox .redDot').css('display','unset');//빨간 불 올리기
    };
    socket.onclose = function() {
        console.log('connect close');
    };
    socket.onerror = function (err) {console.log('Errors : ' , err);};
}
function initAlertList() {
    console.log('alert초기화 진입');
    alertObj.datediff=7;//7일 내로 온 알림만 추출
    $.post({
        url:'/getAlertList.do',
        data:alertObj,
        success:function(data) {			
            var list = JSON.parse(data);
            printHeaderList(list);
        }
    });
}
function printHeaderList(list) {    
    $.each(list, function(key,value) {
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
function initEvent() {
    $('#noticeBox ul').on('click','li',function() {
        console.log($(this).attr('id'));
    });
}