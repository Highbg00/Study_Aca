$(document).ready(function() {

    //input 박스 변수할당
        var userId = document.getElementById("userId");
        var userPw = document.getElementById("userPw");
        var userName = document.getElementById("userName");
        var userTel = document.getElementById("userTel");
        var userEmail = document.getElementById("userEmail");
        
        //유효성 검사 변수 지정
        var regUserId = /^[a-z]\w{4,11}$/;
        var regUserPw = /^[a-z]\w{4,11}$/;
        var regUserName = /^[가-힣]{2,5}$/;
        var regUserTel = /^010\d{4}\d{4}$/;
        var regUserEmail = /^[a-z]\w{4,11}@[a-z]{2,10}[\.][a-z][\.]?[a-z]{0,2}$/;
        
        
        document.myForm.onsubmit = function() {
            
        }
        
        document.getElementById("myForm").onsubmit = function () {
            
            if (!userId.value) {
                alert("아이디를 입력하세요");
                userId.focus();
                return false;
            } else if (!regUserId.test(userId.value)) {
                alert("아이디의 형식이 잘못 작성되었습니다. \n" +
                          "아이디는 영문자로 시작하고 5글자에서 12글자입니다.");
                userId.value = "";
                userId.focus();
                return false;
            } //userId if
            
            
            if (!userPw.value) {
                alert("비밀번호를 입력하세요");
                userPw.focus();
                return false;
            } else if (!regUserPw.test(userPw.value)) {
                alert("비밀번호의 형식이 잘못 작성되었습니다. \n" +
                          "비밀번호는 영문자로 시작하고 5글자에서 12글자입니다.");
                userPw.value = "";
                userPw.focus();
                return false;
            } //userPw if
            
            
            if (!userName.value) {
                alert("이름을 입력하세요");
                userName.focus();
                return false;
            } else if (!regUserName.test(userName.value)) {
                alert("이름의 형식이 잘못 작성되었습니다. \n" +
                          "이름은 한글로 시작하고 2글자에서 5글자입니다.");
                userName.value = "";
                userName.focus();
                return false;
            } //userName if
            
            
            if (!userTel.value) {
                alert("전화번호를 입력하세요");
                userTel.focus();
                return false;
            } else if (!regUserTel.test(userTel.value)) {
                alert("전화번호의 형식이 잘못 작성되었습니다.");
                userTel.value = "";
                userTel.focus();
                return false;
            } //userTel if
            
            
            if (!userEmail.value) {
                alert("이메일을 입력하세요");
                userEmail.focus();
                return false;
            } else if (!regUserEmail.test(userEmail.value)) {
                alert("이메일의 형식이 잘못 작성되었습니다.");
                userEmail.value = "";
                userEmail.focus();
                return false;
            } //userEmail if
            
            
        } //onsubmit
        
        document.getElementById("myForm").onreset = function () {
            
    var result = confirm("정말로 회원가입을 취소하시겠습니까?");
            
            if (result) {
                alert("회원가입이 취소되었습니다.");
                userId.focus();
                return false;
            } 
            
            if(!result) {
                userId.focus();
                return false;
            }
            
        } //onreset
        
    });	//ready