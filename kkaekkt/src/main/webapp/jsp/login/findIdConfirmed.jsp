<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/find.css">
    <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
</head>

<body>
<jsp:include page="/jsp/header0.jsp"></jsp:include>

    <div class="body_container">
        <nav class="find_nav">
            <!-- <ul>
                <li id="id">아이디 찾기</li>
                <li id="pw">비밀번호 찾기</li>
            </ul> -->

            <div class="id">
                아이디 찾기
            </div>
            <div class="pw" style="color: aquamarine;">
                비밀번호 찾기
            </div>

        </nav>
        <p>아이디 찾기가 완료되었습니다.</p>

        <div class="veri_btn" onclick="" style="text-align: center;">
            ID <span style="font-weight: bolder; font-size: x-large; margin-left: 10px;">${userId.id}</span>
        </div>
        <div class="mail">
            아이디 찾기 시 문제가 있나요?
            <a href="mailto:info@kkaekkt.com">고객센터</a>
        </div>
    </div>
</body>

</html>