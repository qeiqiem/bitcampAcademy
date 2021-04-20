<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us</title>
        <link rel="stylesheet" href="/css/aboutUs.css">
    </head>

    <body>
        <header>
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
        </header>

        <section class="body_container">
            <h2>만든 사람들<br>
                About Us</h2>
            <hr>

            <div class="personalInfo">
                <ul class="info_kk">
                    <li class="photo">
                        <img src="/img/kk.png" class="personalImg">
                    </li>
                    <li id="name">
                        <span style="font-weight: bolder; letter-spacing:0.3vw;">김가경 </span> Gakyeong Kim
                    </li>
                    <li id="job">
                        Developer
                        <br> <br>
                    </li>
                    <li id="nation">
                        <span style="font-weight: bolder;">+82</span> Republic of Korea
                    </li>
                    <li id="mail">
                        <a href="mailto:qeiqiem@gmail.com">
                            <i class="fas fa-envelope"></i> qeiqiem@gmail.com
                        </a>
                        <br><br><br><br>
                    </li>
                </ul>
                <hr>
            </div>

            </div>
            <div class="personalInfo">
                <ul class="info_sj">
                    <li class="photo">
                        <img src="/img/sj.png" class="personalImg">
                    </li>
                    <li id="name">
                        <span style="font-weight: bolder; letter-spacing:0.3vw;">양수정 </span> Sujeong Yang
                    </li>
                    <li id="job">
                        Developer
                        <br> <br>
                    </li>
                    <li id="nation">
                        <span style="font-weight: bolder;">+82</span> Republic of Korea
                    </li>
                    <li id="mail">
                        <a href="mailto:122kim122so@gmail.com">
                            <i class="fas fa-envelope"></i> su165036@naver.com
                        </a>
                        <br><br><br><br>
                    </li>
                </ul>
                <hr>
            </div>

            <div class="personalInfo">
                <ul class="info_hm">
                    <li class="photo">
                        <img src="/img/ok.png" class="personalImg">
                    </li>
                    <li id="name">
                        <span style="font-weight: bolder; letter-spacing:0.3vw;">장주옥 </span> Ju Ok Jang
                    </li>
                    <li id="job">
                        Developer
                        <br> <br>
                    </li>
                    <li id="nation">
                        <span style="font-weight: bolder;">+82</span> Republic of Korea
                    </li>
                    <li id="mail">
                        <a href="mailto:dear_hyemii@naver.com">
                            <i class="fas fa-envelope"></i> jangpaul@kakao.com
                        </a>
                        <br><br><br><br>
                    </li>
                </ul>
                <hr>
            </div>

            <div class="personalInfo">
                <ul class="info_je">
                    <li class="photo">
                        <img src="/img/ty.png" class="personalImg">
                    </li>
                    <li id="name">
                        <span style="font-weight: bolder; letter-spacing:0.3vw;">황태연 </span> Taeyeon Hwang
                    </li>
                    <li id="job">
                        Developer
                        <br> <br>
                    </li>
                    <li id="nation">
                        <span style="font-weight: bolder;">+82</span> Republic of Korea
                    </li>
                    <li id="mail">
                        <a href="mailto:silverhong@naver.com">
                            <i class="fas fa-envelope"></i> hty018@naver.com
                        </a>
                        <br><br><br><br>
                    </li>
                </ul>
                <hr>
            </div>

            <div class="personalInfo">
                <ul class="info_sj">
                    <li class="photo">
                        <img src="/img/soj.png" class="personalImg">
                    </li>
                    <li id="name">
                        <span style="font-weight: bolder; letter-spacing:0.3vw;">김소정 </span> Sojung Kim
                    </li>
                    <li id="job">
                        Developer
                        <br> <br>
                    </li>
                    <li id="nation">
                        <span style="font-weight: bolder;">+82</span> Republic of Korea
                    </li>
                    <li id="mail">
                        <a href="mailto:122kim122so@gmail.com">
                            <i class="fas fa-envelope"></i> 122kim122so@gmail.com
                        </a>
                        <br><br><br><br>
                    </li>
                </ul>
                <hr>
            </div>
        </section>


    </body>

    </html>