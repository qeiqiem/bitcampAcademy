<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kkaekkt.biz.reservation.ReservationListVO" %>
<%@ page import="com.kkaekkt.biz.reservation.LaundryVO" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/mypage.css">
    <script src="js/jquery-1.12.4.js"></script>
    <script src="js/mypagePs.js"></script>
</head>

<body>
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
                    <c:forEach var="rsv" items="${rsvPage.rsvList}">
                    <div class="rsvBox">
                        <table class="rsvTable">
                            <tr>
                                <th colspan="2">${rsv.bname}</th>
                                <td><i class="fas fa-heart like"></i></td>
                                <!--버튼 어따가 넣을 지 몰라서 여따가 넣습니다..-->
                            </tr>
                            <tr>
                                <td class="column">주문일시</td>
                                <td>${rsv.rsvDate}</td>
                            </tr>
                            <tr>
                                <td class="column">예약번호</td>
                                <td>${rsv.rsvNum}</td>
                            </tr>
                            <tr>
                                <td class="column">전화번호</td>
                                <td>${rsv.phone}</td>
                            </tr>
                            <tr>
                                <td class="column">주문항목</td><!--..이게 되네..??-->
                                <td><span>${rsv.laundryList[0].laundry}</span> 외 <span>${rsv.count}</span>개</td>
                            </tr>
                        </table>
                        <div class="btnDiv">
                            <button>채팅상담</button>
                            <button id="detailBtn">상세보기</button>
                            <button>리뷰쓰기</button>
                        </div>
                        <div class="detail none">
                            <hr>
                            <div1-1>
                                <table class="receipt">
                                    <tr class="column">
                                        <th class="laundry">품목</th>
                                        <th class="count">개수</th>
                                        <th class="price">가격</th>
                                    </tr>
                                    <!--여기부터 js 반복문 삽입-->
                                    <c:forEach var="laundry" items="${rsv.laundryList}">
                                    <tr>
                                        <td class="laundry">${laundry.laundry}</td>
                                        <td class="count">${laundry.count}개</td>
                                        <td class="price">${laundry.price}</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            <hr>
                                <table class="result">
                                    <th>결제금액</th>
                                    <td>&nbsp;&nbsp;</td>
                                    <td><span>${rsv.totalPrice}</span> 원</td>
                                </table>
                        </div1-1>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $("#detailBtn").click(function () {
                console.log("dd");
                $(".detail").toggle(".none");
            });
            $(".like").click(function () {
                $(this).toggleClass("fas");
                $(this).toggleClass("far");
            });
        });
    </script>
</body>

</html>