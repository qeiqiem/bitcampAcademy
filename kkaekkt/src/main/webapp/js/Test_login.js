function login(){
	var Id = $("#id").val();
	var Pw = $("#password").val();
	
	$.ajax({
		type: "POST",
		url: "/idchk.do",
		data: {
			Id: Id,
			Pw: Pw
		},
		success: function(data){
			console.log(data);
			var test = JSON.parse(data);
			if(data){
				data = data.trim();
			}
				if(test.state == 0){
					alert("아이디나 비밀번호를 다시 확인해주세요.");
					$("#id").val();
					$("#password").val();
				}
		}
	});
}