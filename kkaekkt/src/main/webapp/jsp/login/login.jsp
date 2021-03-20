<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.body_container {
	text-align: center;
	padding-top: 60px;
}

img {
	width: 60px;
	height: 60px;
}

hr {
	height: 0.5px;
	border: none;
	background-color: var(- -gray-color);
	/* border: solid 0.5px var(--gray-color); */
	width: 85%;
}

#btn_login {
	width: 324px;
	height: 59px;
	left: 557px;
	top: 478px;
	margin-bottom: 20px;
}

input {
	width: 326px;
	height: 50px;
	left: 556px;
	top: 339px;
	margin: 10px;
}
</style>
</head>


<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>

	<div class="body_container">
		<form action="/login.do" method="post">
			<h3>로그인</h3>
			<hr>
			<div>
				<input type="text" name="id" placeholder="아이디">
			</div>
			<div>
				<input type="password" name="password" placeholder="비밀번호">
			</div>
			<input type="submit" value="로그인">

			<div>
				<div>
					<a href="">아이디/비밀번호 찾기</a>
				</div>
				<hr>
				<div>
					<p>다른 계정으로 로그인</p>

					<!--api끌어오는거에 따라 가지수는 줄 수 있습니다...-->
					<a href="naverLogin.jsp"><img src="/img/naver.png"></a> <a
						href="facebookLogin.jsp"><img src="/img/facebook.png"></a> <a
						href="googleLogin.jsp"><img src="/img/google.png"></a> <a
						href="kakaoLogin.jsp"><img src="/img/kakao.png"></a>
				</div>
				<hr>
			</div>
		</form>
	</div>
	<!-- 바디콘테이너 -->
</body>

</html>
