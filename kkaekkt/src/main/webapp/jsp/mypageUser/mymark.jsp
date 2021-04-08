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
    <div id="mask"></div>
	<jsp:include page="/jsp/headerPs.jsp"></jsp:include>
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
            </table>
            <div id="modal_footer">
                <p class="modal_Header">결제 정보</p>
                <hr>
                <div class="userInfo">
                    <p>예약자: <span id="mname">${userDetail.mname}</span></p>
                    <p>연락처: <span id="phone">${userDetail.phone}</span></p>
                    <p>주소: <span id="address">${userDetail.address}</span></p>
                </div>
                <div class="bsInfo">
                    <p>예약 업체: <span id="bname"></span></p>
                    <p>마감 예정일자: <span id="dDay"></span></p>
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
                    <button id="comBtn">결 제</button>
                    <button id="closeBtn">취 소</button>
                </div>
            </div>
    </div>
    <script>
        var likedBsList=${likedBsList};
        var likeObj={
            mno:alertObj.sender
        }
    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="/js/mymark.js"></script>
</body>
</html>