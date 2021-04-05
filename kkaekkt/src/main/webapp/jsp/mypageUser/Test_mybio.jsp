<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/mybio.css">
<script>
	$(document).ready(function() {

		/* button click event */
		/* 모달 생성 */
		$("#userDel").click(function() {
			$("#modal_container").show()
		})
		$("#modal_close").click(function() {
			$("#modal_container").hide()
		})
		$("#nope").click(function() {
			$("#modal_container").hide()
		})
	})
</script>
<style>
textarea {
	resize: none;
	height: 12em; /* height 안먹는데 이유를 모름.. */
}

.word {
	width: 100vw;
	height: 100vh;
	position: absolute;
}

/* 모달 container 입니다 기본은 none 상태로 두셔야합니다.
        본인 화면에서 사용할때, position을 정해주셔야 합니다. */
#modal_container {
	display: none;
	position: relative;
	margin: auto;
	width: 364px;
	height: 550px;
	background-color: white;
	border: 1px solid lightgray;
	box-shadow: 5px 12px 5px rgb(212, 212, 212);
}

#starVal {
	float: left;
	margin-left: 21px;
	font-size: 36px;
	width: 28px;
	height: 44px;
	border: 0px;
	background: none;
	text-align: center;
	color: rgba(97, 97, 97, 1);
	font-family: Noto Sans KR;
	font-style: normal;
	font-weight: bold;
}

#modal_close {
	float: right;
	width: 36px;
	height: 36px;
	border: 1px solid;
	background: white;
	margin: 18px 20px 0 0;
	font-size: 24px;
	border: 1px solid lightgray;
}

#modal_bodycont {
	margin-top: 28px;
	height: 80%;
	padding-block: 14px;
}

#modal_head {
	width: 80%;
	height: 80px;
	text-align: center;
	margin: 0 auto;
}

#modal_foot {
	margin: 20px auto;
	width: 80%;
	height: 315px;
}

#review_text {
	width: 100%;
	background-color: rgba(249, 249, 249, 1);
	border-radius: 4px;
	border: 1px solid lightgray;
}

#review_texter {
	float: right;
	font-size: 15px;
	color: lightgray;
}

#sub_review {
	background: rgba(143, 188, 255, 0.48);
	border-radius: 30px;
	border: 0px;
	width: 120px;
	height: 40px;
	margin: 28px 89px;
}
</style>

</head>

<body>
	<jsp:include page="/jsp/header1.jsp"></jsp:include>

	<div class="body_container">
		<jsp:include page="sidebar_ps.jsp"></jsp:include>
		<div class="content">
			<hr>
			<div id="mybio_info">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" id="read" name="id" readonly></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" id="read" name="mname" readonly></td>
					</tr>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input name="password" type="password" id="curpwd">
							<button type="button" id="btn_checkpwd">수 정</button> <label
							id="checkpwd"></label></td>
					</tr>
					<div id="btn_mybiopwd">
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" id="pwd"><label
								id="checkval"></label></td>
						</tr>
						<tr>
							<td>새 비밀번호 확인</td>
							<td><input type="password" id="newpwd">
								<button type="button" id="btn_updatepwd">변경하기</button> <label
								id="match"></label></td>
						</tr>
					</div>
					<tr>
						<td><input type="hidden" name="mno" value="" id="mno">
							<!-- 회원번호 -->
					</tr>
				</table>
				<div id="mybioPhone">
					연락처<br> <input id="phone1" type='text' maxlength='3'>
					- <input id="phone2" type="text" maxlength='4'> - <input
						id="phone3" type="text" maxlength='4'> <input name="phone"
						type="tel" id="phone" value="" hidden>
				</div>
				<div id="mybioBirth">
					생년월일<br> <input name="birth" type="text" id="input2 birth"
						value=""><label id="checkbirth" value=""></label>
				</div>
				<div>
					이메일<br> <input name="email" type="email" value="" id="email"
						class="mail_input">
					<button type="button" id="btn_checkemail" class="mail_check_button">이메일인증</button>
					<label id="checkemail" value=""></label></br>
					<div id="mailChkDiv">
						<input class="mail_check_input" id="mail_check_input_box_false"
							disabled="disabled"><span id='timeout'></span>
						<button type="button" id="mail_check">확인</button>
						</td> <br>
					</div>
				</div>
				<div id="mybioAddress">
					주소<br> <input type="text" id="postcode" placeholder="우편번호">
					<button type="button" onclick=execDaumPostcode() id="btn_address">우편번호
						찾기</button>
					<br> <input type="text" id="roadAddress" placeholder="도로명주소"><br>
					<!-- <span id="guide" style="color:#999;"></span><br> -->
					<input type="text" id="detailAddress" placeholder="상세주소"> <input
						type="text" id="extraAddress" placeholder="참고항목"> <span
						id="guide" style="color: #999; display: none"></span><br> <input
						type="hidden" name="address" id="address" value="">
					<!--여기에 디비로 보낼 도로명주소+상세주소 해서 보내기-->

					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script src="/js/adress.js"></script>

				</div>
			</div>
			<div class="word">
		<!-- 회원탈퇴 -->
		<div class="delete">
			<input type="submit" id="userDel" value="회원탈퇴" />
		</div>
		<div id="modal_container">
			<button id="modal_close">x</button>
			<div id="modal_bodycont">
				<form action="/deletePs.do" method="POST" name="userDel">
					<div id="modal_head">
						<p><input name="name" id="name" value="${sessionScope.user.name} 님" readonly /> </p>
						<p>탈ㅚ 하시겠어요?</p>

						<input id="starVal" value="1">

					</div>
					<hr
						style="width: 80%; margin-top: 40px; border: 1px solid #E5E5E5;">
					<div id="modal_foot">
						<button id="yes" type="button">예</button>						
						<button id="nope" type="button">아니오</button>
					</div>
				</form>
			</div>
		</div>
	</div>
		</div>
	</div>
	
	<script>
		var pageObj = {//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
			mno : '${person.mno}',
			id : '${person.id}',
			name : '${person.mname}',
			password : '${person.password}',
			phone : '${person.phone}',
			birth : '${person.birth}',
			email : '${person.email}',
			address : '${person.address}',

		};
	</script>
	<script src="/js/mybio.js"></script>



</body>

</html>