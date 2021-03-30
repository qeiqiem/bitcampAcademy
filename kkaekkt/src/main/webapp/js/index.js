//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;
 
$(document).ready(function (){
    connectWs();
});
function connectWs(){
    sock = new WebSocket("ws://localhost:8080/echo.do");
    //sock = new SockJS('/replyEcho');
    socket = sock;

    sock.onopen = function() {
        console.log('info: connection opened.');
  };

 sock.onmessage = function(evt) { //socket.send 했을 때 데이터를 받는 메서드이다.
      var data = evt.data;
        console.log("ReceivMessage : " + data + "\n");

        // $.ajax({ 알림이 올 때 체크해서 ajax 하는 방식-빨간 볼 뱃지 + 알림의 숫자를 명시하는 태그->참고해서 구현할만함
        //  url : '/mentor/member/countAlarm',
        //  type : 'POST',
        //  dataType: 'text',
        //  success : function(data) {
        //      if(data == '0'){
        //      }else{
        //          $('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
        //          $('#alarmCountSpan').text(data);
        //      }
        //  },
        //  error : function(err){
        //      alert('err');
        //  }
        // });

        // 모달 알림 ---은 안쓸 예정
        /*
        var toastTop = app.toast.create({
         text: "알림 : " + data + "\n",
         position: 'top',
         closeButton: true,
       });
       toastTop.open();
       */
 };

 sock.onclose = function() {
       console.log('connect close');
       /* setTimeout(function(){conntectWs();} , 1000); */
 };

 sock.onerror = function (err) {console.log('Errors : ' , err);};
}
/* 이 부분은 각 페이지에서 알림을 보내고자 할 때 구현할 코드

var AlarmData = {
    "myAlarm_receiverEmail" : receiverEmail,
    "myAlarm_callerNickname" : memNickname,
    "myAlarm_title" : "스크랩 알림",
    "myAlarm_content" :  memNickname + "님이 <a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq="+essayboard_seq+"&mentors="+ memberSeq +"'>" + essayboard_seq + "</a>번 에세이를 스크랩 했습니다."
};
//스크랩 알림 DB저장
$.ajax({
type : 'post',
url : '/mentor/member/saveAlarm',
data : JSON.stringify(AlarmData),
contentType: "application/json; charset=utf-8",
dataType : 'text',
success : function(data){ // 알림을 정상적으로 저장했다면, 
    if(socket){
        let socketMsg = "scrap," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq; //해당 알림의 유형, 보낸사람, 받는사람, 받는 사람의 메일, 시퀀스(..는 모르겠다.) 를 담는다.
        console.log("msgmsg : " + socketMsg);
        socket.send(socketMsg);//해당 메시지를 소켓으로 보낸다. 그러면 자바쪽에서 handleTextMessage(...) 메서드가 실행된다.
    }

},
error : function(err){
    console.log(err);
}
});
*/