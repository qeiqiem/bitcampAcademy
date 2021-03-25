//정규식
const regId = /^[A-Za-z0-9]{4,10}$/;
const regPw = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regName = /^[가-힝a-zA-Z]{2,}$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

//event.preventDefault();
const id = document.getElementById("id");
const pw = document.getElementById("pw");
const repw = document.getElementById("repw");
const name = document.getElementById("name");
const phone = document.getElementById("phone");
const address = document.getElementById("ad");
const email = document.getElementById("email");

window.onload = function () {
  if (!regPw.test(pw.value)) {
    console.log(pw);
    // if (pw.value.length == 0) {
    //   document.getElementById("pw_label").innerText = "";
    // } else {
    document.getElementById("pw_label").innerText =
      "비밀번호를 형식에 맞게 입력하세요.";
    document.getElementById("pw_label").style.color = "rgba(254, 54, 54, 0.55)";
    // }
  }
  //   else {
  //     document.getElementById("pw_label").innerText = "";
  //   }

  // if (id == pageObj["password"]) {
  //     formatpw = 1;
  //     document.getElementById("checkpwd").innerText
  //     = " 아래 새 비밀번호를 입력하세요";
};

function check() {
  var address =
    document.getElementById("postcode").value +
    ", " +
    document.getElementById("roadAddress").value +
    ", " +
    document.getElementById("detailAddress").value +
    ", " +
    document.getElementById("extraAddress").value;
  console.log(address);
  document.getElementById("address").value = address;
  console.log(address);
}

$(document).ready(function () {
  //한글입력 안되게 처리 */
  $("input[name=id]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^a-z0-9]/gi, ""));
    }
  });

  //한글만 입력
  $("input[name=name]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(
        inputVal.replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g, "")
      );
    }
  });

  // $(document).on("keyup", "input:text[numberOnly]",
  // function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
  // 숫자만
  $("input[name=ph]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^0-9]/gi, ""));
    }
  });

  //생일
  $("input[name=birth]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^0-9]/gi, ""));
    }
  });

  // console.log($("#idchk").val());

  $("#submit").on("click", function () {
    // if ($("#id").val() == "") {
    // 	alert("아이디를 입력하세요.");
    // 	$("#id").focus();
    // 	return false;
    // }
    if ($("#pw").val() == "") {
      alert("비밀번호를 입력하세요.");
      $("#pw").focus();
      return false;
    }
    if ($("#repw").val() == "") {
      alert("비밀번호를 재입력하세요.");
      $("#repw").focus();
      return false;
    }
    if ($("#name").val() == "") {
      alert("이름을 입력하세요.");
      $("#name").focus();
      return false;
    }

    if ($("#postcode").val() == "") {
      alert("주소를 입력하세요.");
      $("#postcode").focus();
      return false;
    }

    // 실행안되는 것 같음

    const idchkVal = $("#idchk").val();
    if (idchkVal == "N") {
      alert("아이디 중복확인을 해 주세요.");
      // return false;
    } else if (idchkVal == "Y") {
      $("#joinPerson").submit();
    }
  });
});

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

  console.log("#idchk");
  console.log($("#idchk").val());

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
        $("#idchk").attr("value", "Y");
        alert("사용 가능한 아이디입니다.");
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
