<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
*:focus {
    outline: none;
}
hr {
height: 1px;
border: none;
background-color: var(--gray-color);
/* border: solid 0.5px var(--gray-color); */
width: 85%;
margin: 10px 0 20px 0;
}
.content {
float:left;
width: 65vw;
height: 100vh;
padding: 10px 0px 30px 250px;
font-size: 14px;
color: var(--text-gray);
}
#salesManage_title {
    display: inline-block;
    color: var(--black-color)
}
</style>

<script>
$(document).ready(function() {
    $(".side_sub").hide();
    $('.side button').eq(3).addClass("side_select");
});
</script>
</head>
<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>
	<div class="body_container">
		<jsp:include page="sidebar_bs.jsp"></jsp:include>
		<div class="content">
			<p id="salesManage_title">매출관리</p>
            <hr>
			<jsp:include page="daygrid-views.html"></jsp:include>

		</div>
	</div>
	
</body>
</html>