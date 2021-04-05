<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/mymark.css">
</head>
<body>
	<jsp:include page="/jsp/header1.jsp"></jsp:include>
	  <div class="body_container">
        <jsp:include page="sidebar_ps.jsp"></jsp:include>
        <div class="content">
            <p id="mymark_title">내가찜한세탁소</p>
            <hr>
        </div>
    </div>
    <div id="modal_container">
        <button id="modal_close">x</button>
            <p class="modal_Header">예약 하기</p>
            <!-- <p>취급품목</p> -->
	        <hr>
	        <table id="single_option">
                <tr>
                    <th>1~3일 소요</th>
                    <th>수 량</th>
                    <th>금 액</th>
                </tr> 
                <tr>
                     <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">일반세탁</td>
                     <td>
                         <select id="selc'+j+'" class="resOpc" disabled>
                         <option value="1">1</option>
                         <option value="1">2</option>
                         <option value="1">3</option>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                    </td>
                </tr>
                <tr>
                     <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">와이셔츠</td>
                     <td>
                         <select id="selc'+j+'" class="resOpc" disabled>
                         <option value="1">1</option>
                         <option value="1">2</option>
                         <option value="1">3</option>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                    </td>
                </tr>
                <tr>
                     <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">이불</td>
                     <td>
                         <select id="selc'+j+'" class="resOpc" disabled>
                         <option value="1">1</option>
                         <option value="1">2</option>
                         <option value="1">3</option>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                    </td>
                </tr>
                <tr>
                     <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">운동화</td>
                     <td>
                         <select id="selc'+j+'" class="resOpc" disabled>
                         <option value="1">1</option>
                         <option value="1">2</option>
                         <option value="1">3</option>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                    </td>
                </tr>
                 <tr>
                    <th>4~7일 소요</th>
                    <th>수 량</th>
                    <th>금 액</th>
                </tr>
                <tr>
                    <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">가죽모피</td>
                    <td>
                        <select id="selc'+j+'" class="resOpc" disabled>
                        <option value="1">1</option>
                        <option value="1">2</option>
                        <option value="1">3</option>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                   </td>
               </tr>
                <tr>
                    <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">명품가방</td>
                    <td>
                        <select id="selc'+j+'" class="resOpc" disabled>
                        <option value="1">1</option>
                        <option value="1">2</option>
                        <option value="1">3</option>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                   </td>
               </tr>
                <tr>
                    <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">아웃도어</td>
                    <td>
                        <select id="selc'+j+'" class="resOpc" disabled>
                        <option value="1">1</option>
                        <option value="1">2</option>
                        <option value="1">3</option>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                   </td>
               </tr>
                <tr>
                    <td><input class="chkBox" id="chk'+j+'" type="checkbox" value="'+j+'">기타</td>
                    <td>
                        <select id="selc'+j+'" class="resOpc" disabled>
                        <option value="1">1</option>
                        <option value="1">2</option>
                        <option value="1">3</option>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="price'+j+'" value="'+price+'">2400</p>
                   </td>
               </tr>
               <tr id="totalRow">
                    <td id="totalLabel">결제예상금액</td>
                    <td colspan="2" class="totalAll">2000</td>
                </tr>
            </table>
            <div id="modal_footer">
                <p class="modal_Header">결제 정보</p>
                <hr>
                <div class="userInfo">
                    <p>예약자: <span id="mname">나애교</span></p>
                    <p>연락처: <span id="phone">010-9871-6512</span></p>
                    <p>주소: <span id="address">서울시 용산구 두텁바위로 38가길</span></p>
                </div>
                <div class="bsInfo">
                    <p id="bname">예약 업체: <span>테스트클리닝</span></p>
                    <p id="dDay">마감 예정일자: <span>2021.04.09</span></p>
                </div>
                <div class="termsInfo">
                    <p id="terms">개인정보 수집, 제공 &nbsp;</p>
                    <input placeholder="개인정보 수집 동의">
                    <input placeholder="개인정보 제공 동의">
                    <p id="cancelTerms">취소/환불 규정</p>
                    <p id="warning">(주문취소는 1시간 이내에 한하여 자동처리되며, 그 외 업체에 문의 후 처리될 수 있습니다.)</p>
                    <p id="cancelInfo">예약 서비스 이용을 위한 개인정보 수집 및 제3자 제공, 취소/환불 규정을 확인하였으며 이에동의합니다.</p>
                </div>
                <div class="comBtnDiv">
                    <button class="comBtn">결제하기</button>
                </div>	
            </div>
    </div>
    <script>
        var userDetail=`${userDetail}`;
        var likedBsList=`${likedBs}`;
        var likeObj={
            mno:alertObj.sender
        }
    </script>
    <script src="/js/mymark.js"></script>
</body>
</html>