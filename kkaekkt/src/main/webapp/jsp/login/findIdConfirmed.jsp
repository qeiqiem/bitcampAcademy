<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="/css/find.css">
        <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
        <script>
            window.onload = function () {
                let str = document.getElementById("idValue").innerHTML;
                console.log(str);
                let idVal = str.substring(0, 3)
                console.log(idVal);
                let idRp = '*'.repeat(str.length - 3);
                console.log(idRp);
                document.getElementById("idValue").innerText = (idVal + idRp);
            }
        </script>
        <style>
            .pw_box {
                color: var(- -text-gray);
            }

            .pw_box span {
                font-weight: bolder;
                font-size: x-large;
                margin-left: 10px;
                color: black;
            }

            .pw_box button {
                width: 110px;
                padding: 16px;
                margin: 39px 24px;
            }
        </style>


    </head>

    <body>
        <jsp:include page="/jsp/header.jsp"></jsp:include>

        <div class="body_container">
            <div class="wrapper_find">
                <nav class="find_nav">
                    <div id="nav_id" onclick="showID()">아이디 찾기</div>
                    <div id="nav_pw" class="unselect" onclick="showPW()">비밀번호 찾기</div>
                </nav>
                <div id="findID">
                    <p>아이디 찾기가 완료되었습니다.</p>

                    <!-- 아이디 -->
                    <div class="veri_btn pw_box" onclick="" style="text-align: center;">
                        ID <span id="idValue">${userId.id}</span>
                        <div>
                            <button type="button" onclick="showPW()">비밀번호 찾기</button>
                            <button type="button" onclick="location.href='/jsp/login/login.jsp'">로그인</button>
                        </div>
                    </div>

                    <div class="mail">
                        아이디 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
                    </div>
                </div>

                <!-- 비번 -->
                <form action="/findPw.do" method="POST">
                    <!-- <form action="/findPw.do" method="POST" onsubmit="return check()"> -->
                    <div id="findPW" style="display: none;">
                        <p>아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다.</p>


                        <!-- <form action=""> -->
                        <div class="veri_btn pw_box">
                            <input type="text" name="id" placeholder="비밀번호를 찾을 아이디를 입력하세요.">
                            <br>
                            <button type="submit">다음</button>
                        </div>

                        <!-- </form> -->
                        <div class="mail">
                            아이디가 기억나지 않는다면 아이디를 먼저 찾아주세요. <br> 비밀번호 찾기 시 문제가 있나요? <a
                                href="mailto:info@kkaekkt.com">고객센터</a>
                        </div>
                    </div>

                </form>


            </div>
        </div>
        <script src="/js/find.js"></script>
    </body>

    </html>