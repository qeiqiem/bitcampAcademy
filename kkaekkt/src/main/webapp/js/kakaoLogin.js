
window.Kakao.init("cf4c8601d1ea3d2f4f0704d04de2729c");

function kakaoLogin(){
    window.Kakao.Auth.login({
        scope:'profile, account_email, birthday',
        success: function(authObj){
            console.log(authObj);
            window.Kakao.API.request({
                url: '/v2/user/me',
                success: res => {
                    const kakao = res.kakao_account;
                    
                    var userNick = kakao.NickName;
                    console.log(userNick);
                    var userEmail = kakao.email;
                    console.log(userEmail);
                    
                    
                    var userdata = {
                    	nick: userNick,
                    	email: userEmail
                    }
                    
$.ajax({
	url: '/findemail.do',
	type: 'POST',
	data: {
		email: $('#email').val(),
	},
	success: function(data){		
		console.log("보냄");
		console.log(data);
		var info = JSON.parse(data);
		
	if(info.emailchk != 0){
		alert("회원정보 없음");
		$('#email').val();
	} //else {
		//console.log(location.href);
		//console.log(window.location.protocol + "/" + window.location.host + "/" + data);
		// location.href = "../../" + data;
		//location.href = data;
	//}
		}
}); // ajax

                }
                
            });
        }
    
    });
}


function kakaoLogout(){
    //Kakao.init();
    //Kakao.isInitialized();
    
    if(!Kakao.Auth.getAccessToken()){
        console.log('Not logged in.');
        return;
    }
    Kakao.Auth.logout(function(){
        console.log(Kakao.Auth.getAccessToken());
    });
}