<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>산, 산, 산 - 로그인</title>
<link rel="stylesheet" href="/log/css/login.css">
<!-- <link rel="stylesheet" href="/board/css/index.css"> -->

</head>

<body>
	<jsp:include page="/Sidebar.jsp" />
	
    <section class="post_container">
        <div class="login_container">
            <form action="/log/login.do" method="post">
                <div class="login_input">
                    <ul class="login_box">
                        <li>산, 산, 산 <br> <br>
                        </li>
                        <li><input name="id" type="text" placeholder="ID"></li>
                        <li><input name="pwd" type="text" placeholder="Password">
                        </li>
                    </ul>
                </div>
                <div class="login_box login_btn">
                    <button type="submit">로그인</button>
                    <button type="submit">회원가입</button>
                </div>
            </form>
        </div>
    </section>

</body>

</html>