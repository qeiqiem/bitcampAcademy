<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="css/mymark.css">
<script src="js/mymark.js"></script>
<style>
*:focus {
    outline: none;
}
hr {
height: 1px;
border: none;
background-color: var(--gray-color);
/* border: solid 0.5px var(--gray-color); */
width: 85%;
margin: 10px 0 20px 0;
}
.content {
float:left;
width: 65vw;
height: 100vh;
padding: 10px 0px 30px 250px;
font-size: 14px;
color: var(--text-gray);
}
.content div {
    padding-top: 20px;
}
.content #card {
    width: 30vw;
    float: left;
    padding-left:10vw;
}

</style>
</head>

<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>

	  <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
        <div class="content">
            <p>내가찜한세탁소</p>
            <hr>
            <div id="card">
                <p id="bsname">깨끗빨래방 신촌점</p>
                <span>2.0<i class="fas fa-star"></i> </span>1건 | 리뷰 2
                <p id="bsaddress">서울 마포구 독막로38길 22 105-107호</p>
                (지번) <span>대흥로 330-2</span><br/>
                <span>영업중</span> <span>매일 00:00~24:00</span> <br/>
                <span id="bsschedule"></span>02-1234-5678<button>상세보기</button>
            </div>
            <div>
                <button><i class="fas fa-heart"></i></button>
            </div>
        </div>
    </div>
	



</body>
</html>