$(document).ready(function () {
  $("#modal_close").click(function() {
    $("#modal_container").hide()
    $("#mask").hide()
  })
  $("#mask").click(function() {
    $("#modal_container").hide()
    $("#mask").hide()
  })
})


function login_show(){
  // $("#modal_show").click(function() {
    $("#modal_container").show()
    $("#mask").show()
  // })
  
}
function login() {
  var userData={
    id:$('#login_id').val(),
    password:$('#login_password').val()
  }
  $.post({
    url:"/login.do",
    data:userData,
    success:function(result) {
      if(result=='fail'){
        alert('아이디 또는 비밀번호가 일치하지 않습니다.');
        
      }else if(result == 1){
        location.href="/index.do";
        
      }else if(result == 2){
        location.href='/jsp/mypageBiz/mpbProg_Num.jsp';
      }
    }
  })
}

function enterkey() {
  if (window.event.keyCode == 13) {

    login();
  }
}