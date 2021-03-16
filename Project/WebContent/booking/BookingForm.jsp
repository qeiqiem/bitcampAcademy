<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="spms.vo.Member"%>
<%
	Member loginAc = (Member) session.getAttribute("loginAc");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BookingForm</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../board/css/bookingForm.css">


</head>

<body>
	<jsp:include page="/Sidebar.jsp" />
	<div class="post_container">
		<div class="title">
			<h2>일정 추가하기</h2>
			<br>
		</div>
	<div class="add_container">
		<form action='insert.do' method='post'>
			<fieldset class="out">
				<legend>BookingForm</legend>
				<div class="form-group">
					<label for="mno">회원번호</label> 
					<input class="form-control" type="text" id="mno" name="mno" value="<%=loginAc.getMno()%>" readonly>
				</div>
				<div class="form-group">
					<label for="nname">닉네임</label> 
					<input class="form-control" type="text" id="nname" name="nname" value="<%=loginAc.getNname()%>" readonly>
				</div>
				<div class="form-group">
					<label for="header">말머리</label> <select id="header" name="header">
						<option selected>말머리 없음</option>
						<option value="산악일정잡기">산악일정잡기</option>
						<option value="일정변경">공지:일정변경</option>
					</select>

				</div>
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="title" placeholder="" name="title">
				</div>

				<fieldset class="in">
					<legend>인원 설정</legend>
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="nop" id="optionsRadios1" value="5"
							checked> 5명
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="nop" id="optionsRadios2"
							value="10"> 10명
						</label>
					</div>
					<div class="form-check">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="nop" id="optionsRadios3"
							value="15"> 15명
						</label>
					</div>
				</fieldset>
				<div class="form-group">
					<label for="loc">위치</label> <input type="text" class="form-control"
						name="loc" id="loc" placeholder="예) 서울시 관악구">
				</div>
				<div class="form-group">
					<label for="rdate">예약일자</label> <input id="crdate" type="date"
						name="rdate" placeholder="0000-00-00" value="" />
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="exampleTextarea" rows="7"
						name="content" cols="50"></textarea>
				</div>
				
				<div class="form_btn">
				<input type="submit" value="추가" onclick='location.href="list.do"' />
				<input type="reset" value="취소" onclick='location.href="list.do"' />
				</div>
				
			</fieldset>
		</form>
		</div>
	</div>
</body>

</html>