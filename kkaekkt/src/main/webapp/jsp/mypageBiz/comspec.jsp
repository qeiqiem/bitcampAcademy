<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/comspec.css">
</head>
<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>
	<div class="body_container">
		<jsp:include page="sidebar_bs.jsp"></jsp:include>
		<div class="content">
			<div id="comspec_title">사양관리</div>
			<hr>
			<div class="comLaundry ">
				<form action="/updateSpec.do" method="POST">
					<!-- float left -->
					<div class="laundry" id="comspec_left">
						<!--세탁기 사양-->
						<div id="card">
							1~3일 소요
							<hr>
							<table id="fast">
								<th>종류</th>
								<th>금액(개당)</th>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=1 /> <span class="checkbox-icon">
										</span>
									</span> 일반의류</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=2 /> <span class="checkbox-icon">
										</span>
									</span> 와이셔츠</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=3 /> <span class="checkbox-icon">
										</span>
									</span> 이불</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
                                <tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=4 /> <span class="checkbox-icon">
										</span>
									</span> 운동화</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
							</table>
						</div>
					
						<div id="card">
							4~7일 소요
							<hr>
							<table id="fast">
								<th>종류</th>
								<th>금액(개당)</th>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=5 /> <span class="checkbox-icon">
										</span>
									</span> 가죽모피</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=6 /> <span class="checkbox-icon">
										</span>
									</span> 명품가방</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=7 /> <span class="checkbox-icon">
										</span>
									</span> 아웃도어</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
                                <tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" value=8 /> <span class="checkbox-icon">
										</span>
									</span> <input type="text" placeholder="기타" style="width:100px; height:25px"></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
							</table>
							 <input type="hidden" name="laundry">
						</div>
					</div>

					<!-- float right -->
					<div id="comspec_right">
						<!--운영시간-->
						<div id="card">
							운영시간
							<hr>
							<div id="week">
								<button id="1">월</button>
								<button id="2">화</button>
								<button id="3">수</button>
								<button id="4">목</button>
								<button id="5">금</button>
								<button id="6">토</button>
								<button id="7">일</button>
								<button id="8">매일</button>
								<button id="9">평일</button>
								<button id="10">주말</button>
							</div>

							<div id="weekBox">
								<ul>

								</ul>
								<input type="hidden" name="schedule">
							</div>
						</div>
					</div>
					<div id="btn_update">
						<button type="button" onclick="" id="updateSpec">수정하기</button>
						<div id="btn_change">
							<button type="reset" onclick="" id="resetSpec">돌아가기</button>
							<button type="submit" onclick="" id="submitSpec">수정완료</button>
						</div>
					</div>
					<input type="text" name="bno" hidden>
					<input type="text" name="bizType" value="1" hidden>
				</form>
			</div>
			<!-- container -->

			</div>
		</div>
		<script>
		var pageObj={//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
                bno:1,//더미번호 (추후 세션에서 받아올 예정)
            };
	</script>
	<script src="/js/comspec.js"></script>
	
</body>
</html>