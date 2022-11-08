//joinform_check 함수로 유효성 검사
function joinform_check() {
    //변수에 담아주기
    var uid = document.getElementById("uid");
    var pwd = document.getElementById("pwd");
    var repwd = document.getElementById("repwd");
    var uname = document.getElementById("uname");
    var mobile = document.getElementById("mobile");
    var email_id = document.getElementById("email_id");
   
  
    if (uid.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
      alert("아이디를 입력하세요.");
      uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
      return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
    };
  
    if (pwd.value == "") {
      alert("비밀번호를 입력하세요.");
      pwd.focus();
      return false;
    };
  
    //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
    var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
  
    if (!pwdCheck.test(pwd.value)) {
      alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
      pwd.focus();
      return false;
    };
  
    if (repwd.value !== pwd.value) {
      alert("비밀번호가 일치하지 않습니다..");
      repwd.focus();
      return false;
    };
  
    if (uname.value == "") {
      alert("이름을 입력하세요.");
      uname.focus();
      return false;
    };
  
  
    var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
  
    if (!reg.test(mobile.value)) {
      alert("전화번호는 숫자만 입력할 수 있습니다.");
      mobile.focus();
      return false;
    }
  
    if (email_id.value == "") {
      alert("이메일 주소를 입력하세요.");
      email_id.focus();
      return false;
    }
  
  
    //입력 값 전송
    document.join_form.submit(); //유효성 검사의 포인트   
  }
  
  //아이디 중복체크 팝업창(현재 공백문서)
  function id_check() {
    //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
    switch (uid.value) {
      case "aaaaa" :
        alert('존재하는 아이디 입니다.')       
        break;
      case "bbbbb" :
        alert('존재하는 아이디 입니다.')       
        break;
      case "ccccc" :
        alert('존재하는 아이디 입니다.')       
        break;
      case "ddddd" :
        alert('존재하는 아이디 입니다.')       
        break;
      case "eeeee" :
        alert('존재하는 아이디 입니다.')       
        break;          
      default :
        alert('사용 가능한 아이디입니다.') 
        break;
    }
  }
  
  //이메일 옵션 선택후 주소 자동 완성
  function change_email() {
    var email_add = document.getElementById("email_add");
    var email_sel = document.getElementById("email_sel");
  
    //지금 골라진 옵션의 순서와 값 구하기
    var idx = email_sel.options.selectedIndex;
    var val = email_sel.options[idx].value;
  
    email_add.value = val;
  }
  
  