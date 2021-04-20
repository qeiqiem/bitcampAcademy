<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>FAQ</title>
    </head>
    <script>
      window.onload = function () {
        const items = document.querySelectorAll(".accordion button");

        function toggleAccordion() {
          const itemToggle = this.getAttribute("aria-expanded");

          for (i = 0; i < items.length; i++) {
            items[i].setAttribute("aria-expanded", "false");
          }

          if (itemToggle == "false") {
            this.setAttribute("aria-expanded", "true");
          }
        }

        items.forEach((item) => item.addEventListener("click", toggleAccordion));

      }

    </script>

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
      <style>
        .body_container {
          text-align: center;
        }

        .body_container h2 {
          font-weight: bolder;
          font-size: 45px;
          margin: 40px 100px 20px;
          /* margin-left: 100px; */
          text-align: left;
        }

        .body_container hr {
          width: 90%;
        }

        .Faqcontainer {
          margin: 0 auto;
          padding: 4rem;
          width: 66rem;
          color: var(--text-gray);
        }

        .accordion .accordion-item {
          border-bottom: 1px solid #e5e5e5;
        }

        .accordion .accordion-item button[aria-expanded=true] {
          border-bottom: 1px solid var(--key-text);
        }

        .accordion button {
          position: relative;
          display: block;
          text-align: left;
          width: 100%;
          padding: 1em 0;
          color: var(--text-grey);
          font-size: 1.15rem;
          font-weight: 400;
          border: none;
          background: none;
          outline: none;
        }

        .accordion button:hover,
        .accordion button:focus {
          cursor: pointer;
          color: var(--key-text);
        }

        .accordion button:hover::after,
        .accordion button:focus::after {
          cursor: pointer;
          color: var(--key-text);
          border: 1px solid var(--key-text);
        }

        .accordion button .accordion-title {
          padding: 1em 1.5em 1em 0;
        }

        .accordion button .icon {
          display: inline-block;
          position: absolute;
          top: 18px;
          right: 0;
          width: 22px;
          height: 22px;
          border: 1px solid;
          border-radius: 22px;
        }

        .accordion button .icon::before {
          display: block;
          position: absolute;
          content: "";
          top: 9px;
          left: 5px;
          width: 10px;
          height: 2px;
          background: currentColor;
        }

        .accordion button .icon::after {
          display: block;
          position: absolute;
          content: "";
          top: 5px;
          left: 9px;
          width: 2px;
          height: 10px;
          background: currentColor;
        }

        .accordion button[aria-expanded=true] {
          color: var(--key-text);
        }

        .accordion button[aria-expanded=true] .icon::after {
          width: 0;
        }

        .accordion button[aria-expanded=true]+.accordion-content {
          opacity: 1;
          max-height: 9em;
          transition: all 200ms linear;
          will-change: opacity, max-height;
        }

        .accordion .accordion-content {
          opacity: 0;
          max-height: 0;
          overflow: hidden;
          transition: opacity 200ms linear, max-height 200ms linear;
          will-change: opacity, max-height;
        }

        .accordion .accordion-content p {
          font-size: 1rem;
          font-weight: 300;
          margin: 2em 0;
          text-align: left;
        }

        .side_sub {
          display: none;
        }
      </style>
      <div class="body_container">
        <h2>자주 묻는 질문 <br>
          FAQ</h2>
        <hr>
        <div class="contend">
          <div class="Faqcontainer">
            <!-- <h2>자주 묻는 질문</h2>
        <hr> -->
            <div class="accordion">
              <div class="accordion-item">
                <button id="accordion-button-1" aria-expanded="false"><span class="accordion-title">[ 이용방법 ]</span><span
                    class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>예약완료 후 문 앞에 세탁물을 놓아 두시면 24시간 이내에 수거합니다. <br>고지한 세탁기간 안에 세탁이 완료될 예정이며, 세탁 완료 알람 이후 3일 내에 배송이 완료됩니다.
                  </p>
                </div>
              </div>
              <div class="accordion-item">
                <button id="accordion-button-2" aria-expanded="false"><span class="accordion-title">[ 배송 ]
                    배송 기간이 어떻게 되나요?</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>세탁 기간은 세탁물에 따라 1~3일, 4~7일 정도 소요됩니다. 세탁 완료 후 3일 내에 고객님의 세탁물이 배송됩니다.</p>
                </div>
              </div>
              <div class="accordion-item">
                <button id="accordion-button-2" aria-expanded="false"><span class="accordion-title">[ 배송 ]
                    배송 기간이 짧은 상품을 부분 배송으로 더 빨리 받을 순 없나요?</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>부분 배송은 현재 지원하고 있지 않습니다. <br>배송 기간은 주문 시 세탁 소요기간이 가장 긴 상품을 기준으로 측정됩니다. 소요 기간이 짧은 상품만 별도로 주문해 주세요.
                  </p>
                </div>
              </div>
              <div class="accordion-item">
                <button id="accordion-button-3" aria-expanded="false"><span class="accordion-title">[ 배송 ] 세탁물이
                    누락되었습니다.</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>채팅상담 또는 연락처를 통해 업체와 연락바랍니다.</p>
                </div>
              </div>
              <div class="accordion-item">
                <button id="accordion-button-4" aria-expanded="false"><span class="accordion-title">[ 결제 ] 예약 후 결제까지
                    완료했지만 취소하고 싶어요.
                  </span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>예약 후 1시간 이내에만 취소가 가능합니다.<br>
                    1시간이 지났다면 업체와 채팅상담이나 전화연락으로 취소해 주세요. 업체 사정에 따라 거부될 수도 있습니다.</p>
                </div>
              </div>
              <div class="accordion-item">
                <button id="accordion-button-7" aria-expanded="false"><span class="accordion-title">[ 결제 ] 결제수단을 변경하고
                    싶어요.</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>결제완료 이후에는 결제수단 변경이 가능하지 않습니다.<br>
                    예약 취소 후 원하시는 결제수단으로 다시 한 번 예약해 주시기 바랍니다.</p>
                </div>
              </div>
              <div class="accordion-item">
                <button id="accordion-button-5" aria-expanded="false"><span class="accordion-title">[ 취소 ] 예약 취소했는데, 수거해
                    갔어요.</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>채팅상담 또는 연락처를 통해 업체와 연락바랍니다.</p>
                </div>
              </div>
              <div class="accordion-item">
                <button id="accordion-button-6" aria-expanded="false"><span class="accordion-title">[ 취소 ] 예약했는데,
                    취소되었어요.</span><span class="icon" aria-hidden="true"></span></button>
                <div class="accordion-content">
                  <p>업체 사정에 따라서 예약이 취소될 수 있습니다. 채팅상담 또는 연락처를 통해 업체와 연락바랍니다.</p>
                </div>
              </div>


            </div>
            <!--accordion end-->
          </div>
          <!--contaoner end-->
        </div>
      </div>
    </body>

    </html>