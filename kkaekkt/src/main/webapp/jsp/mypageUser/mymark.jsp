<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/mymark.css">
</head>
<body>
	<jsp:include page="/jsp/header1.jsp"></jsp:include>
	  <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
        <div class="content">
            <p id="mymark_title">내가찜한세탁소</p>
            <hr>
        </div>
    </div>
    <script>
        var likeObj={
            mno:alertObj.sender
        }
    </script>
    <script src="/js/mymark.js"></script>
</body>
</html>