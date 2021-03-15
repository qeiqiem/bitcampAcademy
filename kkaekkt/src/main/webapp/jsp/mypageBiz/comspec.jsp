<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="css/comspec.css">
<script src="js/comspec.js"></script>
</head>
<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>
	<div class="body_container">
		<jsp:include page="sidebar_bs.jsp"></jsp:include>
		<div class="content">
			<div id="comspec_title">사양관리</div>
			<hr>
			<div class="comLaundry">
				<form action="#">
					<!-- float left -->
					<div id="comspec_left">
						<!--세탁기 사양-->
						<div id="card">
							1~3일 소요
							<hr>
							<table id="fast">
								<th>종류</th>
								<th>금액(개당)</th>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 일반의류</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 와이셔츠</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 이불</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
                                <tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 운동화</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
							</table>
						</div>
						<!--부가서비스-->
						<div id="card">
							4~7일 소요
							<hr>
							<table id="fast">
								<th>종류</th>
								<th>금액(개당)</th>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 가죽모피</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 명품가방</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 아웃도어</td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
                                <tr>
									<td><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> <input type="text" placeholder="기타" style="width:100px; height:25px"></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
							</table>
						</div>
					</div>

					<!-- float right -->
					<div id="comspec_right">
						<!--운영시간-->
						<div id="card">
							운영시간
							<hr>
							<div id="week">
								<button>월</button>
								<button>화</button>
								<button>수</button>
								<button>목</button>
								<button>금</button>
								<button>토</button>
								<button>일</button>
								<button id="two">매일</button>
								<button id="two">평일</button>
								<button id="two">주말</button>
							</div>

							<div id="weekBox">
								<ul>

								</ul>
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
				</form>
			</div>
			<!-- container -->

			</div>
		</div>
	
</body>
</html>