//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;
 
$(document).ready(function (){
    connectWs();
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
        /* setTimeout(function(){conntectWs();} , 1000); */
    };
    socket.onerror = function (err) {console.log('Errors : ' , err);};
}
function initAlertList() {
    $.post({
        url:'/getAlertList.do',
        data:alertObj,
        success:function(data) {
            var list = JSON.parse(data);
            printAlertList(list);
        }
    });
}
function printAlertList(list) {
    var link="";
    $.each(list, function(key,value) {
        $('.noticeBox ul').append('<li>'+
                                    '<div class="msgTop">'+
                                        '<a href="/jsp/mypageUser/mypagePs.jsp">'+value.typename+'⠀'+alertObj.msg+'</a>'+
                                    '</div>'+
                                    '<div class="msgBottom">'+
                                        '<span class="date">'+value.date+'</span>'+
                                        '<span class="byBs">by '+value.sender+'</span>'+
                                    '</div>'+
                                    '<i class="fas fa-times"></i>'+
                                '</li>'
        );
    });
}