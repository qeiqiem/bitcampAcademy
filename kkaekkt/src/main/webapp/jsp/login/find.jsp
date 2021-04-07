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
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    </head>
    <body>
        <jsp:include page="/jsp/header0.jsp"></jsp:include>

        <div class="body_container">
            <div class="wrapper_find">
                <nav class="find_nav">
                    <div id="nav_id" onclick="showID()">아이디 찾기</div>
                    <div id="nav_pw" class="unselect" onclick="showPW()">비밀번호 찾기</div>
                </nav>

                <form action="/findId.do" method="POST" name="findID">
                    <div id="findID">
                        <p>아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다.</p>
                        <div class="veri_btn id_box">
                            <ul>
                                <li>
                                    <input id="name" type="text" name="name" placeholder="이름을 입력하세요."> <br>
                                </li>
                                <li>
                                    <input id="email" type="text" name="email" placeholder="가입 시 등록한 이메일을 입력하세요."> <br>
                                </li>
                            </ul>

                            <!-- <button type="button" onclick="nameEmail();">다음</button> -->
                            <!-- <button type="button" onclick="idSubmit();">다음</button> -->
                            <button type="submit">다음</button>
                        </div>


                        <div class="mail">
                            아이디 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
                        </div>
                    </div>
                </form>

                <form action="/findPw.do" method="POST" id="findPwForm">
                    <!-- <form action="/findPw.do" method="POST" onsubmit="return check()"> -->
                    <div id="findPW" style="display: none;">
                        <p>아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다.
                            <br>아이디가 기억나지 않는다면 아이디를 먼저 찾아주세요.
                        </p>


                        <!-- <form action=""> -->
                        <div class="veri_btn pw_box">
                            <input type="text" id="id" name="id" placeholder="비밀번호를 찾을 아이디를 입력하세요."> <br>
                            <button type="button" onclick="pwSubmit()">다음</button>
                        </div>

                        <!-- </form> -->
                        <div class="mail">
                            <br> 비밀번호 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
        <script src="/js/find.js"></script>
    </body>

    </html>