<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<link rel="stylesheet" href="/css/find.css">
		<script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<style>
			.val input {
				margin: 0 0 15px;
			}

			.val button {

				margin-top: 15px;
			}

			.veri_btn {
				height: 250px;
			}
		</style>
	</head>

	<body>
		<jsp:include page="/jsp/header0.jsp"></jsp:include>

		<div class="body_container">
			<nav class="find_nav">
				<div class="id" onclick="showID()">아이디 찾기</div>
				<div class="pw" onclick="showPW()">비밀번호 찾기</div>
				<p>
					<span style="font-weight:bolder;">${userPw.id}</span>님, 해당 아이디에 등록된 이메일로 인증 후 비밀번호 변경이 가능합니다.
				</p>
			</nav>

			<!-- <form action="" method="POST">
				<div class="veri_btn val" style="text-align: center;">
					<p>
						${userPw.email}로 인증 메일을 전송하시겠습니까?
					</p>
					<div class="verify">
						<input name="email" type="email" value="${userPw.email}" id="email" class="mail_input">
						<button type="button" id="btn_checkemail" class="mail_check_button">인증번호
							전송</button><label id="checkemail" value=""></label></br>
						<input class="mail_check_input" id="mail_check_input_box_false" disabled="disabled">
						<button type="button" id="mail_check">인증하기</button>
						<br><label id="reqinput"></label>



					</div>
			</form> -->

			<div class="veri_btn val" style="text-align: center;">
				<div>
					<p>
						${userPw.email}로 인증 메일을 전송하시겠습니까?
					</p>
					<!-- <input type="email" name="email" id="email" disabled> -->
					<input name="email" type="email" value="" id="email" class="mail_input">
					<button type="button" id="btn_checkemail" class="mail_check_button" onclick="fn_emailchk()">인증번호
						전송</button><label id="checkemail" value=""></label></br>
					<div id="mailChkDiv">
						<input class="mail_check_input" id="mail_check_input_box_false" disabled="disabled">
						<button type="button" id="mail_check">인증하기</button>
						<span id='timeout'></span>
					</div>
					<br><label id="reqinput" style="color: var(--key-color);"></label>
				</div>

				<div>
					<form action="" method="POST">
						<p>
							변경할 비밀번호를 입력해 주세요.
						</p>
						<p>새 비밀번호</p>
						<!-- <label for="pw"> <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
								id="pw" minlength="8" maxlength="16">
						</label> -->
						<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" id="pw" minlength="8"
							maxlength="16">
						<br><label id="pw_label"></label>

						<p>새 비밀번호 확인</p>
						<!-- <label for="repw"> <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
								name="password" id="repw" minlength="8" maxlength="16">
						</label> -->
						<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" name="password"
							id="repw" minlength="8" maxlength="16">
						<br><label id="repw_label"></label>

						<!-- <p style="font-size: smaller;"> </p> -->
						<button type="submit" id="submit" onclick="submit()">변경하기</button>
					</form>
				</div>
			</div>






			<div class="mail">
				아이디가 기억나지 않는다면 아이디를 먼저 찾아주세요. <br> 비밀번호 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
			</div>
		</div>
		<!-- <script src="/js/find.js"></script> -->
		<script src="/js/findPw.js"></script>
	</body>

	</html>