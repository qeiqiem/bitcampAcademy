<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/all.css">
    <link rel="stylesheet" href="css/joinBs.css">
    <script src="js/jquery-1.12.4.js"></script>
</head>
<body>
	<!--<jsp:include page="header0.jsp"></jsp:include>-->
    <!-- 공통 -->
    <div class="body_container">
        <div class="centerDiv">
            <h4>업체 회원가입</h4>
            <form action="joinBs.do" method="POST">
                <div>
                    <p>아이디</p>
                    <input name="id" value="testId" type="text" placeholder="아이디를 입력해주세요."><input type="button" value="중복확인">
                </div>
                <div class="full">
                    <p>비밀번호</p>
                    <input type="password" value="test" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" minlength="8" maxlength="16">
                    <p>비밀번호 확인</p>
                    <input name="password" value="test" type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" minlength="8" maxlength="16"
                        style="margin-bottom: 40px;">
                </div>
                <div>
                    <p>운영시간</p>
                    <div class="week">
                        <button>월</button>
                        <button>화</button>
                        <button>수</button>
                        <button>목</button>
                        <button>금</button>
                        <button>토</button>
                        <button>일</button>
                        <button class="two">매일</button>
                        <button class="two">평일</button>
                        <button class="two">주말</button>
                    </div>
                    <div class="weekBox">
                        <ul>
                        </ul>
                        <input type="hidden" name="schedule">
                    </div>
                    <div class="phone">
                        <p>연락처</p>
                        <input type="text" placeholder="010"> -
                        <input type="text" placeholder="0000"> -
                        <input type="text" placeholder="0000">
                        <input type="hidden" value="test" name="phone">
                        <button>본인인증</button>
                    </div>
                    <div class="full">
                        <p>업체명</p>
                        <input type="text" value="test" name="bname">
                        <p>사업자등록번호</p>
                        <input type="text" value="test" name="bno" placeholder="숫자만 작성해주세요">
                    </div>
                    <div class="address">
                        <p>주소</p>
                        <input name="address" value="test" type="text"><input type="button" value="우편번호찾기">
                    </div>
                    <div class="email">
                        <p>이메일</p>
                        <input name="email" value="test" type="text"> <!-- @
                        <div class="selectbox">
                            <label class="select">naver.com</label>
                            <select>
                                <option>naver.com</option>
                                <option>daun.net</option>
                                <option>hanmail.net</option>
                                <option>gmail.com</option>
                            </select>
                        </div> -->
                    </div>
                    <div class="bank">
                        <p>계좌등록</p>
                        <div class="selectbox">
                        <label class="select">국민</label>
                        <select name="bankNum">
                            <option value=1>국민</option>
                            <option value=2>신한</option>
                            <option value=3>하나</option>
                            <option value=4>우리</option>
                            <option value=5>IBK기업은행</option>
                            <option value=6>NH농협은행</option>
                            <option value=7>카카오뱅크</option>
                        </select>
                        </div>
                        <input name="bankAccountNum" value="test" type="text" placeholder="수익금 받을 계좌를 입력하세요">
                    </div>
                    <div class="bizType">
                        <div class="selected">세탁소</div>
                        <div class="unselected">코인세탁소</div>
                        <input type="hidden" name="bizType" value=1>
                    </div>
                    <!-- 일반세탁소 -->
                    <div class="laundry">
                        <h4 style="text-align: left;">취급품목</h4>
                        <div>
                            <table>
                                <tr>
                                    <th colspan="2">1~3일 소요</th>
                                    <th>금액(개당)</th>
                                </tr>
                                <tr>
                                    <td><input value=0 type="checkbox">일반의류</td>
                                    <td class="blank"></td>
                                    <td><input class="won" value=12 disabled>원</td>
                                </tr>
                                <tr>
                                    <td><input value=1 type="checkbox">와이셔츠</td>
                                    <td class="blank"></td>
                                    <td><input class="won" disabled>원</td>
                                </tr>
                                <tr>
                                    <td><input value=2 type="checkbox">이불</td>
                                    <td class="blank"></td>
                                    <td><input class="won" disabled>원</td>
                                </tr>
                                <tr>
                                    <td><input value=3 type="checkbox">운동화</td>
                                    <td class="blank"></td>
                                    <td><input class="won" disabled>원</td>
                                </tr>
                            </table>

                            <table>
                                <tr>
                                    <th colspan="2">4~7일 소요</th>
                                    <th>금액(개당)</th>
                                </tr>
                                <tr>
                                    <td><input value=4 type="checkbox">가죽모피</td>
                                    <td class="blank"></td>
                                    <td><input class="won" disabled>원</td>
                                </tr>

                                <tr>
                                    <td><input value=5 type="checkbox">명품가방</td>
                                    <td class="blank"></td>
                                    <td><input class="won" disabled>원</td>
                                </tr>

                                <tr>
                                    <td><input value=6 type="checkbox">아웃도어</td>
                                    <td class="blank"></td>
                                    <td><input class="won" disabled>원</td>
                                </tr>

                                <tr>
                                    <td><input value=7 type="checkbox">기타</td>
                                    <td><input class="etc" placeholder="모자/가방/인형"></td>
                                    <td><input class="won" disabled>원</td>
                                </tr>
                                <input type="hidden" name="laundry">
                            </table>
                            <input type="button" value="가입신청" onclick="clicked();">
                        </div>
                    </div>
                    <!-- 코인세탁소 -->
                    <div class="coinLaundry hide">
                        <h4 style="text-align: left;">사양정보</h4>
                        <div>
                            <table class="equipment">
                                <tr>
                                    <th>세탁기</th>
                                    <th>개수</th>
                                    <th>이용금액(분당)</th>
                                </tr>
                                <tr>
                                    <td class="size"><input value=0 type="checkbox">중<span>(20kg미만)</span></td>
                                    <td class="selectbox">
                                        <label for="select"></label>
                                        <select disabled>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                    </td>
                                    <td><input class="won" disabled>원</td>
                                </tr>

                                <tr>
                                    <td class="size"><input value=1 type="checkbox">대<span>(20kg~40kg미만)</span></td>
                                    <td class="selectbox">
                                        <label for="select"></label>
                                        <select disabled>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                    </td>
                                    <td><input class="won" disabled>원</td>
                                </tr>

                                <tr>
                                    <td class="size"><input value=2 type="checkbox">특대<span>(40kg이상)</span></td>
                                    <td class="selectbox">
                                        <label for="select"></label>
                                        <select disabled>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                    </td>
                                    <td><input class="won" disabled>원</td>
                                </tr>
                            </table><br>

                            <table class="dry">
                                <tr>
                                    <th>건조기</th>
                                </tr>
                                <tr>
                                    <td>개수</td>
                                    <td class="blank"></td>
                                    <td class="selectbox">
                                        <label for="select"></label>
                                        <select>
                                            <option>1</option>
                                            <option>2</option>
                                            <option>3</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>이용금액</td>
                                    <td class="blank"></td>
                                    <td><input class="won">원</td>
                                </tr>
                                <input type="hidden" name="equipment">
                            </table><br>
                            <table class="etc">
                                <tr>
                                    <th>부가서비스</th>
                                    <th>추가금액</th>
                                </tr>
                                <tr>
                                    <td><input value=4 type="checkbox">향균세탁</td>
                                    <td><input class="won" disabled>원</td>
                                </tr>
                                <tr>
                                    <td><input value=5 type="checkbox">특수세제(울/유아용등)</td>
                                    <td><input class="won" disabled>원</td>
                                </tr>

                                <tr>
                                    <td><input value=6 type="checkbox">섬유유연제</td>
                                    <td><input class="won" disabled>원</td>
                                </tr>

                                <tr>
                                    <td><input value=7 type="checkbox">픽업봉투</td>
                                    <td><input class="won" disabled>원</td>
                                </tr>
                                <input type="hidden" name="etc">
                            </table>
                            <input type="button" value="가입신청" onclick="clicked();">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="js/joinBs.js"></script>
</body>
</html>