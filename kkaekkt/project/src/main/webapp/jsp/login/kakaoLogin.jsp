<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a href="javascript:kakaoLogout()">로그아웃</a>
<a href="http://developers.kakao.com/logout">로그아웃링크?</a> 
<a href="javascript:kakaoLogin()"><img src="img/kakao.png"></a>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
//cf4c8601d1ea3d2f4f0704d04de2729c
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
</script>

</body>
</html>