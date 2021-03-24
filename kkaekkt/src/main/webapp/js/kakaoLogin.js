
window.Kakao.init("cf4c8601d1ea3d2f4f0704d04de2729c");

function kakaoLogin(){
    window.Kakao.Auth.login({
        scope:'profile, account_email, birthday',
        success: function(authObj){
            console.log(authObj);
            window.Kakao.API.request({
                url: '/v2/user/me',
                success: res => {
                    const kakao_account = res.kakao_account;
                    
                    var user = kakao_account.email;
                    console.log(user);
                    
                    var userdata = {
                    	email: user
                    }
                    
$.ajax({
	url: '/loginSNS.do',
	type: 'POST',
	data: userdata,
		success: function(data){
		console.log(data);
		console.log("보냄");
		console.log(location.href);
		console.log(window.location.protocol + "/" + window.location.host + "/" + data);
		//location.href = "../../" + data;
		location.href = data;

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