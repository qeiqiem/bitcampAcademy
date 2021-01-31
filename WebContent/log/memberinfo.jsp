<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>산, 산, 산 - 내 정보 보기</title>
<link rel="stylesheet" href="/log/css/memberinfo.css">
</head>

<body>
	<jsp:include page="/Sidebar.jsp" />
	<section class="post_container">
		<div class="join_container">
			<form action="">

				<h2>내 정보</h2>
				<div class="join_list">
					<div>
						<ul class="join_info">
							<li>이름</li>
							<li>아이디</li>
							<li>닉네</li>
							<li>주민등록번호</li>
							<li>전화번호</li>
							<li>주소</li>
						</ul>
					</div>
					<div class="join_input">
						<ul>
							<li>${session.members.mname }</li>
							<li>${session.members.nname}</li>
							<li>${session.members.id }</li>
							<li>${session.members.rrn1 } - ${session.members.rrn2 }</li>
							<li>${session.members.phone1} - ${session.members.phone2} -
								${session.members.phone3}</li>
							<li>${session.members.address</li>
						</ul>
					</div>

				</div>
				<div class="join_btn">
					<button type="submit" onclick="location.href=''">수정</button>
					<button type="submit">탈퇴</button>
				</div>


			</form>
		</div>
	</section>
</body>

</html>