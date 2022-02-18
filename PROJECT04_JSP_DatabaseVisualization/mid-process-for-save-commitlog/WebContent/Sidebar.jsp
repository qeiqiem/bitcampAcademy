<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/board/css/index.css">
<nav class="sidebar_container">
	<header>
		<div class="index logo">
			<a href="/index.do"> <img src="/board/images/logo.png" alt="">
			</a>
		</div>
			<div class="index logout">
				<button type="button" onclick="location.href='/log/info.do'" class="btn login">
					<i class="fas fa-user"> 내 정보</i>
				</button>
				<button type="button" onclick="location.href='/log/logout.do'"
					class="btn join">
					<i class="fas fa-sign-out-alt"> 로그아웃</i>
				</button>
			</div>
		
				<div class="index menu_list">
					<ul>
						<li><a href="">산</a></li>
						<li><a href="">인증샷</a></li>
						<li><a href="">커뮤니티</a></li>
						<li><a href="">소모임</a></li>
						<li><a href="">FAQ</a></li>
					</ul>
				</div>
	</header>
	<footer>
		<ul class="footer_list">
			<li>산산산</li>
			<li>info@mountains.kr</li>
			<li>Copyright © 2021 All right Reserved.</li>
		</ul>
	</footer>
</nav>
