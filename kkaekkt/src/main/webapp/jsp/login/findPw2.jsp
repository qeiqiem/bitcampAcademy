<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/all.css">
    <link rel="stylesheet" href="css/findPw.css">
    <link rel="stylesheet" href="css/head0.css">
    <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
    <style>
        .val input {
            margin: 0 0 15px;
        }

        .val button {
            margin-top: 15px;
        }

        .veri_btn {
            height: 250px;
        }
    </style>
</head>

<body>
    <div class="body_container">
        <nav class="find_nav">
            <div class="id">
                아이디 찾기
            </div>
            <div class="pw" style="color: aquamarine;">
                비밀번호 찾기
            </div>

        </nav>
        <p><span>(id)</span>님, 해당 아이디에 등록된 이름과 이메일 정보를 모두 입력해 주세요.
            <br>입력하신 정보로 인증 메일이 발송됩니다.
        </p>


        <div class="veri_btn val" style="text-align: center;">
            <input type="text" placeholder="이름을 입력해 주세요."> <br>
            <input type="text" placeholder="이메일을 입력해 주세요."> <br>
            <button type="submit">인증하기</button>
        </div>


        <div class="mail">
            아이디가 기억나지 않는다면 아이디를 먼저 찾아주세요. <br>
            비밀번호 찾기 시 문제가 있나요?
            <a href="mailto:info@kkaekkt.com">고객센터</a>
        </div>
    </div>



</body>

</html>