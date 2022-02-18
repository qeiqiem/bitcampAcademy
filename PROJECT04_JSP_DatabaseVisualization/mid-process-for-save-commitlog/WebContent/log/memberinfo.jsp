<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="spms.vo.Member" %>
<%Member loginAc = (Member)session.getAttribute("loginAc");%>
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
			<form action="/log/delete.do">

				<h2>내 정보</h2>
				<div class="join_list">
					<div>
						<ul class="join_info">
							<li>이름</li>
							<li>아이디</li>
							<li>닉네임</li>
							<li>주민등록번호</li>
							<li>전화번호</li>
							<li>주소</li>
						</ul>
					</div>
					<div class="join_input">
						<ul>
							<li><%=loginAc.getMname()%></li>
							<li><%=loginAc.getId()%></li>
							<li><%=loginAc.getNname()%></li>
							<li><%=loginAc.getRrn1()%> - *******</li>
							<li><%=loginAc.getPhone1()%> - <%=loginAc.getPhone2()%> - <%=loginAc.getPhone3()%></li>
							<li><%=loginAc.getAddress()%></li>
						</ul>
					</div>
				</div>
				<div class="join_btn">
					<button type="button" onclick="location.href='/log/update.do'">수정</button>
					<input type="hidden" name="no" value="<%=loginAc.getMno()%>">
					<button type="submit">탈퇴</button>
				</div>
			</form>
		</div>
	</section>
</body>
</html>
