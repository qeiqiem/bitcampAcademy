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
    <!--<script src="js/mypagePs.js"></script>-->
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
            init();
            $('.nav2 div').click(function() {
                // if($(this).index()==1) {
                //     var dd={mno:${sessionScope.member.mno}};
                //     $.post({
                //         url:"ajax.do",
                //         data:dd,
                //         success: function(data) {
                //             var test=JSON.parse(data);
                //             console.log(test.mno);
                //         }
                //     });
                // }
            });
        });
        function init() {
            console.log('이닛 진입');
            var jj={'mno':${sessionScope.member.mno}};
            $.post({
                url:"ajax.do",
                data:jj,
                success: function(data) {
                    var rsv=JSON.parse(data);
                    var list=rsv.rsvList;
                    var test=list.values;
                    console.log(typeof test);
                    
                }
            });
        }
    </script>
</body>
</html>