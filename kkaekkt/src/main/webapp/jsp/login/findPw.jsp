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
        <p>비밀번호를 찾을 아이디를 입력해주세요</p>

        <!--굳이 폼으로 감싸야 할 지, 애매하네요.
    input submit을 이용하면 편해서 그런거긴 한데,
    js로 text읽어서 전달할 수 있으면 form 빼고 처리하는 게
    더 깔끔해보이긴 합니다. 일단 임시로 이렇게 놓겠습니다.-->
        <!-- <form action=""> -->
        <div class="veri_btn" style="text-align: center;">
            <input type="text" placeholder="ID"> <br>
            <button type="submit">다음</button>
        </div>

        <!-- </form> -->
        <div class="mail">
            아이디가 기억나지 않는다면 아이디를 먼저 찾아주세요. <br>
            비밀번호 찾기 시 문제가 있나요?
            <a href="mailto:info@kkaekkt.com">고객센터</a>
        </div>
    </div>



</body>

</html>