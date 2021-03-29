//정규식
const regNo = /^[0-9]+$/; // 숫자만
const regHg = /^[가-힣]+$/; // 한글만
const regEng = /^[a-zA-Z]+$/; //영어만
// const regId = /^[A-Za-z0-9]{6,15}$/;
// 아이디 : 최소 알파벳 하나, 숫자 조합으로 6~15자, 숫자만 불가능
const regId = /(?=.*\d{0,})(?=.*[a-z]{1,}).{6,15}/;
const regPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regName = /^[가-힝a-zA-Z]{2,}$/;
// const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const regBth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
// 전화번호 형태 : 전화번호 형태 000-0000-0000 만 받는다.
const regPh = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

//event.preventDefault();
const id = document.getElementById("id");
const pw = document.getElementById("pw");
const repw = document.getElementById("repw");
const name = document.getElementById("name");
const phone = document.getElementById("phone");
const address = document.getElementById("address");
const email = document.getElementById("email");

// submit
let formatpw = 0;
let formatbirth = 0;
let formatad = 0;
let formatph = 0;
let formatemail = 0;
let formatidchk = 0;

window.onload = function () {
  // iput 아래 label 창 알림
  // id
  id.addEventListener("keyup", () => {
    formatidchk = 0;
    if (!regId.test(id.value)) {
      if (id.value.length == 0) {
        document.getElementById("id_label").innerText = "";
      } else {
        document.getElementById("id_label").innerText =
          "아이디는 6자 이상, 최소 하나의 알파벳(a-z)을 포함해야 합니다.";
      }
    } else {
      document.getElementById("id_label").innerText = "";
    }
  });

  // pw
  pw.addEventListener("keyup", () => {
    if (!regPw.test(pw.value)) {
      if (pw.value.length == 0) {
        document.getElementById("pw_label").innerText = "";
      } else {
        document.getElementById("pw_label").innerText =
          "비밀번호를 특수문자,문자,숫자 포함 8~16자리 이내로 입력하세요.";
      }
    } else {
      document.getElementById("pw_label").innerText = "";
    }
  });

  // re pw
  repw.addEventListener("keyup", () => {
    if (repw.value != pw.value) {
      document.getElementById("repw_label").innerText =
        "위 비밀번호와 일치하지 않습니다.";
    } else {
      formatpw = 1;
      document.getElementById("repw_label").innerText = "";
    }
  });
  // 생년월일 입력형식 확인
  birth.addEventListener("keyup", () => {
    //20210101
    if (!regBth.test(birth.value)) {
      if (birth.value.length == 0) {
        document.getElementById("birth_label").innerText = "";
      } else {
        document.getElementById("birth_label").innerText =
          "생년월일을 양식에 맞춰 입력하세요.  ex) 19990101";
      }
      //   formatbirth = 0;
    } else {
      formatbirth = 1;
      document.getElementById("birth_label").innerText = "";
    }
  });
  // 전화번호 입력형식 확인
  birth.addEventListener("keyup", () => {
    // if (!regPh.test(phone.value)) {
    if (!regPh.test(phone.value)) {
      if (phone.value.length == 0) {
        document.getElementById("phone_label").innerText = "";
      } else {
        document.getElementById("phone_label").innerText =
          "연락 가능한 번호를 양식에 맞춰 입력하세요.";
      }
    } else {
      formatph = 1;
      document.getElementById("phone_label").innerText = "";
    }
  });
  // 이메일 입력형식 확인
  email.addEventListener("keyup", () => {
    //20210101
    formatemail = 0;
    if (!regEmail.test(email.value)) {
      //   formatemail = 0;
      if (email.value.length == 0) {
        document.getElementById("checkemail").innerText = "";
      } else {
        document.getElementById("checkemail").innerText =
          "이메일을 양식에 맞춰 입력하세요.";
      }
    } else {
      email.disabled = false;
      document.getElementById("checkemail").innerText = "";
    }
  });

  // 이메일 버튼 클릭시
  $("btn_checkemail").on("click", function () {
    //   $(".mail_check_button").click(function () {
    //   if (!regEmail.test(email.value)) {
    //   formatemail == 0
    if (regEmail.test(email.value)) {
      //이메일이 양식에 맞을 경우
      // emailAjax(email.value);
    } else {
      alert("이메일을 정확하게 입력하세요.");
      $("#email").focus();
      return false;
    }

    if (email.value.length == 0) {
      alert("이메일을 입력하세요.");
      $("#email").focus();
      return false;
    }
  });

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
        $(".mail_check_input").attr("id", "mail_check_input_box_true");
        // $("#checkemail").text(" 인증번호를 전송했습니다.");
        alert(" 인증번호를 전송했습니다.");
        code = data;
      },
    });
  });
  /* 인증번호 비교 */
  $("#mail_check").click(function () {
    var inputCode = $(".mail_check_input").val(); // 입력코드

    if (inputCode == code) {
      $("#reqinput").text("");
      alert(" 인증번호가 일치합니다.");
      $("#reqinput").html(" 인증이 완료되었습니다.");
      formatemail = 1;
      //   $(".mail_check_input").attr("id", "mail_check_input_box_true");
      $(".mail_check_input").attr("disabled", true);
      $("#mail_check").attr("disabled", true);
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
};

// 입력시 불가 문자 삭제
// Jquery
$(document).ready(function () {
  //아이디 한글입력 안되게 처리 */
  $("input[name=id]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^a-z0-9]/gi, ""));
    }
  });
  // 이름 영어+한글만 입력
  $("input[name=name]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(
        inputVal.replace(/^[0-9]+$|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g, "")
        // 이름 한글만 입력 가능
        // inputVal.replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g, "")
      );
    }
  });
  // 폰 넘버 숫자만
  //   $("input[name=ph]").keyup(function (event) {
  //     if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
  //       var inputVal = $(this).val();
  //       $(this).val(inputVal.replace(/[^0-9]/gi, ""));
  //     }
  //   });
  // 폰넘버
  $("input[name=phone]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^0-9-]$/gi, ""));
    }
  });

  //생일 숫자만
  $("input[name=birth]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^0-9]/gi, ""));
    }
  });

  // 이메일 영어+숫자
  $("input[name=email]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(
        inputVal.replace(
          /[^a-z0-9+$|[ \[\]{}()<>?|`~!#$%^&*-_+=,.;:\"\\]/gi,
          ""
        )
      );
    }
  });
});

// 중복확인
function fn_idchk() {
  if ($("#id").val() == "") {
    alert("아이디를 입력하세요.");
    $("#id").focus();
    return false;
  }
  if ($("#id").val().length < 6) {
    alert("아이디를 6자 이상으로 입력해 주세요.");
    $("#id").focus();
    return false;
  }

  if (!regId.test(id.value)) {
    alert("아이디는 6자 이상, 최소 하나의 알파벳(a-z)을 포함해야 합니다.");
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
        alert("중복된 아이디가 있습니다.");
      } else if (test.state == 0) {
        // $("#idchk").attr("value", "Y");
        formatidchk = 1;
        alert("사용 가능한 아이디입니다.");
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

function fn_combine() {
  //   번호 합치기
  //   let phone =
  //     document.getElementById("phone1").value +
  //     "-" +
  //     document.getElementById("phone2").value +
  //     "-" +
  //     document.getElementById("phone3").value;
  //   document.getElementById("phone").value = phone;
  //   formatph = 1;
  //   console.log(phone);
  //   주소 합치기
  let address =
    document.getElementById("postcode").value +
    ", " +
    document.getElementById("roadAddress").value +
    ", " +
    document.getElementById("detailAddress").value +
    ", " +
    document.getElementById("extraAddress").value;
  console.log(address);
  document.getElementById("address").value = address;
  address.value = address;
  formatad = 1;
  console.log(address);
}

//submit check
// function submit_check() {
$("#join_submit").on("click", function () {
  fn_combine();
  //   //   번호 합치기
  //   let phone =
  //     document.getElementById("phone1").value +
  //     "-" +
  //     document.getElementById("phone2").value +
  //     "-" +
  //     document.getElementById("phone3").value;
  //   document.getElementById("phone").value = phone;
  //   formatph = 1;
  //   console.log(phone);
  //   //   주소 합치기
  //   let address =
  //     document.getElementById("postcode").value +
  //     ", " +
  //     document.getElementById("roadAddress").value +
  //     ", " +
  //     document.getElementById("detailAddress").value +
  //     ", " +
  //     document.getElementById("extraAddress").value;
  //   console.log(address);
  //   document.getElementById("address").value = address;
  //   address.value = address;
  //   formatad = 1;
  //   console.log(address);

  //
  const idchkVal = $("#idchk").val();
  if (formatidchk == 0) {
    alert("아이디 중복확인을 해 주세요.");
    $("#id").focus();
    return false;

    // if (formatidchk == 1) {
    //   $("#joinPerson").submit();
    //   alert("가입이 완료되었습니다.");
  }
  //
  if ($("#pw").val() == "") {
    alert("비밀번호를 입력하세요.");
    $("#pw").focus();
    return false;
  }
  if ($("#repw").val() == "" || formatpw != 1) {
    alert("비밀번호를 재입력하세요.");
    $("#repw").focus();
    return false;
  }
  // if ($("#pw").val() != $("#repw").val()) {
  //   alert("비밀번호가 일치하지 않습니다.");
  //   $("#pw").focus();
  //   return false;
  // }
  if ($("#name").val() == "") {
    alert("이름을 입력하세요.");
    $("#name").focus();
    return false;
  }
  if ($("#birth").val() == "" || formatbirth != 1) {
    alert("생년월일을 입력하세요.");
    $("#birth").focus();
    return false;
  }

  if ($("#phone").val() == "" || formatph != 1) {
    alert("전화번호를 입력하세요.");
    $("#phone").focus();
    return false;
  }
  if ($("#postcode").val() == "" || formatad != 1) {
    alert("주소를 입력하세요.");
    $("#postcode").focus();
    return false;
  }
  if ($("#email").val() == "" || formatemail != 1) {
    alert("이메일을 인증하세요.");
    $("#email").focus();
    return false;
  } else {
    $("form").submit();
  }
});
// }
