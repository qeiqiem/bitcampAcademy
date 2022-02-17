<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트폼</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../board/css/bookingForm.css">

</head>
<body>
	<jsp:include page="/Sidebar.jsp" />
	<div class="post_container">
		<div class="title">
			<h2>일정 수정하기</h2>
			<br>
		</div>


		<div class="update_container">
			<form action="/booking/allUpdate.do" method='post'>
				<fieldset class="out">
					<legend>BookingUpdateForm</legend>
					<div class="form-group">
						<label for="bno">글 번호</label> <input id="bno" type="text"
							name="bno" value="${booking.bno}" aria-describedby="bnoHelp"
							readonly /> <small id="bnoHelp" class="bno">수정 불가</small>
					</div>
					<div class="form-group">
						<label for="nname">닉네임</label> <input id="nname" type="text"
							name="nname" value="${booking.nname}"
							aria-describedby="nnameHelp" readonly /> <small id="nnameHelp"
							class="nname">수정 불가</small>
					</div>
					<div class="form-group">
						<label for="header">말머리</label> <select id="header" name="header">
							<option selected>말머리 없음</option>
							<option value="산악일정잡기">산악일정잡기</option>
							<option value="일정변경">공지:일정변경</option>
						</select>
					</div>
					<div class="form-group">
						<label for="title">제목</label> <input id="title" type="text"
							name="title" value="${booking.title}" />
					</div>
					<fieldset class="in">
						<legend>인원 설정</legend>
						<div class="form-check">
							<label class="form-check-label"> <input type="radio"
								class="form-check-input" name="nop" id="optionsRadios1"
								value="5" checked> 5명
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
						<label for="loc">위치</label> <input id="loc" type="text" name="loc"
							value="${booking.loc}" />
					</div>
					<div class="form-group">
						<label for="rdate">예약일자</label> <input id="crdate" type="date"
							name="rdate" placeholder="0000-00-00" value="${booking.rdate}" />
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" id="exampleTextarea" rows="7"
							name="content" cols="50" /></textarea>

					</div>
					<input id="isUpdate" type="hidden" name="isUpdate" value="1" /> <input
						type="submit" value="수정" /> <input type="reset" value="취소"
						onclick='location.href="list.do"' />
				</fieldset>
			</form>
		</div>
</body>

</html>