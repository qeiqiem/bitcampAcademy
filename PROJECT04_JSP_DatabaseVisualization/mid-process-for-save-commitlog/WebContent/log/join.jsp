<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>산, 산, 산 - 회원가입</title>
<link rel="stylesheet" href="/log/css/join.css">
</head>

<body>
	<jsp:include page="/Sidebar.jsp" />
	 <section class="post_container">
        <div class="join_container">
            <form action="">

                <h2>회원가입</h2>
                <div class="join_list">
                    <div>
                        <ul class="join_info">
                            <li>이름</li>
                            <li>닉네임</li>
                            <li>아이디</li>
                            <li>비밀번호</li>
                            <li>주민등록번호</li>
                            <li>전화번호</li>
                            <li>주소</li>
                        </ul>
                    </div>
                    <div class="join_input">
                        <ul>
                            <li>
                                <input type="text" name="mname">
                            </li>
                            <li>
                                <input type="text" name="nname">
                            </li>
                            <li>
                                <input type="text" name="id" placeholder="ID">
                            </li>
                            <li>
                                <input type="password" name="pwd" placeholder="Password">
                            </li>
                            <li>
                                <input type="text" name="rrn1" size="10" maxlength="6"> -
                                <input type="password" name="rrn2" size="10" maxlength="7">
                            </li>
                            <li>
                                <div class="phone_no">
                                    <select name="phone1">
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                        <option value="070">070</option>
                                    </select> -
                                    <input type="text" name="phone2" size="6"> -
                                    <input type="text" name="phone3" size="6">
                                </div>
                            </li>

                            <li>
                                <input type="text" size="30" placeholder="서울특별시 서초구 서초동">
                            </li>
                        </ul>
                    </div>

                </div>
                <div class="join_btn">
                    <button type="submit">취소</button>
                    <button type="submit">가입하기</button>
                </div>
                <!-- <div class="terms">
                <ul>
                    <li>
                        ■ 수집하는 개인정보 항목
                        회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
                        ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 전화번호 , 자택 주소 , 이메일 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보
                        ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식

                        ■ 개인정보의 수집 및 이용목적

                        회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

                        ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
                        ο 회원 관리
                        회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에
                        활용
                        접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계

                        ■ 개인정보의 보유 및 이용기간

                        회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
                    </li>

                    <li>
                        <label for="agree">
                            약관에 동의하십니까? 동의
                            <input type="checkbox" name="agree" value="yes" id="agree">
                        </label>
                    </li>
                </ul>
            </div> -->


            </form>
        </div>
    </section>
</body>

</html>
