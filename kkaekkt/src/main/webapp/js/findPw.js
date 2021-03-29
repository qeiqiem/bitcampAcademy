/* 인증번호 이메일 전송 */
$(".mail_check_button").click(function () {
  console.log("이메일인증 클릭");
  var email = $(".mail_input").val(); // 입력한 이메일

  $.ajax({
    type: "GET",
    url: "/mailCheck.do?email=" + email,
    success: function (data) {
      //console.log("data : " + data);
      $(".mail_check_input").attr("disabled", false);
      buttonli[6].disabled = false;
      $(".mail_check_input").attr("id", "mail_check_input_box_true");
      alert(" 인증번호를 전송했습니다.");
      code = data;
    },
  });
});
/* 인증번호 비교 */
$("#mail_check").click(function () {
  var inputCode = $(".mail_check_input").val(); // 입력코드

  if (inputCode == code) {
    formatemail = 1;
    $("#reqinput").text("");
    alert(" 인증번호가 일치합니다.");
    $(".mail_input").attr("disabled", true);
    $(".mail_check_input").attr("disabled", true);
    buttonli[6].disabled = true;
    console.log(formatemail);

    $("#reqinput").attr("class", "correct");
  } else {
    // 일치하지 않을 경우
    formatemail = 0;
    $("#reqinput").text("");
    alert(" 인증번호를 다시 확인해주세요.");
    console.log(formatemail);

    $("#reqinput").attr("class", "incorrect");
  }
});
