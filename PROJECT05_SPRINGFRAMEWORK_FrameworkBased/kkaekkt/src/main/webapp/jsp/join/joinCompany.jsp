<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>업체 회원가입</title>
        <link rel="stylesheet" href="/css/join.css">
        <link rel="stylesheet" href="/css/joinPerson.css">
        <link rel="stylesheet" href="/css/joinBs.css">
    </head>

    <body>
        <!-- 헤더 -->
        <jsp:include page="/jsp/header.jsp"></jsp:include>

        <!-- 공통 -->
        <div class="body_container">
            <div class="wrapper_joinInfo">
                <!-- <h2>회원가입</h2> -->
                <div class="join_seq">
                    <div class="join_numBox">
                        <ul>
                            <li class="num">01</li>
                            <li>약관동의</li>
                        </ul>
                    </div>
                    <div>
                        <i class="fas fa-chevron-right fa-3x"></i>
                    </div>
                    <div class="join_numBox">
                        <ul>
                            <li class="num">02</li>
                            <li>회원유형선택</li>
                        </ul>
                    </div>
                    <div>
                        <i class="fas fa-chevron-right fa-3x"></i>
                    </div>
                    <div class="join_numBox numBox_select">
                        <ul>
                            <li class="num">03</li>
                            <li>정보입력</li>
                        </ul>
                    </div>
                    <div>
                        <i class="fas fa-chevron-right fa-3x"></i>
                    </div>
                    <div class="join_numBox">
                        <ul>
                            <li class="num">04</li>
                            <li>가입완료</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="wrapper_select">
                <hr>
                <div class="wrapper_joinCnt">
                    <div class="join_form">
                        <div class="centerDiv">
                            <h3>업체회원</h3>
                            <form action="/joinBs.do" method="POST">
                                <div class="full">
                                    <p>아이디</p>
                                    <!-- <input name="id" id="id" type="text" onfocusout="chkId()" placeholder=""> -->
                                    <input name="id" id="id" type="text" placeholder="">
                                    <!-- <button type="button" id="idChkBtn">중복확인</button> -->
                                    <label id="idchk" class="regexChk hide"></label>
                                    <!-- <label id="idchk" class="regexChk hide">아이디는 6자 이상, 최소 하나의 알파벳(a-z)을 포함해야 합니다.</label> -->
                                </div>
                                <div class="full">
                                    <p>비밀번호</p>
                                    <input type="password" id="pw" onfocusout="chkPw()"
                                        placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" minlength="8" maxlength="16">
                                    <label id="pwchk" class="regexChk hide">영어 대문자, 특수문자, 숫자를 포함한 8~16글자 이내로
                                        입력하세요</label>
                                    <p>비밀번호 확인</p>
                                    <input name="password" id="repw" onfocusout="chkRePw()" type="password"
                                        placeholder="영어 대문자, 특수문자, 숫자를 포함한 8~16글자" minlength="8" maxlength="16">
                                    <label id="pwRechk" class="regexChk hide">비밀번호가 일치하지 않습니다</label>
                                </div>
                                <div>
                                    <p>이메일</p>
                                    <input name="email" id="email" onfocusout="chkEmail()" type="text">
                                    <button type="button" id="emailChkBtn">인증번호 전송</button>
                                    <label id="emailchk" class="regexChk hide">이메일 양식과 맞지 않습니다</label>
                                    <div id="mailChkDiv">
                                        <input id="mailCodeChk" type="text" placeholder="인증번호를 입력해주세요."><span
                                            id='timeout'></span>
                                        <button type="button" id="certified">인증하기</button>
                                    </div>
                                </div>
                                <div>
                                    <p>운영시간</p>
                                    <div class="week">
                                        <button type="button">월</button>
                                        <button type="button">화</button>
                                        <button type="button">수</button>
                                        <button type="button">목</button>
                                        <button type="button">금</button>
                                        <button type="button">토</button>
                                        <button type="button">일</button>
                                        <button type="button" class="two">매일</button>
                                        <button type="button" class="two">평일</button>
                                        <button type="button" class="two">주말</button>
                                    </div>
                                    <div class="weekBox">
                                        <ul>
                                        </ul>
                                        <input type="hidden" name="schedule">
                                    </div>
                                    <div class="phone full">
                                        <p>연락처</p>
                                        <input class="phone" id="phoneNum" name="phone" placeholder="010-1234-5678"
                                            onfocusout="chkPhone()" type='text'>
                                        <label id="phonechk" class="regexChk hide">하이픈(-)을 포함한 번호를 입력하세요</label>
                                    </div>
                                    <div class="full">
                                        <p>업체명</p>
                                        <input type="text" id="bname" name="bname">
                                        <p>사업자등록번호</p>
                                        <input type="text" name="bno" id="bno" placeholder="숫자만 입력하세요" maxlength="10">
                                        <!-- onfocusout="chkBno()" -->
                                        <label id="bnochk" class="regexChk hide">10자리 숫자만 입력하세요</label>
                                    </div>
                                    <div class="address">
                                        <p>주소</p>
                                        <input type="text" id="postcode" placeholder="우편번호" readonly>
                                        <button type="button" onclick=execDaumPostcode() id="btn_address">우편번호
                                            찾기</button><br>
                                        <input type="text" id="roadAddress" placeholder="도로명주소" readonly><br>
                                        <div id="addressWrap">
                                            <input type="text" id="detailAddress" placeholder="상세주소">
                                            <input type="text" id="extraAddress">
                                        </div>
                                        <span id="guide" style="display:none"></span><br>
                                        <input type="hidden" name="address" id="address" value="">
                                        <!--여기에 디비로 보낼 도로명주소+상세주소 해서 보내기-->
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
                                            <input name="bankAccountNum" type="text" id="account"
                                                onfocusout="chkAccount()" placeholder="하이픈(-)을 포함한 거래 계좌를 입력하세요.">
                                        </div>
                                        <label id="accountchk" class="regexChk hide" style="margin-left:120px">하이픈(-)을
                                            포함하여
                                            입력하세요</label>
                                    </div>

                                    <div class="bizType">
                                        <div class="selected">세탁소</div>
                                        <div class="unselected">코인세탁소</div>
                                        <input type="hidden" name="bizType" value=1>
                                    </div>
                                    <!-- 일반세탁소 -->
                                    <div class="laundry">
                                        <h4>취급품목</h4>
                                        <div>
                                            <table>
                                                <tr>
                                                    <th colspan="2">1~3일 소요</th>
                                                    <th>금액 (개당)</th>
                                                </tr>
                                                <tr>
                                                    <td><input value=0 type="checkbox"></td>
                                                    <td class="blank">일반의류</td>

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                                <tr>
                                                    <td><input value=1 type="checkbox"></td>
                                                    <td class="blank">와이셔츠</td>

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                                <tr>
                                                    <td><input value=2 type="checkbox"></td>
                                                    <td class="blank">이불</td>

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                                <tr>
                                                    <td><input value=3 type="checkbox"></td>
                                                    <td class="blank">운동화</td>

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                            </table>
                                            <br>
                                            <table>
                                                <tr>
                                                    <th colspan="2">4~7일 소요</th>
                                                    <th>금액 (개당)</th>
                                                </tr>
                                                <tr>
                                                    <td><input value=4 type="checkbox"></td>
                                                    <td class="blank">가죽모피</td>

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                                <tr>
                                                    <td><input value=5 type="checkbox"></td>
                                                    <td class="blank">명품가방</td>

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                                <tr>
                                                    <td><input value=6 type="checkbox"></td>
                                                    <td class="blank">아웃도어</td>

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>

                                                </tr>
                                                <tr>
                                                    <td><input value=7 type="checkbox"></td>
                                                    <td class="blank"> 기타 <span
                                                            style="font-size:smaller;">(모자/가방/인형)</span>
                                                    </td>
                                                    <!-- <input class="etc" placeholder="모자/가방/인형"></td> -->

                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>

                                                </tr>
                                            </table>
                                            <input type="hidden" name="laundry">
                                        </div>


                                    </div>


                                    <!-- 코인세탁소 -->
                                    <div class="coinLaundry hide">
                                        <h4>사양정보</h4>
                                        <div>
                                            <table class="equipment">
                                                <tr>
                                                    <th colspan="2">세탁기</th>
                                                    <th style="width: 80px;">개수</th>
                                                    <th>이용금액 (1회)</th>
                                                </tr>
                                                <tr>
                                                    <td><input value=0 type="checkbox">
                                                    </td>
                                                    <td>중<span style="font-size:smaller;">(~20kg)</span></td>
                                                    <td class="selectbox">
                                                        <label for="select">1대</label>
                                                        <select disabled>
                                                            <option>1대</option>
                                                            <option>2대</option>
                                                            <option>3대 이상</option>
                                                        </select>
                                                    </td>
                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>

                                                <tr>
                                                    <td><input value=1 type="checkbox"></td>
                                                    <td>대<span style="font-size:smaller;">(20kg ~ 40kg)</span></td>
                                                    <td class="selectbox">
                                                        <label for="select">1대</label>
                                                        <select disabled>
                                                            <option>1대</option>
                                                            <option>2대</option>
                                                            <option>3대 이상</option>
                                                        </select>
                                                    </td>
                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>

                                                <tr>
                                                    <td><input value=2 type="checkbox">
                                                    </td>
                                                    <td>특대<span style="font-size:smaller;">(40kg 초과)</span></td>
                                                    <td class="selectbox">
                                                        <label for="select">1대</label>
                                                        <select disabled>
                                                            <option>1대</option>
                                                            <option>2대</option>
                                                            <option>3대 이상</option>
                                                        </select>
                                                    </td>
                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                            </table><br>

                                            <table class="dry">
                                                <tr>

                                                </tr>
                                                <tr>
                                                    <th style="width: 95px;">건조기</th>
                                                    <th style="width: 120px;">개수</th>
                                                    <th>이용금액 (1회)</th>

                                                </tr>
                                                <td></td>
                                                <td class="selectbox">
                                                    <label for="select">1대</label>
                                                    <select>
                                                        <option>1대</option>
                                                        <option>2대</option>
                                                        <option>3대 이상</option>
                                                    </select>
                                                </td>
                                                <td><input class="won" title="숫자만 입력하세요."
                                                        style="margin:0; margin-right: 10px;">원</td>

                                            </table><br>

                                            <input type="hidden" name="equipment">

                                            <table class="etc">
                                                <tr>
                                                    <th colspan="2">부가서비스</th>
                                                    <th>추가금액</th>
                                                </tr>
                                                <tr>
                                                    <td><input value=4 type="checkbox"></td>
                                                    <td>향균세탁</td>
                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                                <tr>
                                                    <td><input value=5 type="checkbox"></td>
                                                    <td>특수세제 <span style="font-size:smaller;">(울/유아용등)</span> </td>
                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>

                                                <tr>
                                                    <td><input value=6 type="checkbox"></td>
                                                    <td>섬유유연제</td>
                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>

                                                <tr>
                                                    <td><input value=7 type="checkbox"></td>
                                                    <td>픽업봉투</td>
                                                    <td><input class="won" title="숫자만 입력하세요." disabled>원</td>
                                                </tr>
                                            </table>
                                            <input type="hidden" name="etc">
                                        </div>
                                    </div>
                                </div>
                                <div class="join_btn">
                                    <button type="reset" name="reset">다시입력</button>
                                    <button type="button" id="join" onclick="clicked()">가입하기</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- footer -->
        <jsp:include page="/jsp/footer.jsp"></jsp:include>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="/js/joinBs.js"></script>
        <script src="/js/adress.js"></script>
    </body>

    </html>