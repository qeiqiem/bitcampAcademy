<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/loginBs.css">
</head>

<body>
    <jsp:include page="/jsp/header0.jsp"></jsp:include>
    <div class="body_container">
        <div class="content">
            <button id="log">
                <a href="/jsp/login/loginPs.jsp">일반로그인</a>
            </button>
            <button id="log">
                <a href="#">업체로그인</a>
            </button>

            <div class="login">
                <form action="/loginBs.do" method="post">
                    <h2>로그인</h2>
                    <hr>
                    <div>
                        <input type="text" name="id" id="id" placeholder="아이디"/>
                    </div>
                    <div>
                        <input type="password" name="password" id="password" placeholder="비밀번호"/>
                    </div>
                   <!-- <input type="submit" value="로그인" onclick="loginBs()" /> -->
                   <input type="submit" value="로그인"/>
                </form>
                <div>
                    <div>
                        <a href="">아이디/비밀번호 찾기</a>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    <!-- 바디콘테이너 -->
</body>
    <script src="/js/Test_loginBs.js"></script>
</html>