// 중복확인
function login() {
  if ($("#id").val() == "") {
    alert("아이디를 입력하세요.");
    $("#id").focus();
    return false;
  }

  $.ajax({
    url: "/idchk.do",
    type: "POST",
    data: {
      id: $("#id").val(),
    },
    success: function (data) {
      console.log(data);
      var test = JSON.parse(data);
      console.log(test.state);
      if (test.mno == 0) {
        alert("아이디없음");
        console.log($("#idchk").val());
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