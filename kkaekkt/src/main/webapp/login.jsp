<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<jsp:include page="header0.jsp"></jsp:include>

    <div class="body_container">

        <div>
            <h3>로그인</h3>
            <div>
                <input type="text" placeholder="아이디">
            </div>
            <div>
                <input type="text" placeholder="비밀번호">
            </div>
            <button id="btn_login">로그인</button>
        </div>
        <div>
            <div>
                <a href="">아이디 찾기</a>
                <a href="">비밀번호 찾기</a>
            </div>
            <div>
                <p>다른 계정으로 로그인</p>

                <!--api끌어오는거에 따라 가지수는 줄 수 있습니다...-->
                <button>네이버</button>
                <button>페이스북</button>
                <button>구글</button>
                <button>카카오</button>
            </div>
            <div>
                아직 회원이 아니신가요?
                <a href="">회원가입</a>
            </div>
        </div>
    </div>
</body>

</html>