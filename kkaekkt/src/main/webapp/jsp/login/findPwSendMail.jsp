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
			/* .val input {
				margin: 0 0 15px;
			}

			.val button {

				margin-top: 15px;
			}

			.veri_btn {
				height: 250px;
			} */
		</style>
	</head>

	<body>
		<jsp:include page="/jsp/header.jsp"></jsp:include>

		<div class="body_container">
			<div class="wrapper_find">
				<nav class="find_nav">
					<div class="id" onclick="showID()">아이디 찾기</div>
					<div class="pw" onclick="showPW()">비밀번호 찾기</div>
				</nav>

				<div id="findPW">
					<form action="/updatePw.do" method="POST">
						<p>
							<span style="font-weight:bolder;">${userPw.id}</span>님, 해당 아이디에 등록된 이메일로 인증 후 비밀번호 변경이
							가능합니다.
						</p>
						<div class="veri_btn val" style="text-align: center;">
							<div>
								<p>
									<span id="emailVal"></span>${userPw.email}로 인증 메일을 전송하시겠습니까?
								</p>
								<!-- <input name="id" type="test" value="${userPw.id}" id="id" placeholder="id">
						<input name="email" type="email" value="${userPw.email}" id="email" class="mail_input"
							placeholder="email"> -->
								<input name="id" type="test" value="" id="id" placeholder="id">
								<input name="email" type="email" value="" id="email" class="mail_input"
									placeholder="email">

								<button type="button" id="btn_checkemail" class="mail_check_button"
									onclick="fn_emailchk()">인증번호
									전송</button><label id="checkemail" value=""></label></br>
								<div id="mailChkDiv">
									<input class="mail_check_input" id="mail_check_input_box_false" disabled="disabled">
									<button type="button" id="mail_check">인증하기</button>
									<span id='timeout'></span>
								</div>
								<br><label id="reqinput" style="color: var(--key-color);"></label>
							</div>

							<div class="verify">
								<p>
									변경할 비밀번호를 입력해 주세요.
								</p>
								<p>새 비밀번호</p>
								<!-- <label for="pw"> <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
								id="pw" minlength="8" maxlength="16">
						</label> -->
								<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" id="pw"
									minlength="8" maxlength="16">
								<br><label id="pw_label"></label>

								<p>새 비밀번호 확인</p>
								<!-- <label for="repw"> <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
								name="password" id="repw" minlength="8" maxlength="16">
						</label> -->
								<input type="password" value="" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자"
									name="password" id="repw" minlength="8" maxlength="16">
								<br><label id="repw_label"></label>

								<!-- <p style="font-size: smaller;"> </p> -->
								<button type="submit" id="submit" onclick="">변경하기</button>
							</div>
						</div>
					</form>
					<!-- mail 안내사항 -->
					<div class="mail">
						<br> 비밀번호 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
					</div>
				</div>


				<div id="findID" style="display: none;">
					<form action="/findId.do" method="POST" onsubmit="return check()">
						<div class="veri_btn idBox">
							<p>아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다.</p>
							<!-- <div class="veri_btn idBox" onclick="check()"> -->
							<!-- <i class="far fa-envelope"></i> -->
							<!-- <i class="fas fa-envelope"></i> -->
							<!-- 내 정보에 저장된 이메일로 찾기 -->
							<!-- <input type="button" id="veri" value="" /> -->
							<ul>
								<li>
									<input id="inName" type="text" name="name" placeholder="이름을 입력하세요."> <br>
								</li>
								<li>
									<input id="inMail" type="text" name="email" placeholder="가입 시 등록한 이메일을 입력하세요."> <br>
								</li>
							</ul>
							<button type="submit">다음</button>
						</div>
					</form>

					<!-- mail 안내사항 -->
					<div class="mail">
						아이디 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
					</div>
				</div>
			</div>
		</div>
		<script src="/js/find.js"></script>
		<script src="/js/findPw.js"></script>
	</body>

	</html>