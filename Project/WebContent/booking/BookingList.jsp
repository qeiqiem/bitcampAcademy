<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
<style>
.tg1 {width:20px;} .tg2 {width:30%;} .tg3 {width:10%;} .tg4 {width:20%;} .tg5 {width:10%;} .tg6 {width:10%;} .tg7 {width:10%;} 
.trtable {
background-color: #fff;
}
.trtable:hover {
background-color: #e9e9e9;
}
#Wrap {
   width: 1160px;
   position: relative;
}
.left {
   float:left;
}
.right {
   position: absolute;
   right: 70px;
   top: 70px;
   width: 810px;
}
.btn_right {
   position: absolute;
   right: 70px;
   top: 10px;
}
</style>
<body>
   <div id="Wrap">
   <div class="left"><jsp:include page="/Sidebar.jsp" /></div>
   <div class="btn_right"><button type="button" class="btn btn-light" onclick='location.href="/booking/insert.do"'>추가하기</button></div>
   <div class="right">
   <table class="table tabletop"  style="width: 100%; margin: auto;">
        <thead>
            <tr>
              <th class="tg1">글번호</th>
              <th class="tg2">제목</th>
              <th class="tg3">글쓴이</th>
              <th class="tg4">작성일자</th>
              <th class="tg5">추천</th>
              <th class="tg6">조회</th>
              <th class="tg7">참가인원</th>
            </tr>
          </thead>
          <tbody>
      <c:forEach var="booking" items="${bookings}">
            <tr class="trtable">
              <td class="tg1">${booking.bno}</td>
            <td class="tg2"> <a href="view.do?bno=${booking.bno}">${booking.title}</a></td>
              <td class="tg3">${booking.nname}</td>
              <td class="tg4">${booking.cre_date}</td>
              <td class="tg5"></td>
              <td class="tg6">${booking.mark}</td>
              <td class="tg7">${booking.min_nop} / ${booking.nop}</td>
            </tr>
      </c:forEach>
          </tbody>
    </table>
    </div>
    </div>
   
</body>