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
    <link rel="stylesheet" href="css/head0.css">
    <link rel="stylesheet" href="css/join.css">
    <link rel="stylesheet" href="css/joinPerson.css">
    <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
</head>


<body>
    <div class="body_container">
        <div class="wrapper_joinInfo">
            <h2>회원가입</h2>
            <div class="join_seq">
                <div class="join_numBox">
                    <ul>
                        <li class="num">01</li>
                        <li>회원유형선택</li>
                    </ul>
                </div>
                <div>
                    <i class="fas fa-chevron-right fa-3x"></i>
                </div>
                <div class="join_numBox">
                    <ul style="color: var(--black-color); font-weight: bolder;">
                        <li class="num">02</li>
                        <li>정보입력</li>
                    </ul>
                </div>
                <div>
                    <i class="fas fa-chevron-right fa-3x"></i>
                </div>
                <div class="join_numBox">
                    <ul>
                        <li class="num">03</li>
                        <li>가입완료</li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="wrapper_select">
            <hr>
            <div class="wrapper_joinCnt">
                <div class="join_form">
                    <h3>개인 회원</h3>
                    <form action="joinPerson.jsp" method="POST" name="joinPerson" onsubmit="return check()">
                        <div>
                            <p>아이디</p>
                            <label for="id">
                                <input type="text" placeholder="ID" name="id" id="id">
                                <button type="button" id="id_btn">중복확인</button>
                            </label>

                        </div>

                        <div>
                            <p>비밀번호</p>
                            <label for="pw">
                                <input type="password" placeholder="Password" name="pw" id="pw" minlength="8"
                                    maxlength="16">
                            </label>

                            <p>비밀번호 확인</p>
                            <label for="repw">
                                <input type="password" placeholder="Password" name="repw" id="repw" minlength="8"
                                    maxlength="16">
                            </label>
                            <p style="font-size:smaller;">* 영어 대문자, 특수문자, 숫자를 포함한 8~16글자</p>
                        </div>
                        <br><br>

                        <div>
                            <p>이름</p>
                            <input type="text" name="name">
                        </div>
                        <div>
                            <p>연락처</p>
                            <input type="tel" placeholder="010-1234-5678" name="phone" id="phone">
                        </div>

                        <div>
                            <p>생년월일</p>
                            <input type="text" placeholder="YYYYMMDD" name="birth" id="birth">
                        </div>

                        <div>
                            <p>주소</p>
                            <input type="text" name="ad" id="ad"> <button>주소찾기</button>
                        </div>

                        <div>
                            <p>이메일</p>
                            <input type="email" name="email" id="email">
                        </div>

                        <div class="join_btn">
                            <button type="reset" name="reset">다시입력</button>
                            <button type="submit" name="join" style="background-color: var(--key-color);">가입하기</button>
                            <!-- <input type="reset" name="reset" value="다시입력">
                        <input type="submit" name="join" value="가입하기"> -->
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <footer>
            <p><img src="img/logo-nowater.png" alt="" style="width: 100px;"></p>
            kkækkt <br>
            info@kkækkt.com <br>
            Copyright © 2021 All right Reserved.

            <div>
                고객센터
                전화문의 1833-3429
                평일 오전 9시 ~ 오후 6시 (주말. 공휴일 휴무)
                제휴문의 : business@lifegoeson.kr
            </div>
        </footer>
    </div>
    <script src="js/joinPerson.js"></script>
</body>

</html>