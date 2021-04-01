<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../../css/myalertPs.css">
<link rel="stylesheet" href="../../css/all.css">
<link rel="stylesheet" href="../../css/head0.css">
<link rel="stylesheet" href="../../css/sidebar.css">
<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!--<script src="/js/mymark.js"></script>-->
</head>

<body>
    <header class="head_container">
        <nav class="head">
            <div class="head_left">
                <div class="logo">
                    <a href=""> <img src="../../img/logo.svg" alt="">
                    </a>
                </div>
                <div class="menu">
                    <a href="">일반세탁소</a> <a href="">코인세탁소</a>
                </div>
            </div>
    
            <div class="head_right">
                <a href="">회원가입</a> <a href="">로그인</a> <a href="">FAQ</a>
            </div>
        </nav>
    </header>
    <div class="body_container">
          <div class="side">
              <button>주문내역</button>
              <button>내가 찜한 세탁소</button>
              <button>알림</button>
              <button>프로필편집</button>
          </div>
          <div class="side_sub">
              <button>진행중인 주문</button>
              <button>완료된 주문</button>
          </div>
        <div class="content">
            <div id="alertHeader">
                <div id="headerLeft">
                    <button id="total" class="selected">전체</button>
                    <button id="check">결제</button>
                    <button id="complete">완료</button>
                    <button id="reply">답글</button>
                    <button id="cancel">취소</button>
                </div>
                <div id="headerRight">
                    <div id="refresh">
                        <i class="fas fa-redo-alt"></i>
                    </div>
                    <button id="readDelBtn">읽은 알림 삭제</button>
                    <button id="totalDelBtn">모두 삭제</button>
                </div>
            </div>
            <hr>
            <div id="alertListBox">
                <!-- <div id="2021.04.01" class="date">
                    <i class="far fa-clock"></i>
                    <h2>2021.04.01</h2>
                    <ul>
                        <li><div><a><span class="msgHeader">[완료]</span>⠀주문번호22의 세탁이 완료되었습니다.</a></div><div><span class="byBs">by 테스트업체 </span><span>⠀|⠀</span><span class="alertDate">2021.04.01</span></div><i class="fas fa-times"></i></li>
                        <li><div><a><span class="msgHeader">[완료]</span>⠀주문번호22의 세탁이 완료되었습니다.</a></div><div><span class="byBs">by 테스트업체 </span><span>⠀|⠀</span><span class="alertDate">2021.04.01</span></div><i class="fas fa-times"></i></li>
                        <li><div><a><span class="msgHeader">[완료]</span>⠀주문번호22의 세탁이 완료되었습니다.</a></div><div><span class="byBs">by 테스트업체 </span><span>⠀|⠀</span><span class="alertDate">2021.04.01</span></div><i class="fas fa-times"></i></li>
                    </ul>
                </div>
                <div id="2021.03.31" class="date">
                    <i class="far fa-clock"></i>
                    <h2>2021.03.31</h2>
                    <ul>
                        <li><div><a><span class="msgHeader">[완료]</span>⠀주문번호22의 세탁이 완료되었습니다.</a></div><div><span class="byBs">by 테스트업체 </span><span>⠀|⠀</span><span class="alertDate">2021.04.01</span></div><i class="fas fa-times"></i></li>
                        <li><div><a><span class="msgHeader">[완료]</span>⠀주문번호22의 세탁이 완료되었습니다.</a></div><div><span class="byBs">by 테스트업체 </span><span>⠀|⠀</span><span class="alertDate">2021.04.01</span></div><i class="fas fa-times"></i></li>
                        <li><div><a><span class="msgHeader">[완료]</span>⠀주문번호22의 세탁이 완료되었습니다.</a></div><div><span class="byBs">by 테스트업체 </span><span>⠀|⠀</span><span class="alertDate">2021.04.01</span></div><i class="fas fa-times"></i></li>
                    </ul>
                </div> -->
            </div>
        </div>
    </div>
    <script>
        var alertObj={
            sender:1,
            datediff:14
        };
    </script>
    <script src="../../js/myalertPs.js"></script>
</body>
</html>