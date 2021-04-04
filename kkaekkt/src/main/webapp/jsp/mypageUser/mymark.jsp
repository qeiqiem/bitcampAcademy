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
        <div id="modal_leftBody">
            <div id="modal_leftHeader">
                <p class="more_title"><span id="bname"></span> 취급 품목</p>
            </div>
            <!-- <p>취급품목</p> -->
	        <hr>
	        <table id="single_option">
                <tr>
                    <th>1~3일 소요</th>
                    <th>개</th>
                    <th>예상비용</th>
                </tr> 
                <tr>
                     <td><input class="chkBox" id="" type="checkbox" value="">일반의류</td>
                     <td>
                         <select id="" class="resOpc" disabled>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="" value=""></p>
                    </td>
                </tr>
                <tr>
                     <td><input class="chkBox" id="" type="checkbox" value="">와이셔츠</td>
                     <td>
                         <select id="" class="resOpc" disabled>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="" value=""></p>
                    </td>
                </tr>
                <tr>
                     <td><input class="chkBox" id="" type="checkbox" value="">이불</td>
                     <td>
                         <select id="" class="resOpc" disabled>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="" value=""></p>
                    </td>
                </tr>
                <tr>
                     <td><input class="chkBox" id="" type="checkbox" value="">운동화</td>
                     <td>
                         <select id="" class="resOpc" disabled>
                        </select>
                    </td>
                     <td>
                         <p class="res_price" id="" value=""></p>
                    </td>
                </tr>
                 <tr>
                    <th>4~7일 소요</th>
                    <th>개</th>
                    <th>예상비용</th>
                </tr>
                <tr>
                    <td><input class="chkBox" id="" type="checkbox" value="">가죽모피</td>
                    <td>
                        <select id="" class="resOpc" disabled>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="" value=""></p>
                   </td>
               </tr>
                <tr>
                    <td><input class="chkBox" id="" type="checkbox" value="">명품가방</td>
                    <td>
                        <select id="" class="resOpc" disabled>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="" value=""></p>
                   </td>
               </tr>
                <tr>
                    <td><input class="chkBox" id="" type="checkbox" value="">아웃도어</td>
                    <td>
                        <select id="" class="resOpc" disabled>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="" value=""></p>
                   </td>
               </tr>
                <tr>
                    <td><input class="chkBox" id="" type="checkbox" value="">기타</td>
                    <td>
                        <select id="" class="resOpc" disabled>
                       </select>
                   </td>
                    <td>
                        <p class="res_price" id="" value=""></p>
                   </td>
               </tr>
               <tr id="totalRow">
                    <td id="totalLabel">결제예상금액</td>
                    <td class="totalAll">0</td>
                </tr>
            </table>
        </div>
        <div id="verticalLine"></div>
        <div id="modal_rightBody">
            <p>결제 정보</p>
            <hr>
            <div class="userInfo">
                <p>예약자 : <span>${seesionScope.user.name}</span></p>
                   <p>연락처 : <span id="userPhone"></span></p>
                <p>이메일 : <span id="userEmail"></span></p>
                <p>주소 : <span id="address"></span></p>
            </div>
            <div class="sellerInfo">
               <p id="seller">판매자정보 &nbsp;</p>	
                <p id="terms">개인정보 수집, 제공 &nbsp;</p>
                <input placeholder="개인정보 수집 동의">
                <input placeholder="개인정보 제공 동의">
                <p id="cancelTerms">취소/환불 규정 <span>주문 1시간이내 취소가능</span></p>
                <p>예약 서비스 이용을 위한 개인정보 수집 및 제3자 제공, 취소/환불 규정을 확인하였으며 이에동의합니다.</p>
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