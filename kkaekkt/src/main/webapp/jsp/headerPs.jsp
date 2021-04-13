<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link rel="stylesheet" href="/css/all.css">
	<link rel="stylesheet" href="/css/header.css">
	<script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
		rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		var alertObj = {
			sender: ${ sessionScope.user.mno },
			senderName: `${sessionScope.user.name}`,
			mtype: ${ sessionScope.user.mtype }
			};
	</script>
	<script src="/js/header.js"></script>
	<script src="/js/index.js"></script>
	<header class="head_container">
		<nav class="head">
			<div class="menu">
				<a href="/showMap.do?type=1">일반세탁소</a>
				<a href="/showMap.do?type=2">코인세탁소</a>
			</div>
			<div class="head_logo">
				<div class="logo">
					<a href="/index.do"> <img src="/img/logo.png" alt="">
					</a>
				</div>
			</div>
			<div class="head_right">
				<span><input name="name" id="name" value="${sessionScope.user.name}" readonly /></span>님
				<div id="bellBox">
					<i class="fas fa-bell"></i>
					<span class="redDot">●</span>
					<div id="noticeBox">
						<ul>

						</ul>
						<button>내 알림 전체보기</button>
					</div>
				</div>
				<div id="chatBox">
					<i class="fas fa-comments"></i>
					<span class="redDot">●</span>
				</div>
				<!--<a href="/jsp/mypageUser/Test_mybio.jsp">마이페이지</a> -->
				<a href="/jsp/mypageUser/mypagePs.jsp">마이페이지</a>
				<a href="/logout.do">로그아웃</a>
				<a href="/jsp/faq.jsp">FAQ</a>
			</div>
		</nav>
	</header>