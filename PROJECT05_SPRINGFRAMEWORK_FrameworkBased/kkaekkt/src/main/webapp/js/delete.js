$(document).ready(function () {
	/* button click event */
	/* 모달 생성 */
	
	$("#modal_close").click(function () {
        $("#modal_container").hide() 
        $("#mask").hide();
    })
	$("#nope").click(function () { 
        $("#modal_container").hide() 
        $("#mask").hide();
    });
    $("#mask").click(function () { 
        $("#modal_container").hide() 
        $("#mask").hide();
    });
	
})
function delete_show(){
    $("#modal_container").show() 
    $("#mask").show();
}
function deleteUser() {
	var count = $('.DUorderChk').val();
	var userData = {
		id: $('#deleteid').val(),
		password: $('#deletepwd').val()
	}
	$.post({
      url:"/deletePs.do",
      data:userData,
      success: function(count){
      	let deluser = JSON.parse(count);
            if(deluser == "success"){
            //console.log(deluser);
                alert("회원탈퇴 되었습니다. 메인페이지로 돌아갑니다.");
                location.href="/logout.do";
            }else if(deluser == "fail"){
            //console.log(deluser);
                alert("예약이 있습니다. 다시 한 번 확인해주세요!");
                location.href="/myBio.do";  
            } else {
            	location.href="/index.do";
            }
      }
   })
}
function enterkey() {
    if (window.event.keyCode == 13) {
  
      login();
    }
}
