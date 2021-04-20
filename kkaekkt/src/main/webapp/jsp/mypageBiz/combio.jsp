<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> -->
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매장관리</title>
    <link rel="stylesheet" href="/css/bsbio.css">
    <link rel="stylesheet" href="/css/delete.css">
</head>


<body>
    <jsp:include page="/jsp/headerBs.jsp"></jsp:include>
    <div class="body_container">
        <div>
            <jsp:include page="sidebar_bs.jsp"></jsp:include>
        </div>
        <div class="content">
            <div class="content_header">
                <style>
                    .content {
                        width: 75%;
                    }

                    .content_header span {
                        color: var(--black-color);
                    }
                </style>
                <p><span id="bname" readonly style="font-size: larger;"></span>님 반갑습니다.</p>
                <div id="title_right">
                    찜 <span id="likeNum"></span>명 / 내 평점 <span id="avglike"></span>
                    <span id="starIcon"></span>
                </div>
            </div>
            <hr>
            <div class="bio_wrap">
                <form action="/updateBs.do" method="POST">
                    <style>
                        #clickmask {
                            width: 62vw;
                            height: 63vh;
                            display: block;
                            /* background: black; */
                            opacity: 57%;
                            z-index: 28;
                            position: absolute;
                            top: 195px;
                        }
                    </style>
                    <div id="clickmask"></div>
                    <div id="bizform">
                        <div class="bizinfo content_wrap">
                            <b>업체정보</b>
                            <hr>
                            <table>
                                <tr>
                                    <td>업체명</td>
                                    <td>사업자등록번호</td>
                                    <td>계좌번호</td>
                                </tr>
                                <tr>
                                    <td id="bizname"></td>
                                    <td name="bno"></td>
                                    <td>
                                        <select name="bankNum" id="bankNum">
                                            <option value=0></option>
                                            <option value=1>국민</option>
                                            <option value=2>신한</option>
                                            <option value=3>하나</option>
                                            <option value=4>우리</option>
                                            <option value=5>IBK기업은행</option>
                                            <option value=6>NH농협은행</option>
                                            <option value=7>카카오뱅크</option>
                                        </select>
                                        <input type="text" name="bankAccountNum" id="bankAccNum"> <br>
                                        <label id="checkAcc"></label>

                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- ~biz info -->

                        <div class="bizMemberInfo content_wrap">
                            <b>가입정보</b>
                            <hr>
                            <div class="info_wrap">
                                <div class="bioleft">
                                    <table>
                                        <tr>
                                            <td>아이디</td>
                                            <td><input type="text" name="id" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>비밀번호</td>
                                            <td>
                                                <input name="password" type="password" id="curpwd">
                                                <button type="button" id="btn_checkpwd">수정하기</button></br>
                                                <label id="checkpwd"></label>
                                            </td>
                                        </tr>
                                        <br>
                                        <tr>
                                            <td> 새 비밀번호</td>
                                            <td>
                                                <input type="password" id="pwd"></br>
                                                <label id="checkval"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>새 비밀번호 확인</td>
                                            <td>
                                                <input type="password" id="newpwd">
                                                <button type="button" id="btn_updatepwd">변경하기</button></br>
                                                <label id="match"></label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <!-- right -->
                                <div class="bioright">
                                    <table>
                                        <tr>
                                            <td>연락처</td>
                                            <td>
                                                <input id="phone1" type='text' maxlength='3'> -
                                                <input id="phone2" type="text" maxlength='4'> -
                                                <input id="phone3" type="text" maxlength='4'>
                                                <input name="phone" type="tel" id="phone" value="" hidden>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>이메일</td>
                                            <td>
                                                <input name="email" type="email" value="" id="email" class="mail_input">
                                                <button type="button" id="btn_checkemail" class="mail_check_button">이메일
                                                    인증</button></br>
                                                <label id="checkemail" value=""></label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div id="mailChkDiv">
                                                    <input class="mail_check_input" id="mail_check_input_box_false"
                                                        disabled="disabled"><span id='timeout'></span>
                                                    <button type="button" id="mail_check">확인하기</button>
                                                </div>
                                            </td>
                                            <br>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- 가입정보 -->

                        <div id="combioAddress" class="content_wrap">
                            주소 <br>
                            <input type="text" id="postcode" placeholder="우편번호">
                            <button type="button" onclick=execDaumPostcode() id="btn_address">우편번호 찾기</button><br>
                            <input type="text" id="roadAddress" placeholder="도로명주소"><br>
                            <!-- <span id="guide" style="color:#999;"></span><br> -->
                            <input type="text" id="detailAddress" placeholder="상세주소">
                            <input type="text" id="extraAddress" placeholder="참고항목">
                            <span id="guide" style="color:#999;display:none"></span><br>
                            <input type="hidden" name="address" id="address" value="">
                            <!--여기에 디비로 보낼 도로명주소+상세주소 해서 보내기-->
                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                            <script src="/js/adress.js"></script>
                        </div>
                        <!-- 주소 -->

                    </div>
                    <input type="hidden" name="mno" value="" id="mno">
                </form>
                <div id="btn_update">
                    <button type="button" onclick="" id="updateBio">수정하기</button>
                    <div id="btn_change">
                        <button type="button" onclick="" id="resetBio">돌아가기</button>
                        <button type="button" onclick="" id="submitBio">수정완료</button>
                    </div>
                </div>
                <!-- 버튼영역 -->
            </div>
            <!-- 모달부분 -->
            <div id="mask"></div>
            <p id="textDel">
                kkækkt을 탈퇴하고 싶으신가요? 정말요?...
                <a href="#" onclick="delete_show();" id="modal_show" style="cursor: pointer;">회원탈퇴</a>
                <input type="hidden" class="DUorderChk" value="${reservation.count}" />
            </p>
            <style>
                /* #textDel{
                    margin: 80px 0 0 43px;
                }  */
                #mask {
                    top: 0;
                    left: 0;
                }
            </style>
            <div class="word">
                <div id="modal_container">
                    <button id="modal_close">
                        <i class="fas fa-times"></i>
                    </button>
                    <div id="modal_bodycont">
                        <!--  <form action="/deletePs.do" name=form method="POST">-->
                        <div id="modal_head">
                            <div>
                                <input name="name" id="name" value="${sessionScope.user.name} 님" readonly>
                            </div>
                            <!-- <hr> -->
                            <p>탈퇴하면 모든 정보가 지워집니다. <br>정말 탈퇴하시겠어요?</p>
                            <div>
                                <input id="deleteid" name="id" value="${sessionScope.user.id}" readonly />
                                <br>
                                <input type="password" name="password" id="deletepwd" onkeyup="enterkey();"
                                    placeholder="비밀번호">
                            </div>
                        </div>

                        <div id="modal_foot">
                            <input id="yes" type="button" value="예" onclick="cheekpwd()" />
                            <input id="nope" type="button" value="아니오" />
                        </div>
                        <!--  </form> -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var pageObj = {//세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
            bno: '${bs.bno}',
            mno: '${bs.mno}',
            likedNum: '${bs.likedNum}',
            eval: '${bs.eval}',
            bname: '${bs.bname}',
            bankNum: '${bs.bankNum}',
            bankAccNum: '${bs.bankAccountNum}',
            id: '${bs.id}',
            password: '${bs.password}',
            phone: '${bs.phone}',
            email: '${bs.email}',
            address: '${bs.address}'

        };


    </script>
    <script src="/js/bsbio.js"></script>
    <script src="/js/delete.js"></script>

</body>

</html>