<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <!-- <script src="js/header.js"></script> -->
            <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="/css/index.css">
        </head>

        <body>
            <c:choose>
                <c:when test="${user.mtype==1}">
                    <jsp:include page="/jsp/headerPs.jsp"></jsp:include>
                </c:when>
                <c:when test="${user.mtype==2}">
                    <jsp:include page="/jsp/headerBs.jsp"></jsp:include>
                </c:when>
                <c:otherwise>
                    <jsp:include page="/jsp/header.jsp"></jsp:include>
                </c:otherwise>
            </c:choose>
            <div class="body_container">
                <h2>깨끗하게 간편하게 끝.</h2>

                <div class="search_btn">
                    <p>
                        오늘은 어디서 빨래를 할까요?
                    </p>
                    <button class="btn1" type="button" onclick="">세탁소</button>
                    <button class="btn2" type="button" onclick="">코인</button>
                </div>

                <div class="search_box">
                    <input type="text" placeholder="동네를 입력해주세요" name="search" id="searchBar">
                    <button onclick='location.href="/showMap.do"'>
                        <i class="fas fa-search fa-lg "></i>
                        <!-- <i class="fas fa-search fa-2x"></i> -->
                    </button>
                </div>

            </div>

            <footer>
                kkækkt <br>
                info@kkækkt.com <br>
                Copyright © 2021 All right Reserved.
            </footer>

        </body>

        </html>