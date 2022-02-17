<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="/css/mybio.css">
		<link rel="stylesheet" href="/css/delete.css">

	</head>

	<body>
		<jsp:include page="/jsp/headerPs.jsp"></jsp:include>

		<div class="body_container">
			<div id="mask"></div>
			<jsp:include page="sidebar_ps.jsp"></jsp:include>
			<div class="content">
				<style>
					.content {
						width: 72%;
					}
				</style>
				<form action="/updatePs.do" method="POST" name="mybio">
					<div class="content_header">
						<p>내 정보</p>
					</div>
					<hr>
					<div id="btn_update">
						<button type="button" id="btn_mybio">수정하기</button>
						<div id="btn_mybioClick">
							<button type="button" id="btn_back">돌아가기</button>
							<button type="button" id="btn_mybiofin">수정완료</button>
						</div>
					</div>

					<div id="mybio_info">
						<div id="clickmask"></div>
						<div class="wrap_info">
							<table id="info_left">
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
										<button type="button" id="btn_checkpwd">수정하기</button> <br>
										<label id="checkpwd"></label>
									</td>
								</tr>
								<div id="btn_mybiopwd">
									<tr>
										<td>새 비밀번호</td>
										<td>
											<input type="password" id="pwd"><br>
											<label id="checkval"></label>
										</td>
									</tr>
									<tr>
										<td>새 비밀번호 확인</td>
										<td><input type="password" id="newpwd">
											<button type="button" id="btn_updatepwd">변경하기</button> <br>
											<label id="match"></label>
										</td>
									</tr>
								</div>
								<tr>
									<td><input type="hidden" name="mno" value="" id="mno">
										<!-- 회원번호 -->
								</tr>
							</table>
							<table id="info_right">
								<tr>
									<td>연락처</td>
									<td id="mybioPhone"><input id="phone1" type='text' maxlength='3'>- <input
											id="phone2" type="text" maxlength='4'> - <input id="phone3" type="text"
											maxlength='4'></td>
									<input name="phone" type="tel" id="phone" value="" hidden>
								</tr>
								<tr>
									<td>생년월일</td>
									<td id="mybioBirth">
										<input name="birth" type="text" id="input2 birth" value=""><br>
										<label id="checkbirth" value=""></label>
									</td>
								</tr>
								<tr>
									<td id="emailText">이메일</td>
									<td>
										<input name="email" type="email" value="" id="email" class="mail_input">
										<button type="button" id="btn_checkemail" class="mail_check_button">이메일
											인증</button><br>
										<label id="checkemail" value=""></label></br>
										<div id="mailChkDiv">
											<input class="mail_check_input" id="mail_check_input_box_false"
												disabled="disabled"><span id='timeout'></span>
											<button type="button" id="mail_check">확인하기</button>
									</td>
									<br>
						</div>
						</td>
						</tr>
						</table>

					</div>
					<div id="mybioAddress">
						주소<br><br> <input type="text" id="postcode" placeholder="우편번호">
						<button type="button" onclick=execDaumPostcode() id="btn_address">우편번호
							찾기</button>
						<br> <input type="text" id="roadAddress" placeholder="도로명주소"><br>
						<!-- <span id="guide" style="color:#999;"></span><br> -->
						<input type="text" id="detailAddress" placeholder="상세주소">
						<input type="text" id="extraAddress" placeholder="참고항목">
						<span id="guide" style="color: #999; display: none"></span><br>
						<input type="hidden" name="address" id="address" value="">
						<!--여기에 디비로 보낼 도로명주소+상세주소 해서 보내기-->

						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script src="/js/adress.js"></script>

					</div>
			</div>

			</form>
			<!-- 모달부분 -->
			<div id="mask"></div>
			<p id="textDel">
				kkækkt을 탈퇴하고 싶으신가요? 정말요?...
				<a href="#" onclick="delete_show();" id="modal_show" style="cursor: pointer;">회원탈퇴</a>
				<input type="hidden" class="DUorderChk" value="${reservation.count}" />
			</p>
			<style>
				#textDel {
					margin-left: 0;
				}

				#mask {
					top: 0;
					left: 0;
				}
			</style>
			<div class="word">
				<div id="modal_container">
					<button id="modal_close">
						<i class="fas fa-times"></i>
					</button>
					<div id="modal_bodycont">
						<!--  <form action="/deletePs.do" name=form method="POST">-->
						<div id="modal_head">
							<div>
								<input name="name" id="name" value="${sessionScope.user.name} 님" readonly>
							</div>
							<!-- <hr> -->
							<p>탈퇴하면 모든 정보가 지워집니다. <br>정말 탈퇴하시겠어요?</p>
							<div>
								<input id="deleteid" name="id" value="${sessionScope.user.id}" readonly />
								<br>
								<input type="password" name="password" id="deletepwd" onkeyup="enterkey();"
									placeholder="비밀번호">
							</div>
						</div>

						<div id="modal_foot">
							<input id="yes" type="button" value="예" onclick="deleteUser();" />
							<input id="nope" type="button" value="아니오" />
						</div>
						<!--  </form> -->
					</div>
				</div>
			</div>
		</div>
		</div>
		<script>
			var pageObj = {//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
				mno: '${person.mno}',
				id: '${person.id}',
				name: '${person.name}',
				password: '${person.password}',
				phone: '${person.phone}',
				birth: '${person.birth}',
				email: '${person.email}',
				address: '${person.address}',

			};
		</script>
		<script src="/js/mybio.js"></script>
		<script src="/js/delete.js"></script>




	</body>

	</html>