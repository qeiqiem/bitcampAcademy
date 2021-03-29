// 중복확인
function fn_idchk() {
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
      if (test.state == 1) {
        alert("없는 아이디 입니다.");
      } 
    },
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
    }
  });
}
    
