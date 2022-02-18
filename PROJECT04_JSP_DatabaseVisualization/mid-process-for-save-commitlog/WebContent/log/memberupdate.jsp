<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="spms.vo.Member" %>
<%Member loginAc = (Member)session.getAttribute("loginAc");%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>산, 산, 산 - 회원가입</title>
<link rel="stylesheet" href="/log/css/update.css">
</head>

<body>
	<jsp:include page="/Sidebar.jsp" />
	 <section class="post_container">
        <div class="join_container">
            <form action="/log/update.do" method="post">
                <h2>수정하기</h2>
                <div class="join_list">
                    <div>
                        <ul class="join_info">
                            <li>이름</li>
                            <li>닉네임</li>
                            <li>아이디</li>
                            <li>비밀번호</li>
                            <li>주민등록번호</li>
                            <li>전화번호</li>
                            <li>주소</li>
                        </ul>
                    </div>
                    <div class="join_input">
                        <ul>
                            <li>
                            	<input type="hidden" name="mno" value='<%=loginAc.getMno()%>'>
                                <input type="text" name="mname" value='<%=loginAc.getMname()%>' readonly>
                            </li>
                            <li>
                                <input type="text" name="nname" value='<%=loginAc.getNname()%>'>
                            </li>
                            <li>
                                <input type="text" name="id" value='<%=loginAc.getId()%>' readonly>
                            </li>
                            <li>
                                <input type="password" name="pwd" placeholder="Password" value='<%=loginAc.getPwd()%>'>
                            </li>

                            <li>
                                <input type="text" name="rrn1" size="10" maxlength="6" value='<%=loginAc.getRrn1()%>' readonly> -
                                <input type="password" name="rrn2" size="10" maxlength="7" value='<%=loginAc.getRrn2()%>' readonly>
                            </li>

                            <li>
                                <div class="phone_no">
                                    <select name="phone1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                        <option value="070">070</option>
                                    </select> -
                                    <input type="text" name="phone2" size="6" value='<%=loginAc.getPhone2()%>' > -
                                    <input type="text" name="phone3" size="6" value='<%=loginAc.getPhone3()%>'>
                                </div>
                            </li>
                            <li>
                                <input type="text" size="30" name="address" value='<%=loginAc.getAddress()%>'>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="join_btn">
                    <button type="button" onclick="location.href='/log/info.do'">취소</button>
                    <button type="submit">완료</button>
                </div>
            </form>
        </div>
    </section>
</body>

</html> 
