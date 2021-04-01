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
