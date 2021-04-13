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
        var array=data.split(',');
        var msgType=array[0];
        var msgText=array[1];
        if(msgType==0){//메시지 타입이 알람이라면
            $('#noticeBox ul').prepend(msgText);
            upDotCount();
        }else{//메시지 타입이 채팅이라면
            //채팅방이 있는 지 확인
            //채팅방이 없다면 채팅방 만들기(+redDotCount+)
            //채팅방이 있다면 채팅방이 현재 열려있는지 체크하기
                            //채팅방이 열려있다면 채팅방에 텍스트를 추가하기
                            //채팅방이 열려있지 않다면 redDotCount++
        }
    };
    socket.onclose = function() {
        console.log('connect close');
    };
    socket.onerror = function (err) {console.log('Errors : ' , err);};
}