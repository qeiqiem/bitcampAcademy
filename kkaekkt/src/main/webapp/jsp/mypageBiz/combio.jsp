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
  	<link rel="stylesheet" href="/css/combio.css">
  	<script src="/js/combio.js"></script>

</head>

<body>
<jsp:include page="/jsp/header2.jsp"></jsp:include>
    <div class="body_container">
    <jsp:include page="sidebar_bs.jsp"></jsp:include>
        <div class="userinfo">
            <table>
                <tr>
                <input name="name" id="name" value="${personBs.bname } 님 반갑습니다." readonly /> 
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
                            <td><input type="text" value="받아온 정보"></td>
                            <td><input type="text" value="받아온 정보"></td>
                            <td><select>
                                    <option>국민</option>
                                    <option>우리</option>
                                    <option>신한</option>
                                    <option>하나</option>
                                    <option>지역농협</option>
                                    <option>농협중앙회</option>
                                    <option>k뱅크</option>
                                    <option>카카오뱅크</option>
                                </select> <input type="text" placeholder="123-1263-1225-11">

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
                                        <td><input type="text" id="4"></td>
                                        <td> <button id="btn_updatepwd" onclick="click_pwd()">수 정</button></td>
                                    </tr>
                                    <br>
                                    <tr>
                                        <th>새 비밀번호</th>
                                        <td><input type="text" id="4"></td>
                                    <tr>
                                        <th>새 비밀번호 확인</th>
                                        <td><input type="text" id="4"></td>
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
                                        <td><input value="받아온 정보"></td>
                                        <td><button type="button" id="5">본인인증</button></td>
                                    </tr>
                                    <th>이메일</th>
                                    <td> <input type="text" id="7" value="받아온 정보"></td>
                                    <td><button type="button" id="7">변경하기</button></td>

                                </table>
                            </div>
                            <br>
                            <!-- 주소 api 긁어오면 포멧이 변할예정 -->
                            <div class="address">
                                <table>
                                    <tr>
                                        <th>주소</th>
                                    <tr>
                                        <td><input type="text" id="6" value="우편번호"></td>
                                        <td><button type="button" id="6">주소찾기</button></td>
                                    </tr>
                                    </tr>
                                    <tr>
                                        <td><input type="text" value="도로명주소"></td>
                                        <td><input type="text" value="지번주소"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="text" value="상세주소"></td>
                                        <td><input type="text" value="참고사항"></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <br>
                        <div class="btn_groupUp">
                            <button type="button" id="btn_updatebio">수정하기</button>

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