var id = document.getElementById("id");

// 중복확인
function login() {

  $.ajax({
    url: "/idchk.do",
    type: "POST",
    data: {
      id: $("#id").val(),
    },
    success: function (data) {
      var user = JSON.parse(data);
      console.log(user);
      
      if (user.mno == 0) {
        alert("아이디없음"); // 이부분 모달나오게 하고싶다
        console.log($("#idchk").val());
      } else {
      	alert($("#name")+"님 환영한다");
      }
    },
    // , failure: function (errMsg) {
    // 	alert(errMsg);
    // }

    error: function (request, status, error) {
      console.log(
        "code:" +
          request.status +
          "\n" +
          "message:" +
          request.responseText +
          "\n" +
          "error:" +
          error
      );
    },
  });
}