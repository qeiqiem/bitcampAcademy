<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/415f6f6023.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
        .body_container {
            color: rgba(125, 125, 125, 1);
            margin-left: 270px;
        }

        .body_container input {
            vertical-align: left;
        }

        input {
            width: 200px;
            height: 30px;
            margin-top: 10px
        }

        select {
            width: 150px;
            padding: .8em .5em;
            border: 1px solid #999;
            font-family: inherit;
            background: url('arrow.jpg') no-repeat 95% 50%;
            border-radius: 0px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        select::-ms-expand {
            display: none;
        }

        .bioInfo {
            margin-top: 100px;
        }

        .bioleft {
            float: left;
            margin-right: 100px;
        }

        .bioright {
            margin-bottom: 120px;
        }

        .address {
            text-align: left;
        }
        .btn_coinbioClick{
            display: none;
        }

        .btn_group button {
            width: 110px;
            height: 35px;
            background-color: #616161;
            color: white;
        }

        .btn_groupUp button {
            width: 110px;
            height: 35px;
            background-color: #8FBCFF;
            color: #616161;

            text-align: center;
        }

        .btn_group th {
            text-align: left;
        }
       



    </style>
    <script>
var fomatpw = 0;
	var fomatbirth = 0;			// 1일때가 유효성 통과했을때
    var content = document.getElementsByClassName("userinfo");

        window.onload = function () {

            var inputli = content[0].getElementsByTagName('input');
            for (var i = 3; i < inputli.length; i++) {
                inputli[i].disabled = true;
            }
        
            var buttonli = content[0].getElementsByTagName('button');
            for (var i = 3; i < buttonli.length; i++) {
                buttonli[i].disabled = true;
            }

            //수정하기 버튼 클릭시 수정완료 돌아가기 버튼 활성화, 인풋창 활성화
            document.getElementById("btn_updatebio").onclick = function btnChange() {
                //수정완료 돌아가기 버튼 활성화, 인풋창 활성화
                document.getElementById("btn_updatebio").style.display = "none";
                document.getElementById("btn_coinbioClick").style.display = "block";
                //인풋창 활성화
                for (var i = 3; i < inputli.length; i++) {
                    if (i != 3 && i != 4) {
                        inputli[i].disabled = false;
                    }
                }
                //수정, 이메일인증, 우편번호 찾기 버튼 활성화

                for (var i = 3; i < buttonli.length; i++) {
                    if (i != 4) {
                        buttonli[i].disabled = false;
                    }
                }

            }

            //돌아가기버튼 클릭시 수정하기 버튼 활성화, 인풋창 비활성화
            document.getElementById("btn_back").onclick = function btnChange() {
                document.getElementById("btn_mybio").style.display = "block";
                document.getElementById("btn_mybioClick").style.display = "none";
                document.getElementsByTagName('input').disabled = true;
                //인풋창 비활성화, 입력값 초기화(기존에 받아온 값으로 바껴야하느데..)
                for (var i = 3; i < inputli.length; i++) {
                    inputli[i].disabled = true;

                }
                //본인인증, 우편번호 찾기 버튼 비활성화
                for (var i = 3; i < buttonli.length; i++) {
                    if (i != 4) {
                        buttonli[i].disabled = true;
                    }
                }
            }

        }
    </script>

</head>

<body>
    <div class="body_container">
        <div class="userinfo">
            <table>
                <tr>
                <td>홍길동</td><td>님 반갑습니다.</td>
            </tr>
            <tr>
               <td> 찜<span>140</span>명/ 내 평점 4.7 <i class="fas fa-star"></i></td>
            </tr>
            </table>
            <hr>
            <form action="">
                <div class="bizinfo">
                    업체정보
                    <hr>
                    <table>
                        <th>업체명</th>
                        <th>사업자등록번호</th>
                        <th>계좌번호</th>
                        <tr>
                            <td><input type="text" value="받아온 정보" readonly></td>
                            <td><input type="text" value="받아온 정보" readonly></td>
                            <td><select>
                                    <option>국민</option>
                                    <option>우리</option>
                                    <option>신한</option>
                                    <option>하나</option>
                                    <option>지역농협</option>
                                    <option>농협중앙회</option>
                                    <option>k뱅크</option>
                                    <option>카카오뱅크</option>
                                </select> <input type="text" placeholder="123-1263-1225-11" readonly>

                            </td>
                        </tr>


                    </table>
                    <div class="bioInfo">
                        가입정보
                        <hr>
                        <div class="btn_group">
                            <div class="bioleft">
                                <table>
                                    <tr>
                                        <th>아이디</th>
                                        <td><input type="text" id="3" value="받아온 정보" readonly></td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호</th>
                                        <td><input type="text" id="4" readonly></td>
                                        <td> <button id="btn_updatepwd" onclick="click_pwd()">수 정</button></td>
                                    </tr>
                                    <br>
                                    <tr>
                                        <th>새 비밀번호</th>
                                        <td><input type="text" id="4" readonly></td>
                                    <tr>
                                        <th>새 비밀번호 확인</th>
                                        <td><input type="text" id="4" readonly></td>
                                        <td><button id="4" type="submit">변경하기</button></td>
                                    </tr>
                                    </tr>
                                </table>
                            </div>

                            <!-- right -->
                            <div class="bioright">
                                <table>
                                    <tr>
                                        <th>연락처</th>
                                        <td><input value="받아온 정보" readonly></td>
                                        <td><button id="5">본인인증</button></td>
                                    </tr>
                                    <th>이메일</th>
                                    <td> <input type="text" id="7" value="받아온 정보" readonly></td>
                                    <td><button id="7">변경하기</button></td>

                                </table>
                            </div>
                            <br>
                            <!-- 주소 api 긁어오면 포멧이 변할예정 -->
                            <div class="address">
                                <table>
                                    <tr>
                                        <th>주소</th>
                                    <tr>
                                        <td><input type="text" id="6" value="우편번호" readonly></td>
                                        <td><button id="6">주소찾기</button></td>
                                    </tr>
                                    </tr>
                                    <tr>
                                        <td><input type="text" value="도로명주소" readonly></td>
                                        <td><input type="text" value="지번주소" readonly></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" value="상세주소" readonly></td>
                                        <td><input type="text" value="참고사항" readonly></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <br>
                        <div class="btn_groupUp">
                            <button id="btn_updatebio">수정하기</button>

                            <div id="btn_coinbioClick" style="display: none;">
                                <button type="submit" id="btn_coinbiofin">수정완료</button>
                                <button type="reset" id="btn_back">돌아가기</button>
                            </div>

                        </div>
                    </div>
            </form>
        </div>

    </div>

    </div>
</body>

</html>