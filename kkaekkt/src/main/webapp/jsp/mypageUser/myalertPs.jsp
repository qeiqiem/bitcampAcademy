<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/myalertPs.css">
<link rel="stylesheet" href="/css/all.css">
<link rel="stylesheet" href="/css/head0.css">
<link rel="stylesheet" href="/css/sidebar.css">
<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!--<script src="/js/mymark.js"></script>-->
</head>

<body>
    <jsp:include page="/jsp/header1.jsp"></jsp:include>
    <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
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
            </div>
        </div>
    </div>
    <script>
        var alertObj={
            sender:${sessionScope.person.mno},
            datediff:14
        };
    </script>
    <script src="/js/index.js"></script>
    <script src="/js/myalertPs.js"></script>
</body>
</html>