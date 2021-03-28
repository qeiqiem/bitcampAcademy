<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/css/login.css">
</head>


<body>
    <jsp:include page="/jsp/header0.jsp"></jsp:include>

    <div class="body_container">
    <a href="http://developers.kakao.com/logout">노간지 로그아웃</a>
        <div class="content">
            <button id="log">
                <a href="#">일반로그인</a>
            </button>
            <button id="log">
                <a href="/jsp/login/loginBs.jsp">업체로그인</a>
            </button>

            <div class="login">
                <form action="/loginPs.do" method="post">
                    <h3>로그인</h3>
                    <hr>
                    <div>
                        <input type="text" name="id" placeholder="아이디">
                    </div>
                    <div>
                        <input type="password" name="password" placeholder="비밀번호">
                    </div>
                    <input type="submit" value="로그인">
                </form>
                <div>
                    <div>
                        <a href="">아이디/비밀번호 찾기</a>
                    </div>
                    <hr>
                    <div>
                        <p>다른 계정으로 로그인</p>

                        <!--api끌어오는거에 따라 가지수는 줄 수 있습니다...-->
                        <a href="naverLogin.jsp"><img src="/img/naver.png"></a> 
                        <a onclick="facebookLogin()">  <img src="/img/facebook.png"></a>
                        <a href="googleLogin.jsp"><img src="/img/google.png"></a> <a
                            onclick="kakaoLogin()"><img src="/img/kakao.png"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 바디콘테이너 --> 
      <%--       <%
        String clientId = "h_yaNKHsI9qSzo9ZPDD8";//애플리케이션 클라이언트 아이디값";
        String redirectURI = URLEncoder.encode("http://localhost:8080/loginSNS.do", "UTF-8");
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
        session.setAttribute("state", state);
        System.out.println(state);
        System.out.println("네이버 로그인 성공?");
        System.out.println(clientId);
     %> --%>
</body>
<script src="/js/kakaoLogin.js"></script>
<script src="/js/TestfacebookLogin.js"></script>
</html>