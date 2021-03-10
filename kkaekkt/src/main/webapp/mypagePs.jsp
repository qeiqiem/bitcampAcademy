<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kkaekkt.biz.user.PersonVO" %>
<%@ page import="com.kkaekkt.biz.reservation.ReservationListVO" %>
<%@ page import="com.kkaekkt.biz.reservation.LaundryVO" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/mypage.css">
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="js/mypagePs.js"></script>
</head>

<body>
	<jsp:include page="header0.jsp"></jsp:include>
    <div class="body_container">
        <div class="my_container">
            <!--nav 바2-->
            <div class="nav2">
                <div>
                    <p>진행중인 주문</p>
                </div>
                <div>
                    <p>완료된 주문</p>
                </div>
            </div>
            <!--주문목록 내용div-->
            <div class="content">
                <p>진행중 주문</p>
                <hr>
                <div class="rsvList">

                </div>
            </div>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            var member={'mno':${sessionScope.member.mno}}; //세션에서 정보를 받아오는건 독립된 js파일에서 불가능, jsp 내에서만 가능하기 때문에 여기서 값을 받아준다.
            ajax(member); //처음 마이페이지 들어왔을 때, 진행중 주문 항목 출력
            $('.rsvList').on("click",".detailBtn",function() { // 버블링으로 생성된 주문에 클릭 이벤트 활성화
                $('#detail'+$(this).val()).toggleClass('none');
            });
            $('.nav2 div').click(function() { // 완료된 주문 출력
                console.log("클릭");
                ajax(member);
            });
        });
    </script>
</body>
</html>