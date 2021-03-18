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
        <script src="/js/find.js"></script>
    </head>

    <body>
        <jsp:include page="/jsp/header0.jsp"></jsp:include>

        <div class="body_container">
            <nav class="find_nav">
                <!-- <ul>
                <li id="id">아이디 찾기</li>
                <li id="pw">비밀번호 찾기</li>
            </ul> -->

                <div class="id" onclick="showID()">아이디 찾기</div>
                <div class="pw" onclick="showPW()">비밀번호 찾기</div>

            </nav>

            <div id="findID">
                <p>아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다.</p>

                <div class="veri_btn idBox" onclick="check()">
                    <!-- <i class="far fa-envelope"></i> -->
                    <!-- <i class="fas fa-envelope"></i> -->
                    <!-- 내 정보에 저장된 이메일로 찾기 -->
                    <!-- <input type="button" id="veri" value="" /> -->
                    <ul>
                        <li>
                            <input id="inName" type="text" placeholder="이름을 입력하세요."> <br>
                        </li>
                        <li>
                            <input id="inMail" type="text" placeholder="가입 시 등록한 이메일을 입력하세요."> <br>
                        </li>
                    </ul>

                    <button type="submit">다음</button>

                </div>
                <div class="mail">
                    아이디 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
                </div>
            </div>

            <div id="findPW">
                <p>아이디와 비밀번호를 찾기 위해서는 이름, 회원정보에 등록된 이메일을 통해 본인인증을 받아야 합니다.</p>


                <!-- <form action=""> -->
                <div class="veri_btn" style="text-align: center;">
                    <input type="text" placeholder="비밀번호를 찾을 아이디를 입력하세요."> <br>
                    <button type="submit">다음</button>
                </div>

                <!-- </form> -->
                <div class="mail">
                    아이디가 기억나지 않는다면 아이디를 먼저 찾아주세요. <br> 비밀번호 찾기 시 문제가 있나요? <a href="mailto:info@kkaekkt.com">고객센터</a>
                </div>
            </div>


        </div>

    </body>

    </html>