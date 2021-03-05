<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<jsp:include page="header0.jsp"></jsp:include>

    <!-- 공통 -->
    <div class="body_container">
        <h4>업체 회원</h4>
        <form action="">
            <p>아이디</p>
            <div>
                <input type="text" placeholder="아이디를 입력해주세요."><input type="button" value="중복확인">
            </div>
            <p>비밀번호</p>
            <div>
                <input type="password" placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" minlength="8" maxlength="16">
            </div>
            <p>운영시간</p>
            <div>
                <div>
                    <button>월</button>
                    <button>화</button>
                    <button>수</button>
                    <button>목</button>
                    <button>금</button>
                    <button>토</button>
                    <button>일</button>
                    <button>매일</button>
                    <button>평일</button>
                    <button>주말</button>
                </div>
                <div>
                    <ul>
                        <li>
                            월
                            <!-- for문 돌려버리는게 나은건가.. -->
                            시간
                            <select>
                                <option>00:00</option>
                                <option>01:00</option>
                                <option>02:00</option>
                                <option>03:00</option>
                                <option>04:00</option>
                                <option>05:00</option>
                                <option>06:00</option>
                                <option>07:00</option>
                                <option>08:00</option>
                                <option>09:00</option>
                                <option>10:00</option>
                                <option>11:00</option>
                                <option>12:00</option>
                                <option>13:00</option>
                                <option>14:00</option>
                                <option>15:00</option>
                                <option>16:00</option>
                                <option>17:00</option>
                                <option>18:00</option>
                                <option>19:00</option>
                                <option>20:00</option>
                                <option>21:00</option>
                                <option>22:00</option>
                                <option>23:00</option>
                                <option>24:00</option>
                            </select>
                            ~
                            <select>
                                <option>00:00</option>
                                <option>01:00</option>
                                <option>02:00</option>
                                <option>03:00</option>
                                <option>04:00</option>
                                <option>05:00</option>
                                <option>06:00</option>
                                <option>07:00</option>
                                <option>08:00</option>
                                <option>09:00</option>
                                <option>10:00</option>
                                <option>11:00</option>
                                <option>12:00</option>
                                <option>13:00</option>
                                <option>14:00</option>
                                <option>15:00</option>
                                <option>16:00</option>
                                <option>17:00</option>
                                <option>18:00</option>
                                <option>19:00</option>
                                <option>20:00</option>
                                <option>21:00</option>
                                <option>22:00</option>
                                <option>23:00</option>
                                <option>24:00</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <p>업체명</p>
                <div>
                    <input type="text">
                </div>
                <p>연락처</p>
                <div>
                    <input type="text" placeholder="ex) 010-1234-5678">
                </div>
                <p>사업자등록번호</p>
                <div>
                    <ul>
                        <li>
                            <input type="text" placeholder="사업자등록번호를 입력해주세요">
                        </li>
                    </ul>


                </div>
                <p>주소</p>
                <div>
                    <input type="text"><input type="button" value="주소찾기">
                </div>
                <p>이메일</p>
                <div>
                    <input type="text"> @
                    <select>
                        <option>naver.com</option>
                        <option>daun.net</option>
                        <option>hanmail.net</option>
                        <option>gmail.com</option>
                    </select>
                </div>
                <p>계좌등록</p>
                <div>
                    <select>
                        <option>국민</option>
                        <option>우리</option>
                        <option>신한</option>
                        <option>하나</option>
                        <option>지역농협</option>
                        <option>농협중앙회</option>
                        <option>k뱅크</option>
                        <option>카카오뱅크</option>
                    </select>
                    <input type="text" placeholder="수익금 받을 계좌를 입력하세요">
                </div>

                <!-- 일반세탁소 -->
                <div>
                    <div>
                        <p>세탁소</p>
                    </div>

                    <p>취급품목</p>
                    <div>
                        <div>
                            <p>1~3일 소요</p>
                            <p>금액(개당)</p>
                            <label for="1"></label>
                            <input type="checkbox" id="1">일반의류
                            <input id="1">원<br>

                            <input type="radio" id="1">와이셔츠
                            <input id="1">원<br>

                            <input type="radio" id="1">이불
                            <input id="1">원<br>

                            <input type="radio" id="1">운동화
                            <input id="1">원<br>
                        </div>

                        <div>
                            <p>4~7일 소요</p>
                            <p>금액(개당)</p>
                            <label for="1"></label>
                            <input type="radio" id="1">가죽모피
                            <input id="1">원<br>

                            <input type="radio" id="1">명품가방
                            <input id="1">원<br>

                            <input type="radio" id="1">아웃도어
                            <input id="1">원<br>

                            <input type="radio" id="1">
                            <input id="1" placeholder="기타(모자/가방/인형등)">
                            <input id="1">원<br>
                        </div>
                    </div>
                </div>
                <!-- 코인세탁소 -->
                <div>
                    <div>
                        <p>코인세탁소</p>
                    </div>
                    <p>사양정보</p>
                    <div>
                        <div>
                            <p>세탁기</p>
                            <p>개수</p>
                            <p>이용금액(분당)</p>
                            <label for="1"></label>
                            <input type="radio" id="1">중(20kg미만)
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                            </select>
                            <input id="1">원<br>

                            <label for="1"></label>
                            <input type="radio" id="1">대(20kg~40kg미만)
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                            </select>
                            <input id="1">원<br>

                            <label for="1"></label>
                            <input type="radio" id="1">특대(40kg이상)
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                            </select>
                            <input id="1">원<br>

                        </div>

                        <div>
                            <p>건조기</p>
                            <label for="1"></label>
                            <p>개수</p>
                            <select>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                            </select>
                            <p>이용금액</p>
                            <input id="1">원<br>
                        </div>
                        <div>
                            <p>부가서비스</p>
                            <p>추가금액</p>

                            <input type="radio" id="1">향균세탁
                            <input id="1">원<br>

                            <input type="radio" id="1">특수세제(울/유아용등)
                            <input id="1">원<br>

                            <input type="radio" id="1">섬유유연제
                            <input id="1">원<br>

                            <input type="radio" id="1">픽업봉투
                            <input id="1">원<br>

                        </div>
                    </div>
                </div>
                <input type="submit" value="가입하기">
            </div>
        </form>
    </div>
</body>

</html>