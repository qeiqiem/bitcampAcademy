const findID = document.getElementById("findID");
const findPW = document.getElementById("findPW");
// const unselect = "unselect";

function showID() {
  findID.style.display = "block";
  findPW.style.display = "none";
  findID.classList.remove("unselect");
  findPW.classList.add("unselect");
}

function showPW() {
  findID.style.display = "none";
  findPW.style.display = "block";
  findID.classList.add("unselect");
  findPW.classList.remove("unselect");
}

function idSubmit() {
  const name = document.getElementById("name");
  const email = document.getElementById("email");

  if (name.value == "" || email.value == "") {
    alert("이름과 이메일을 모두 입력하세요.");
    name.focus();
  } else {
    nameEmail();
  }
}

function nameEmail() {
  $.ajax({
    url: "/findId.do",
    type: "POST",
    data: {
      name: $("#name").val(),
      email: $("#email").val(),
    },
    success: function (data) {
      console.log(data);
      var info = JSON.parse(data);
      console.log(info);
      console.log(info.id);
      if (info.id != null) {
        document.findID.submit();
      } else if (info.id == null) {
        alert("해당 정보로 가입된 내역이 없습니다.");
        return false;
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
    },
  });
}

// 아이디 유무 확인
function pwSubmit() {
  
  $.ajax({
    url: "/idchk.do",
    type: "POST",
    data: {
      id: $("#id").val(),
    },
    success: function (data) {
      // if (data == "") {
        // alert("아이디를 입력하세요.");
        // id.focus();
        // return false;
      // } else 
      if (data == 0) {
        alert("해당 정보로 가입된 내역이 없습니다.");
      } else if (data == 1) {
        $('#findPwForm').submit();
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
    },
  });
}

// $(document).ready(function () {
//   $(".id").click(function () {
//     if ($(".pw").hasClass("select")) {
//       $(this).removeClass("select");
//     }
//     $(".id").addClass("select");
//   });
//   $(".pw").click(function () {
//     if ($(".id").hasClass("select")) {
//       $(this).removeClass("select");
//     }
//     $(".pw").addClass("select");
//   });
// });
