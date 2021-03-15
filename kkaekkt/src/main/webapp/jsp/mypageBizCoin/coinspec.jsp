<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="css/coinspec.css">
<script src="js/coinspec.js"></script>
</head>
<body>
	<jsp:include page="/jsp/header0.jsp"></jsp:include>
	<div class="body_container">
		<jsp:include page="sidebar_coin.jsp"></jsp:include>
		<div class="content">
			<div id="coinspec_title">설비관리</div>
			<hr>
			<div class="coinLaundry">
				<form action="#">
					<!-- float left -->
					<div id="coinspec_left">
						<!--세탁기 사양-->
						<div id="card">
							세탁기 사양
							<hr>
							<table id="coinLaundry">
								<th>용량</th>
								<th>개수</th>
								<th>이용금액(분당)</th>
								<tr>
									<td id="size"><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon">
										</span>
									</span> 중(20kg미만)</td>
									<td id="selectbox"><select>
											<option>1</option>
											<option>2</option>
											<option>3</option>
									</select></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td id="size"><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon"></span>
									</span> 대(20kg~40kg미만)</td>
									<td id="selectbox"><select>
											<option>1</option>
											<option>2</option>
											<option>3</option>
									</select></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td id="size"><span class="checkbox checkbox-circle">
											<input type="checkbox" /> <span class="checkbox-icon"></span>
									</span> 특대(40kg이상)</td>
									<td id="selectbox"><select>
											<option>1</option>
											<option>2</option>
											<option>3</option>
									</select></td>
									<td><input id="won" type="text" placeholder="받아온정보"
										disabled> 원</td>
								</tr>
							</table>
						</div>
						<!--부가서비스-->
						<div id="card">
							부가서비스
							<hr>
							<table id="etc">
								<th>품목</th>
								<th>추가금액</th>
								<tr>
									<td><span class="checkbox checkbox-circle"> <input
											type="checkbox" /> <span class="checkbox-icon"></span>
									</span> 향균세탁</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle"> <input
											type="checkbox" /> <span class="checkbox-icon"></span>
									</span> 특수세제(울/유아용등)</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle"> <input
											type="checkbox" /> <span class="checkbox-icon"></span>
									</span> 섬유유연제</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
								<tr>
									<td><span class="checkbox checkbox-circle"> <input
											type="checkbox" /> <span class="checkbox-icon"></span>
									</span> 픽업봉투</td>
									<td><input id="won" type="text" placeholder="받아온 정보"
										disabled> 원</td>
								</tr>
							</table>
						</div>
					</div>

					<!-- float right -->
					<div id="coinspec_right">
						<!--건조기-->
						<div id="card">
							건조기
							<hr>
							<table id="dry">
								<td>개수</td>
								<td id="selectbox"><select>
										<option>1</option>
										<option>2</option>
										<option>3</option>
								</select></td>
								<td>이용금액</td>
								<td><input id="won" type="text" placeholder="받아온 정보"
									disabled> 원(분당)</td>

							</table>
						</div>
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