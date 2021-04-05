<!-- NAVER API -->
<script type="text/javascript" src="../vendor/js/common/naveridlogin_js_sdk_2.0.0.js"></script>
<script type="text/javascript">
var naverLogin = new naver.LoginWithNaverId(
	{
		clientId: "kEvFCZyOPXmysr20FrkK",
		callbackUrl: "http://localhost:8080/jsp/login/callback.jsp",
		isPopup: true /* 팝업을 통한 연동처리 여부 */
	}		
);

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var id			= naverLogin.user.getId();
			var nm			= naverLogin.user.getName();
			var gender		= naverLogin.user.getGender();
			var birthday	= naverLogin.user.getBirthday();
			var email		= naverLogin.user.getEmail();
			
			var isRequire = true;
			if(nm == 'undefined' || nm == null || nm == '') {
				alert('이름은 필수 정보입니다. 정보제공을 동의해주세요.');
				isRequire = false;
			} else if(email == 'undefined' || email == null || email == '') {
				alert('이메일은 필수 정보입니다. 정보제공을 동의해주세요.');
				isRequire = false;
			}
			
			
			if(isRequire == false) {
				naverLogin.reprompt(); // 필수정보를 얻지 못 했을 때 다시 정보제공 동의 화면으로 이동
				return;	
			}
			
			window.opener.document.loginForm.method = "post";
			window.opener.document.loginForm.action = "joinSimple.html"
			window.opener.document.loginForm.submit();
			window.close();
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});