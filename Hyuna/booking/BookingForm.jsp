<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
ul {
	padding: 0;
}

li {
	list-style: none;
}
</style>
</head>

<body>
	<!-- sumin.html 이거는 나중에 경로 나오면 하기 -->
	<!-- <form action="sumin.html" method="post"></form> -->
	<form action='insert.do' method='post'>
		<ul>
			<li><label for="mno">번호</label> <input id="mno" type="text"
				name="mno"></li>
			<li><label for="header"></label> <select id="header"
				name="header">
					<option selected>말머리 없음</option>
					<option value="산악일정잡기">산악일정잡기</option>
					<option value="일정변경">공지:일정변경</option>
			</select></li>
			<li><label for="title">제목</label> <input id="title" type="text"
				name="title" placeholder="오늘은 어떤 이야기를 들려주실 건가요?" /></li>
			<li><label for="nname">이름</label> <input id="nname" type="text"
				name="nname" /></li>
			<li><label for="nop"></label> <select id="nop" name="nop">
					<option selected>인원설정</option>
					<option value="5">5명</option>
					<option value="10">10명</option>
					<option value="15">15명</option>
			</select></li>
				<li>
				<input id="rdate" type="date" name="rdate" placeholder="0000-00-00" value=""/>
			</li> 
			<li><label for="content">내용</label> <input id="content"
				type="text" name="content" value="" /></li>
			<li><label for="loc">위치</label> <input id="loc" type="text"
				name="loc" value="" /></li>
			<li>
				<form action="FileUpload" method="post"
					enctype="multipart/form-data">
					사진 : <input type="file" name="photo"> 
			</li>
		</ul>
		<input type="submit" value="추가" onclick='location.href="list.do"'/>
		<input type="reset" value="취소" onclick='location.href="list.do"' />
	</form>
</body>

</html>