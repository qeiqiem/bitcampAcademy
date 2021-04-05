$(document).ready(function () {
	/* button click event */
	/* 모달 생성 */
	$("#modal_show").click(function(){ $("#modal_container").show() })
    $("#modal_close").click(function(){ $("#modal_container").hide() })
	$("#nope").click(function () { $("#modal_container").hide() });
	$("#yse").click(function(){deleteUser();})
})

function deleteUser() {
	var userData ={
		id:$('#id').val(),
    	password:$('#password').val()
	}
	$.get({
		url:"/deletePs.do",
		data:userData,
		success: function(vo){
			if(vo=='fail'){
				alert("예약있어서 탈퇴안됨")
			}else {
				location.href="/jsp/index.jsp"
			}
		}
	})
}
