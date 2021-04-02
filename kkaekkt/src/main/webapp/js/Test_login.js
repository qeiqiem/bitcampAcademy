function login(){ // onclick 할 function 이름
	// 입력한 값을 저장
	console.log("탐");
	var Id = $("#id").val();
	var Pw = $("#password").val();
	
	// ajax 시작
	$.ajax({
		type: "POST",
		url: "/loginPs.do", // 내가 정보를 보낼 컨트롤러 value controller에는 @ResponseBody가 있어야함
		data: {
			Id: Id, // 키 : 값
			Pw: Pw
		},
		success: function(data){
			console.log(data);
			var test = JSON.parse(data);
			if(data){
				data = data.trim();
			}
				if(test.mno == 0){
					alert("아이디나 비밀번호를 다시 확인해주세요.");
					$("#id").val();
					$("#password").val();
					location.href = "/jsp/login/loginPs.jsp";
				}else {
					location.href = "/jsp/indexPerson.jsp";
				}
		} // 이 뒤에 false, 해도 됨
	});
}