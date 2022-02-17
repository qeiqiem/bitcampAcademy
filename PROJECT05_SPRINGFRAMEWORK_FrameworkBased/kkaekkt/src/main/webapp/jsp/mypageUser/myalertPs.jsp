<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>알림</title>
        <link rel="stylesheet" href="/css/myalert.css">
        <link rel="stylesheet" href="/css/sidebar.css">
    </head>

    <body>
        <jsp:include page="/jsp/headerPs.jsp"></jsp:include>
        <div class="body_container">
            <jsp:include page="sidebar_ps.jsp"></jsp:include>
            <div class="content">
                <div id="alertHeader">
                    <div id="headerLeft">
                        <button id="total" class="selected">전체</button>
                        <button id="check">결제</button>
                        <button id="complete">완료</button>
                        <button id="reply">답글</button>
                        <button id="cancel">취소</button>
                    </div>
                    <div id="headerRight">
                        <button id="readDelBtn">읽은 알림 삭제</button>
                        <button id="totalDelBtn">모두 삭제</button>
                        <div id="refresh">
                            <i class="fas fa-redo-alt"></i>
                        </div>
                    </div>
                </div>
                <hr>
                <div id="alertListBox">
                </div>
            </div>
        </div>
        <script src="/js/myalert.js"></script>
    </body>

    </html>