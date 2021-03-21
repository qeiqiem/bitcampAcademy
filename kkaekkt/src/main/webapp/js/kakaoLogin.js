
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
					console.log(kakao_account);
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
