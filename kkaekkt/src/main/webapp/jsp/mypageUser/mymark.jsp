<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/mymark.css">
<script src="/js/mymark.js"></script>
</head>

<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>
	  <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
        <div class="content">
            <p id="mymark_title">내가찜한세탁소</p>
            <hr>
            <div class="page_btn_container">
                <ul class="page_btn">
                    <!-- 맨처음으로 버튼 -->
                    <li class="page_prevBlock"><i class="fas fa-angle-double-left"></i></li> 
                    <!-- 이전 -->
                    <li class="page_prev">
                        <i class="fas fa-angle-left"></i>
                    </li>
                    <!-- 다음버튼 -->
                    <li class="page_next">
                        <i class="fas fa-angle-right"></i>
                    </li>
                    <!-- 맨마지막으로 버튼 -->
                    <li class="page_nextBlock"><i class="fas fa-angle-double-right"></i></li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        var pageObj={
            mno:1,
            currentPageNum:1
        }
    </script>
</body>
</html>