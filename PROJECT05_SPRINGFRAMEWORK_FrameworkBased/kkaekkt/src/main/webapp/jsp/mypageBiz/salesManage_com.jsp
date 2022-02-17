<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>매장관리</title>
	</head>

	<body>
		<jsp:include page="/jsp/headerBs.jsp"></jsp:include>
		<div class="body_container">
			<jsp:include page="sidebar_bs.jsp"></jsp:include>
			<div class="content">
				<div class="content_header">
					<p><span id="month_mng"></span>월 매출관리</p>
				</div>
				<hr>
				<jsp:include page="daygrid-views.html"></jsp:include>

			</div>
		</div>
		<script>
			$(document).ready(function () {
				$(".side_sub").hide();
				$('.side button').eq(3).addClass("side_select");
			});
			var date = new Date();
			var startDt = new Date(date.getFullYear(), date.getMonth(), 1);
			var endDt = new Date(date.getFullYear(), date.getMonth(), date.getDate());
			var pageObj = {//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
				bno: '${user.bno}',//더미번호 (추후 세션에서 받아올 예정)
				startDt: startDt,
				endDt: endDt
			};
		</script>
	</body>

	</html>