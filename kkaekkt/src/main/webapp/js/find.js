// window.onload = function () {
//   const idBox = document.getElementById("findID");
//   const pwBox = document.getElementById("findPW");

//   function showID() {
//     idBox.style.display = "block";
//     pwBox.style.display = "none";
//   }

//   function showPW() {
//     idBox.style.display = "none";
//     pwBox.style.display = "block";
//   }
// };

function showID() {
  document.getElementById("findID").style.display = "block";
  document.getElementById("findPW").style.display = "none";
}

function showPW() {
  document.getElementById("findID").style.display = "none";
  document.getElementById("findPW").style.display = "block";
}
