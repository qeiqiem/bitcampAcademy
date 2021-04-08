<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/2fc57dd2db.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="/css/index.css">
</head>

<body>
<jsp:include page="headerPs.jsp"></jsp:include>
   
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
        <div>
            <p>서비스 개요 영역</p>
        </div>




    </div>

    <footer>
        kkækkt <br>
        info@kkækkt.com <br>
        Copyright © 2021 All right Reserved.
    </footer>

</body>

</html>