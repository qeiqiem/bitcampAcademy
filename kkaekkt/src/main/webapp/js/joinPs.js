//정규식
const regNo = /^[0-9]+$/; // 숫자만
const regHg = /^[가-힣]+$/; // 한글만
const regEng = /^[a-zA-Z]+$/; //영어만
// const regId = /^[A-Za-z0-9]{6,15}$/;
// 아이디 : 최소 알파벳 하나, 숫자 조합으로 6~15자, 숫자만 불가능
const regId = /(?=.*\d{0,})(?=.*[a-z]{1,}).{6,15}/;
const regPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regName = /^[가-힝a-zA-Z]{2,}$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
const regbth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
//event.preventDefault();
const id = document.getElementById("id");
const pw = document.getElementById("pw");
const repw = document.getElementById("repw");
const name = document.getElementById("name");
const phone = document.getElementById("phone");
const address = document.getElementById("address");
const email = document.getElementById("email");

// submit
const formatpw = 0;
const formatbirth = 0;
const formatad = 0;

window.onload = function () {
  // id
  id.addEventListener("keyup", () => {
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
      console.log(pw);
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
        "비밀번호가 일치하지 않습니다.";
    } else {
      formatpw = 1;
      document.getElementById("pw_label").innerText = "";
    }
  });

  // 생년월일 입력형식 확인
  birth.addEventListener("keyup", () => {
    //20210101
    if (!regbth.test(birth.value)) {
      if (birth.value.length == 0) {
        document.getElementById("birth_label").innerText = "";
      } else {
        document.getElementById("birth_label").innerText =
          " 양식과 맞지 않습니다.  ex) 19990101";
      }
      //   formatbirth = 0;
    } else {
      formatbirth = 1;
      document.getElementById("checkbirth").innerText = "";
    }
  });
};

function check() {
  // 번호 합치기
  var phone =
    document.getElementById("phone1").value +
    "-" +
    document.getElementById("phone2").value +
    "-" +
    document.getElementById("phone3").value;
  document.getElementById("phone").value = phone;

  // 주소 합치기
  var address =
    document.getElementById("postcode").value +
    ", " +
    document.getElementById("roadAddress").value +
    ", " +
    document.getElementById("detailAddress").value +
    ", " +
    document.getElementById("extraAddress").value;
  console.log(address);
  //  document.getElementById("address").value = address;
  address.value = address;
  formatad = 1;
  console.log(address);
}

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

  // $(document).on("keyup", "input:text[numberOnly]",
  // function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
  // 폰 넘버 숫자만
  $("input[name=ph]").keyup(function (event) {
    if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
      var inputVal = $(this).val();
      $(this).val(inputVal.replace(/[^0-9]/gi, ""));
    }
  });

  //생일 숫자만
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

    // 실행안되는 것 같음
    const idchkVal = $("#idchk").val();
    console.log($("#idchk").val());
    if (idchkVal == "N") {
      alert("아이디 중복확인을 해 주세요.");
      $("#id").focus();
      // return false;
    } else if (idchkVal == "Y") {
      $("#joinPerson").submit();
    }

    //
    if ($("#pw").val() == "") {
      alert("비밀번호를 입력하세요.");
      $("#pw").focus();
      return false;
    }
    if ($("#repw").val() == "" || formatpw == 0) {
      alert("비밀번호를 재입력하세요.");
      $("#repw").focus();
      return false;
    }
    if ($("#pw").val() != $("#repw").val()) {
      alert("비밀번호가 일치하지 않습니다.");
      $("#pw").focus();
      return false;
    }
    if ($("#name").val() == "") {
      alert("이름을 입력하세요.");
      $("#name").focus();
      return false;
    }
    if ($("#birth").val() == "") {
      alert("생년월일을 입력하세요.");
      $("#birth").focus();
      return false;
    }

    if ($("#postcode").val() == "" || formatad == 0) {
      alert("주소를 입력하세요.");
      $("#postcode").focus();
      return false;
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
        $("#idchk").attr("value", "Y");
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
