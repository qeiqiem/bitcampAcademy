<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/community.css">

</head>

<body>
	<jsp:include page="/Sidebar.jsp" />
	<section class="post_container">
		<div class="post_community">
			<div class="title">
				<h2>커뮤니티 Community</h2>
				<button type="submit" class="post_btn">글쓰기</button>
			</div>
			<nav class="search">
				<div class="order_link">
					<a href="">최신순</a> <a href="">추천순</a> <a href="">조회순</a>
				</div>
				<form action="list.do" method="post">
					<div class="input_search">
						<select name="header">
							<option value="none">== 말머리 선택 ==</option>
							<option value="chat">[사담]</option>
							<option value="ques">[질문]</option>
							<option value="info">[정보]</option>
							<option value="pr">[클럽홍보]</option>
						</select> 
						<select name="option">
							<option value="all">제목+내용</option>
							<option value="title">제목</option>
							<option value="nname">글작성자</option>
						</select> <input type="search" placeholder="검색어" name="title">
						<button type="submit" class="post_btn">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</form>
			</nav>

			<div class="post_list">
				<!-- 공지사항 반복문   -->
				<c:forEach var="post" items="${posts}">
					<c:if test="${post.pin==-1}">
						<div class="notice post">
							<div class="post_no">${post.bno}</div>
							<div class="post_head">${post.header}</div>
							<div class="post_title">
								<a href="">${post.title}</a>
							</div>
							<div class="writer_info">
								${post.nname} <br> <span style="font-size: x-small;">${post.createdDate}</span>
							</div>
						</div>
					</c:if>
					<c:if test="${post.pin==0}">
						<div class="post">
							<div class="post_no">${post.bno}</div>
							<div class="post_head">${post.header}</div>
							<div class="post_title">
								<a href="">${post.title}</a>
							</div>
							<div class="post_info">
								<div class="infos">
									<i class="far fa-thumbs-up"> 추천수 2</i> <i
										class="far fa-eye"> 조회수 1</i>
								</div>
								<div class="writer_info">
									${post.nname} <br> <span style="font-size: x-small;">${post.createdDate}</span>
								</div>
							</div>
						</div>
					</c:if>
			</c:forEach>
		</div>
		</div>
	</section>

</body>

</html>