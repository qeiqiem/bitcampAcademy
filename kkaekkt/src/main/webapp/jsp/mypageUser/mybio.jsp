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
<link rel="stylesheet" href="css/mybio.css">
<script src="js/mybio.js"></script>
</head>

<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>

	  <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
	  	<div class="content">
        <form action="updatePs.do" method="POST" name="mybio">
        <h3 id="mybio_title">내 정보</h3>
        <button type="button" id="btn_mybio">수정하기</button>
        <div id="btn_mybioClick">
            <button type="submit" id="btn_mybiofin">수정완료</button>
            <button type="reset" id="btn_back">돌아가기</button>
        </div>
        <hr>
            <div id="mybio_info">
                <table>
                    <tr>
                        <td>아이디</td>
                        <!--<td><input type="text" id="read" name="id" value="${sessionScope.member.id}" readonly></td>-->
                        <td><input type="text" id="read" name="id" value="tnwjd" readonly></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <!--<td><input type="text" id="read" name="name" value="${sessionScope.member.name}" readonly></td>-->
                        <td><input type="text" id="read" name="name" value="양수정" readonly></td>
                    </tr>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input name="password" type="password" id="curpwd"> <button type="button" id="btn_checkpwd">수 정</button><label id="checkpwd"></label>
                        </td>
                    </tr>
                    <div id="btn_mybiopwd">
                        <tr>
                            <td> 새 비밀번호</td>
                            <td><input type="password"><label id="checkval"></label></td>
                        </tr>
                        <tr>
                            <td>새 비밀번호 확인</td>
                            <td><input type="password" id="newpwd"> <button type="button" id="btn_updatepwd">변경하기</button> 
                            <label id="match"></label></td>
                        </tr>
                    </div>
                    <tr>
                        <td><input type="hidden" name="mno" value="1" id="mno"> <!-- 회원번호 -->
                   
                    </tr>
                </table>
                    <div id="mybioPhone">
                        연락처<br>
                       
                        <!-- 
                        <%--
                        <c:set var="tel" value="${fn:split(sessionScope.member.phone, '-')}">
                        <input id="phone1" type="text" value="${fn:split(sessionScope.member.phone, '-')[0]}"> - 
                        <input id="phone2" type="text" value="${fn:split(sessionScope.member.phone, '-')[1]}"> -
                        <input id="phone3" type="text" value="${fn:split(sessionScope.member.phone, '-')[2]}">
                        </c:set>
                        --%>
                        -->
                     
                      	<input id="phone1" type="text" maxlength='3'> - 
                        <input id="phone2" type="text" maxlength='4'> -
                        <input id="phone3" type="text" maxlength='4'>
                        <input name="phone" type="tel" id="phone" value="" hidden>
                    </div>
                <div id="mybioBirth">
                    생년월일<br>
                    <!--<input name="birth" type="text" id="input2" value="${sessionScope.member.id}"><label id="checkbirth" value=""></label>-->
                    <input name="birth" type="text" id="input2" value=""><label id="checkbirth" value=""></label>
                </div>
                <div>
                    <!-- 이메일도 api로 하기로 했던 거 같아ㅓ 일단 인풋박스만 만들었습니다 -->
                    이메일<br>
                    <input name="email" type="email" value="${sessionScope.member.id}" id="input2"> 
                    <button type="button" id="btn_checkemail">이메일인증</button><label id="checkemail" value=""></label>
                
                </div>
                <div id="mybioAddress">
                    <!-- 주소는 api로 하기로 했었던 거 같아서 일단 인풋박스만 만들었습니다 -->
                    주소<br>
                    <input name="address" type="text" placeholder="우편번호">
                    <button type="button" id="btn_address">우편번호 찾기</button>
                    <br>
                    <input type="text" placeholder="도로명주소">
                    <input type="text" id="" placeholder="지번주소">
                    <br>
                    <input type="text" placeholder="상세주소">
                    <input type="text" placeholder="참고사항">

                </div>
            </div>
        </form> 
        </div>
    </div>
	



</body>
</html>
