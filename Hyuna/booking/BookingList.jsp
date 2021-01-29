<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
	<p><a href='insert.do'>추가하기</a></p>
	<c:forEach var="booking" items="${bookings}"><!-- vo component -->
		글번호 : ${booking.bno}<br>
		회원번호 : ${booking.mno}<br>
		말머리 : ${booking.header}<br>
		글제목 : ${booking.title}<br>
		작성자 : ${booking.nname}<br>
		작성일 : ${booking.cre_date}<br>
		인원수 : ${booking.nop}<br>
		예약설정 : ${booking.rdate}<br>
		내용 : ${booking.content}<br>
		찜하기 : ${booking.mark}<br>
		댓글 : ${booking.comm}<br>
		위치 : ${booking.loc}<br>
		사진 : ${booking.picture}<br>
	</c:forEach>
</body>
</html>