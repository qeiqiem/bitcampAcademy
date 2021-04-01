// /* 인증번호 이메일 전송 */
// $(".mail_check_button").click(function () {
//   console.log("이메일인증 클릭");

//   var email = $(".mail_input").val(); // 입력한 이메일

//   $.ajax({
//     type: "GET",
//     url: "/mailCheck.do?email=" + email,
//     success: function (data) {
//       //console.log("data : " + data);
//       $(".mail_check_input").attr("disabled", false);
//       $(".mail_check_input").attr("id", "mail_check_input_box_true");
//       // $("#checkemail").text(" 인증번호를 전송했습니다.");
//       alert(" 인증번호를 전송했습니다.");
//       code = data;
//     },
//   });
// });
// /* 인증번호 비교 */
// $("#mail_check").click(function () {
//   var inputCode = $(".mail_check_input").val(); // 입력코드

//   if (inputCode == code) {
//     $("#reqinput").text("");
//     alert(" 인증번호가 일치합니다.");
//     $("#reqinput").html(" 인증이 완료되었습니다.");
//     formatemail = 1;
//     //   $(".mail_check_input").attr("id", "mail_check_input_box_true");
//     $(".mail_check_input").attr("disabled", true);
//     $("#mail_check").attr("disabled", true);
//     console.log(formatemail);

//     $("#reqinput").attr("class", "correct");
//   } else {
//     // 일치하지 않을 경우
//     formatemail = 0;
//     $("#reqinput").text("");
//     alert(" 인증번호를 다시 확인해주세요.");
//     console.log(formatemail);

//     $("#reqinput").attr("class", "incorrect");
//   }
// });
const regPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const regMailCode = /^[0-9]{6}$/;

const pw = document.getElementById("pw");
const repw = document.getElementById("repw");
const email = document.getElementById("email");

let formatpw = 0;
let formatemail = 0;
let formatemailNum = 0;
let mailCode;

// 온로드
window.onload = function () {
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
};
//타이머 전역변수 지정
function $ComTimer() {}
$ComTimer.prototype = {
  comSecond: "",
  timer: "",
  domId: "",
  fnTimer: function () {
    var min = Math.floor(this.comSecond / 60);
    var sec = this.comSecond % 60;
    this.domId.innerText = `${min}:${sec < 10 ? `0${sec}` : sec}`;
    this.comSecond--; // 1초씩 감소
    if (this.comSecond < 0) {
      // 시간이 종료 되었으면..
      clearInterval(this.timer); // 타이머 해제
      alert("인증시간이 초과하였습니다. 다시 이메일 인증을 해 주세요.");
      $("#timeout").hide();
      $(".mail_check_input").attr("disabled", true);
      $("#mail_check").attr("disabled", true);
      $(".mail_check_input").attr("id", "mail_check_input_box_false");
    }
  },
};
var AuthTimer = new $ComTimer();

// 이메일 입력형식 확인
document.getElementById("btn_checkemail").onclick = function () {
  console.log(formatemail);
  if (formatemail == 1) {
    emailApi(); //ajax 실행
  } else {
    alert("이메일을 정확하게 입력하세요.");
  }
};
// 인증번호 이메일 전송
function emailApi() {
  console.log("이메일인증 클릭");
  var email = $(".mail_input").val(); // 입력한 이메일

  $.ajax({
    type: "GET",
    url: "/mailCheck.do?email=" + email,
    success: function (data) {
      //console.log("data : " + data);
      $(".mail_check_input").attr("disabled", false);
      document.getElementById("mail_check").disabled = false;
      $(".mail_check_input").attr("id", "mail_check_input_box_true");
      alert(" 인증번호를 전송했습니다.");
      timerStart();
      code = data;
    },
  });
}

function timerStart() {
  AuthTimer.comSecond = 180;
  AuthTimer.timer = setInterval(function () {
    AuthTimer.fnTimer();
  }, 1000);
  AuthTimer.domId = document.getElementById("timeout");
}
function timeStop() {
  clearInterval(AuthTimer.timer);
}

/* 인증번호 비교 */
document.getElementById("mail_check").onclick = function () {
  checkemailNum();
};

// 인증코드 맞는지 확인 (인증하기 버튼 클릭시 실행)
function checkemailNum() {
  var inputCode = $(".mail_check_input").val(); // 입력코드
  if (regMailCode.test(inputCode)) {
    if (inputCode == code) {
      timeStop();
      formatemailNum = 1;
      alert("메일 인증이 완료되었습니다.");
      $("#timeout").hide();
      $(".mail_check_input").val("");
      $("#mail_check").attr("disabled", true);
      $(".mail_check_input").attr("disabled", true);
      $(".mail_check_input").attr("id", "mail_check_input_box_false");
      doncument.getElementById("btn_checkemail").disabled = true;
      $("#checkemail").val("인증되었습니다.");
    } else if ($("#timeout").text() != "0:00") {
      //시간이 남았는데 코드가 일치하지 않는다면
      formatemailNum = 0;
      alert("인증번호가 일치하지 않습니다.");
    }
  } else {
    //코드가 숫자 6자리가 아니라면
    formatemailNum = 0;
    alert(" 인증번호를 다시 확인해주세요.");
    $("#reqinput").attr("class", "incorrect");
  }
}

function showID() {
  document.getElementById("findID").style.display = "block";
  document.getElementById("findPW").style.display = "none";
}

function showPW() {
  document.getElementById("findID").style.display = "none";
  document.getElementById("findPW").style.display = "block";
}

function check() {
  const inName = document.getElementById("inName");
  const inMail = document.getElementById("inMail");

  if (inName.value == "" && inMail.value == "") {
    alert("이름과 이메일을 모두 입력하세요.");
    id.focus();
    return false;
  }
}

function submit() {
  $("#submit").on("click", function () {
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
    if (formatemailNum != 1) {
      alert("앗! 이메일이 인증되지 않았습니다. 처음부터 다시 시도해 주세요.");
      // return "/jsp/login/find.jsp";
      location.replace("/jsp/login/find.jsp");
      // return false;
    }
    $("form").submit();
  });
}
