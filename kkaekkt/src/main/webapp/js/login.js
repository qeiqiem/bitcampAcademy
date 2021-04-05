$(document).ready(function() {
  $('#login').click(function(){ 
    login();
  });
});
function login() {
  var userData={
    id:$('#id').val(),
    password:$('#password').val()
  }
  $.post({
    url:"/login.do",
    data:userData,
    success:function(result) {
      if(result=='fail'){
        alert('id 혹은 password가 일치하지 않습니다.')
      }else if(result=='1'){
        location.href="/jsp/indexPerson.jsp";
      }else {
        location.href='/jsp/mypageBiz/mpbProg_Num.jsp';
      }
    }
  })
}