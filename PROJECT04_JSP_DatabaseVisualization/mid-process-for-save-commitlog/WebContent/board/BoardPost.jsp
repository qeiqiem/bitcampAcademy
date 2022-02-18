<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="spms.vo.Member" %>
<%Member loginAc = (Member)session.getAttribute("loginAc");%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>산, 산, 산 - 커뮤니티</title>
<script src="https://kit.fontawesome.com/2fc57dd2db.js"
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/boardpost.css">
</head>

<body>
	<!-- 헤드 사이드바 -->
	<jsp:include page="/Sidebar.jsp" />

	<section class="post_container">
		<div class="post_community">
			<div class="title">
				<h2>커뮤니티</h2>
				<button type="submit" class="post_btn">
					<i class="fas fa-pencil-alt"> 글쓰기</i>
				</button>
			</div>

			<div>
				<ul class="list_btn">
					<li>
						<button type="submit">
							<i class="fas fa-angle-up"></i> 이전글
						</button>
					</li>
					<li>
						<button type="submit">
							<i class="fas fa-angle-down"></i> 다음글
						</button>
					</li>
					<li>
						<button type="button"
							onclick="location.href='/board/boardlist.do'">
							<i class="fas fa-bars"></i> 목록
						</button>
					</li>
				</ul>
			</div>

			<div class="post">
				<div>
					<ul class="post_head">
						<li>${post.header}</li>
						<li style="color: rgb(156, 156, 156);">${post.bno}</li>
					</ul>
				</div>
				<div class="post_title">
					<h3>${post.title}</h3>
					<ul>
						<li><i class="fas fa-user"></i> ${post.nname}</li>
						<li style="color: rgb(156, 156, 156);">${post.createdDate}
							조회수 ${post.vw}</li>
					</ul>
					<hr>
					<div class="post_text">${post.content}</div>

					<div class="comm">
						<i class="far fa-thumbs-up"> 추천수 ${post.recommend}</i> <i
							class="far fa-comment-dots"> 댓글수 ${post.comm}</i>
						<hr>
						<h4>댓글</h4>
						<br>
						<c:forEach var="comm" items="${comms}">
						<ul>
							<li><i class="fas fa-user"></i>${comm.nname}</li>
							<li class="commtext">${comm.content}</li>
							<li style="color: rgb(156, 156, 156);" class="commtext">${comm.createdDate}</li>
						</ul>
						</c:forEach>
					</div>
					<hr>
					<form action="/comm/add.do" method="post">
					<input type="hidden" name="table" value="board">
					<input type="hidden" name="bno" value='${post.bno}'>
					<input type="hidden" name="mno" value='${post.mno}'>
					<input type="hidden" name="nname" value='<%=loginAc.getNname()%>'>
						<ul>
							<li><textarea name="content" rows="3" cols="100"
									style="padding: 10px; resize: none;" placeholder="댓글을 입력하세요"></textarea>
							</li>
							<li>
								<button type="submit">등록하기</button>
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>

	</section>

</body>

</html> 
