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

function check() {
  const name = document.getElementById("name");
  const email = document.getElementById("email");

  if (name.value == "" && email.value == "") {
    alert("이름과 이메일을 모두 입력하세요.");
    id.focus();
    return false;
  } else {
    // form.submit();
  }
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
