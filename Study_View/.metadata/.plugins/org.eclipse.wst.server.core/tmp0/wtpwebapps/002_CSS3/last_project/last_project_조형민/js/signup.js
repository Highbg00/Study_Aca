function pwtest() {
  var p1 = document.getElementById("pw1").value;
  var p2 = document.getElementById("pw2").value;
  if (p1 != p2) {
    alert("비밀번호가 일치 하지 않습니다");
    return false;
  } else {
    return hh();
  }
}
function hh() {
  alert("gd");
}
