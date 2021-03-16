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
table tr {
    padding-bottom: 5px;
}
.content {
float:left;
width: 65vw;
height: 100vh;
padding: 10px 0px 30px 250px;
font-size: 14px;
color: var(--text-gray);
}
.content #card {
    margin: 10px 0 10px 120px ;
    padding-top: 20px;
    border: 1px solid var(--gray-color);
    width: 40vw;
    height: 200px;
}
.content > #card > #info {
    width: 35vw;
    float: left;
    padding-left: 30px;
}
 #card #bsname {
    color: var(--black-color);
    font-size: 14px;
}
#card .fa-star {
    color: var(--text-red);
}
#mymark_title {
    display: inline-block;
    color: var(--black-color)
}
#btn_mark{
    background: none;
    border: 0.5px solid var(--gray-color);
}
#btn_mark .fa-heart{
    color: var(--text-red);
    font-size: 25px;
    padding: 5px;
}
#bsaddress{
    color: var(--black-color);
}
#bsschedule{
    border: 0.2px solid var(--gray-color);
    margin-right: 5px;
    font-size: 12px;
}
#bsphone{
    color: darkolivegreen;
}
#btn_detail{
    border: none;
    background: none;
    color: steelblue;
}
</style>
<script>
    window.onload = function(){
        document.getElementsByClassName("side_sub")[0].style.display = "none"
    }
</script>
</head>

<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>
	  <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
        <div class="content">
            <p id="mymark_title">내가찜한세탁소</p>
            <hr>
            <div id="card">
                <div id="info">
                    <p id="bsname">깨끗빨래방 신촌점</p>
                    <table>
                        <tr>
                            <td><span>2.0<i class="fas fa-star"></i> </span>1건 | 리뷰 2</td>
                        </tr>
                        <tr>
                            <td id="bsaddress">서울 마포구 독막로38길 22 105-107호</td>
                        </tr>
                        <tr>
                            <td>(지번) <span>대흥로 330-2</span></td>
                        </tr>
                        <tr>
                            <td><span id="bsschedule">영업중</span><span>매일 00:00~24:00</span></td>
                        </tr>
                        <tr>
                            <td id="bsphone">02-1234-5678 <button id="btn_detail">상세보기</button></td>
                        </tr>
                    </table>
                </div>
                <button id="btn_mark"><i class="fas fa-heart"></i></button>
            </div>
            <div id="card">
                <div id="info">
                    <p id="bsname">깨끗빨래방 신촌점</p>
                    <table>
                        <tr>
                            <td><span>2.0<i class="fas fa-star"></i> </span>1건 | 리뷰 2</td>
                        </tr>
                        <tr>
                            <td id="bsaddress">서울 마포구 독막로38길 22 105-107호</td>
                        </tr>
                        <tr>
                            <td>(지번)<span>대흥로 330-2</span></td>
                        </tr>
                        <tr>
                            <td><span id="bsschedule">영업중</span><span>매일 00:00~24:00</span></td>
                        </tr>
                        <tr>
                            <td id="bsphone">02-1234-5678 <button id="btn_detail">상세보기</button></td>
                        </tr>
                    </table>
                </div>
                <button id="btn_mark"><i class="fas fa-heart"></i></button>
            </div>
        </div>
    </div>
	



</body>
</html>