$(document).ready(function () {
	/* button click event */
	/* 모달 생성 */
	$("#modal_show").click(function(){ $("#modal_container").show() })
    $("#modal_close").click(function(){ $("#modal_container").hide() })
	$("#nope").click(function () { $("#modal_container").hide() });
	$("#yes").click(function(){deleteUser();})
})

function deleteUser() {
	var userData ={
		id:$('#id').val(),
    	password:$('#pwd').val()
	}
	$.get({
		url:"/deletePs.do",
		data:userData,
		success: function(result){
			if(result=='fail'){
				alert("예약있어서 탈퇴안됨")
			}else {
				location.href="/index.do"
			}
		}
	})
}
