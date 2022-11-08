$(document).ready(function() {
//------------------------------------------------------------------------
// 	var name = document.signupForm.name;
// 	var id = document.signupForm.id;
// 	var pw = document.signupForm.pw;
// 	var pwCheck = document.signupForm.pwCheck;
// 	var email = document.signupForm.email;
// 	var tel1 = document.signupForm.tel1;
// 	var tel2 = document.signupForm.tel2;
// 	var tel3 = document.signupForm.tel3;

//★★★★★값을 사용하려면 name.value★★★★★로 사용
//------------------------------------------------------------------------	

//------------------------------------------------------------------------	
//	var name = document.getElementById("name");
//	var id = document.getElementById("id");
//	var pw = document.getElementById("pw");
//	var pwCheck = document.getElementById("pwCheck");
//	var email = document.getElementById("email");
//	var tel1 = document.getElementById("tel1");
//	var tel2 = document.getElementById("tel2");
//	var tel3 = document.getElementById("tel3");

//★★★★★값을 사용하려면 name.value★★★★★로 사용
//------------------------------------------------------------------------	
	var name = $("#name");
	var id = $("#id");
	var pw = $("#pw");
	var pwCheck = $("#pwCheck");
	var email = $("#email");
	var tel1 = $("#tel1");
	var tel2 = $("#tel2");
	var tel3 = $("#tel3");
	
//★★★★★값을 사용하려면 $("#name").val()★★★★★로 사용
	
	//var regTel = /^(010|011|016|017|018|019)\d{3,4}\d{4}$/;
	var regName = /^[가-힣]{2,5}$/;
	var regId = /^[a-z]\w{4,11}$/;
	var regPw = /^[a-z]\w{4,11}$/;
	var regPwCheck = /^[a-z]\w{4,11}$/;
	
	var regEmail = /^[a-z]\w{4,11}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
	var regTel1 = /^010$/;
	//var regTel1 = /^010|011|016|017|018|019)$/;
	//var regTel1 = /^01([0|1|6|7|8|9])$/;
	var regTel2 = /^\d{4}$/;
	var regTel3 = /^\d{4}$/;

	var idCheck;
	var emailCheck;

	//document.signupForm.onsubmit = function() {
	//$("#signupForm").submit(function() {
	$("#submitBtn").click(function(){	
//		if (!name.value) {
		if (!name.val()) {
//		if (name.value=="") {
//		if (!name.val()=="") {  
			alert("이름를 입력해주세요");
			name.focus();
			return false;
		} 
		
//		if(!regName.test(name.value)) {
		if(!regName.test(name.val())) {
//		if(regName.test(name.value==false) {
//		if(regName.test(name.val())==false) {
			alert("이름은 한글로 2글자 이상 5글자로 입력하세요!");
			name.focus();
			return false;			
		} 
		
//		if (id.val()=="") {
		if (!id.val()) {
			alert("아이디를 입력해주세요");
			id.focus();
			return false;
		} 
		
		if(regId.test(id.value)==false) {
//		if(!regId.test(id.value)) {
			alert("아이디는 영문자로 시작하고 5글자 이상 11글자로 입력하세요!");
			id.focus();
			return false;			
		} 
		
		if (idCheck == false) {
			alert("중복된 아이디입니다.");
			id.focus();
			console.log("id check");
			console.log(idCheck);
			return false;
		}
		
		if (pw.val()=="") {
//		if (!pw.value) {
			alert("비밀번호를 입력해주세요");
			pw.focus();
			return false;
		} 
		
		if(regPw.test(pw.value)==false) {
//		if(!regPw.test(pw.value)) {
			alert("비밀번호는 영문자로 시작하고 5글자 이상 11글자로 입력하세요!");
			pw.val("");
//			pw.value="";
			pw.focus();
			return false;			
		}
		
		if (pwCheck.val()=="") {
//		if (!pwCheck.value) {
			pwCheck.focus();
			alert("비밀번호확인란에 비밀번호를 입력해주십시오");
			return false;
		}
		
		if(regPwCheck.test(pwCheck.val())==false) {
//		if(!regPwCheck.test(pwCheck.value)) {
			alert("비밀번호는 영문자로 시작하고 5글자 이상 11글자로 입력하세요!");
			pwCheck.val("");
//			pwCheck.value="";
			pwCheck.focus();
			return false;			
		}
		
		if(pw.val() != pwCheck.val()) {
//		if(pw.value != pwCheck.value) {
			alert("비밀번호가 일치하지 않습니다.");
			pwCheck.val("");
//			pwCheck.value="";
			pwCheck.focus();
			return false;
		}
		
		if (email.val()=="") {
//		if (!email.value) {
			alert("이메일를 입력해주세요");
			email.focus();
			return false;
		}
		
		if (regEmail.test(email.val())==false) {
//		if (!regEmail.test(email.value)) {
			alert("이메일 양식에 맞게 입력해 주세요");
			email.focus();
			return false;
		}
		
		if (emailCheck == false) {
			alert("중복된 이메일입니다.");
			email.focus();
			console.log("email check");
			console.log(emailCheck);
			return false;
		}
		
		if (tel1.val()=="") {
//		if (!tel1.value) {
			alert("전화번호 첫번째자리 입력하세요!");
			tel1.focus();
			return false;
		} else if (regTel1.test(tel1.val())==false) {
//		if (!regTel1.test(tel1.value)) {
			alert("국번은 010만 가능합니다!")
			tel1.val("");
//			tel1.value="";
			tel1.focus();
			return false; 
		}
		
		if (tel2.val()=="") {
//		if (!tel2.value) {
			alert("전화번호 두번째자리를 입력하세요!");
			tel2.focus();
			return false;
		}
		
		if (regTel2.test(tel2.val())==false) {
//		if (!regTel2.test(tel2.value)) {
			alert("가운데 숫자는 숫자로 4자만 가능!");
			tel2.val("");
//			tel2.value="";
			tel2.focus();
			return false;
		}
		
		if (tel3.val()=="") {
//		if (!tel3.value) {
			alert("전화번호 세번째자리를 입력하세요!");
			tel3.focus();
			return false;
		}
		
		if (regTel3.test(tel3.val())==false) {
			alert("마지막 숫자는 숫자로 4자만 가능!");
			tel3.val("");
//			tel3.value="";
			tel3.focus();
			return false;
		}
		
		alert("회원가입이 완료되었습니다.");
		//location.replace("index.html");
		location.href="index.html";
		return false;
		
	//}; //onsubmit 함수
	}); //submit,click 이벤트
	
	document.signupForm.onreset = function () {
	//$("#signupForm").reset(function () {
		
		var input = confirm("회원가입을 취소하시겠습니까?");

		if (input == true) {
			alert("회원 가입이 취소 되었습니다\n메인페이지로 이동합니다.");
			location.replace("index.html");
			return false;
		} else {
			return false;
		}
		
	}; //onreset 함수
	//}); //reset 이벤트
	
	/* 이름 형식 확인 */
	$("#name").keyup(function(){
		
		if (!$(this).val()) {
			$(".nameSpan").html("&nbsp;");
		//} else if (!regName.test($(this).val())) {
		} else if (!regName.test($("#name").val())) {
			$(".nameSpan").html("한글로 2글자 이상 5글자!").css("color","red");
		} else {
			$(".nameSpan").html("사용 가능한 이름입니다.").css("color","yellowgreen");
		} //if
		
	}); //name keyup
	
	/* 아이디 중복 및 형식 확인 */
	$("#id").keyup(function() {
		
		idCheck = true; //true : 중복 안됨
		
		$.ajax({
			
			url: "loginCheck.json",
			async: false, /* 중요 */
			
			success: function(result){

				$(result).each(function(key, value){
					
					if($("#id").val() == value.id) {
						idCheck = false; //false : 중복
					} //if
				
				}); //each
				
			} //success
			
		}); //ajax	
		console.log("id keyup 이벤트");
		console.log(idCheck);
		
		if (!$(this).val()) {
			$(".idSpan").html("&nbsp;");
		//} else if (!regId.test($(this).val())) {
		} else if (!regId.test($("#id").val())) {
			$(".idSpan").html("영문자로 시작하고 5글자 이상 11글자!").css("color","red");
		} else if (idCheck == true) { //true : 중복 안됨
			$(".idSpan").html("사용 가능한 아이디입니다.").css("color","yellowgreen");
		} else if (idCheck == false) { //false : 중복
			$(".idSpan").html("중복된 아이디입니다.").css("color","red");
		} //if
		
	});//id keyup

	/* 아이디 중복 및 형식 idCheckBtn 버튼으로 확인  */
 	//document.signupForm.idCheckBtn.onclick = function(){ //}로 끝남
	//document.getElementById("idCheckBtn").onclick = function(){ //}로 끝남
	$("#idCheckBtn").click(function(){ //}); 로 끝남
		
		idCheck = true; //true : 중복 안됨
		
		$.ajax({
			
			url: "loginCheck.json",
			async: false, /* 중요 */
			
			success: function(result){

				$(result).each(function(key, value){
					
					if($("#id").val() == value.id) {
						idCheck = false; //false : 중복
					} //if
				
				}); //each

			} //success
			
		}); //ajax	
		console.log("idCheckBtn 클릭");
		console.log(idCheck);
		
		if (!$("#id").val()) {
			alert("아이디를 입력하세요");
			$("#id").focus();
		//} else if (!regId.test($(this).val())) {
		} else if (!regId.test($("#id").val())) {
			alert("영문자로 시작하고 5글자 이상 11글자로 입력하세요!");
			$("#id").focus();
		} else if (idCheck == true) {
			alert("사용 가능한 아이디입니다.");
			$("#pw").focus();
		} else {
			alert("중복된 아이디입니다.");
			$("#id").focus();
		} //if		
		
	}); //$("#idCheckBtn").click(function(){ ★★★★ click 이벤트와 onclick이벤트의 차이점
	//}; //document.signupForm.idCheckBtn.onclick = function(){

	/* 비밀번호 형식 확인 */
	$("#pw").keyup(function() {
		
		if (!$(this).val()) {
			$(".pwSpan").html("&nbsp;");
		//} else if (!regPw.test($(this).val())) {
		} else if (!regPw.test($("#pw").val())) {
			$(".pwSpan").html("영문자로 시작하고 5글자 이상 11글자!").css("color","red");
		} else {
			$(".pwSpan").html("사용 가능한 비밀번호입니다.").css("color","yellowgreen");
		} //if
	
		console.log("pw keyup 이벤트");
		console.log(idCheck);
		
	}); //pw keyup	
	
	/* 비밀번호 확인 형식 확인 */
	$("#pwCheck").keyup(function(){
		
		if (!$(this).val() || !$("#pw").val()) {
			$(".pwCheckSpan").html("&nbsp;");
		//} else if (!regPwCheck.test($(this).val())) {
		} else if (!regPwCheck.test($("#pwCheck").val())) {
			$(".pwCheckSpan").html("영문자로 시작하고 5글자 이상 11글자!").css("color","red");
		} else if ($(this).val().length != $("#pw").val().length){
			$(".pwCheckSpan").html("비밀번호가 일치하지 않습니다.").css("color","red");
		} else if ($(this).val() == $("#pw").val()) {
			$(".pwCheckSpan").html("비밀번호가 일치합니다.").css("color","yellowgreen");
		} //if
		
	}); //pwCheck keyup		
		
	/* 이메일 형식 확인 */
	$("#email").keyup(function(){
		
		emailCheck = true; //true : 중복 안됨
		
		$.ajax({
			
			url: "loginCheck.json",
			async: false, /* 중요 */
			
			success: function(result){

				$(result).each(function(key, value){
					
					if($("#email").val() == value.email) {
						emailCheck = false; //false : 중복
					} //if
				
				}); //each
				
			} //success
			
		}); //ajax	
		
		console.log("email keyup");
		console.log(emailCheck);
		
		if (!$(this).val()) {
			$(".emailSpan").html("&nbsp;");
		//} else if (!regEmail.test($(this).val())) {
		} else if (!regEmail.test($("#email").val())) {
			$(".emailSpan").html("영문자로 시작하고 5글자 이상 11글자!").css("color","red");
		} else if (emailCheck == true) { //true : 중복 안됨
			$(".emailSpan").html("사용 가능한 email 입니다.").css("color","yellowgreen");
		} else if (emailCheck == false) { //false : 중복
			$(".emailSpan").html("중복된 email 입니다.").css("color","red");
		} //if
		
	}); //email keyup	
	
	/* 이메일 중복 및 형식 emailCheckBtn 버튼으로 확인  */
 	//document.signupForm.emailCheckBtn.onclick = function(){
	//document.getElementById("emailCheckBtn").onclick = function(){
	$("#emailCheckBtn").click(function(){
		
		emailCheck = true; //true : 중복 안됨
		
		$.ajax({
			
			url: "loginCheck.json",
			async: false, /* 중요 */
			
			success: function(result){

				$(result).each(function(key, value){
					
					if($("#email").val() == value.email) {
						emailCheck = false; //false : 중복
					} //if
				
				}); //each
				
			} //success
			
		}); //ajax	

		if (!$("#email").val()) {
			alert("email을 입력하세요");
			$("#email").focus();
		//} else if (!regEmail.test($(this).val())) {
		} else if (!regEmail.test($("#email").val())) {
			alert("영문자로 시작하고 5글자 이상 11글자로 입력하세요!");
			$("#email").focus();
		} else if (emailCheck == true) { //true : 중복 안됨
			alert("사용 가능한 email입니다.");
			$("#pw").focus();
		} else if (emailCheck == false){ //false : 중복
			alert("중복된 email입니다.");
			$("#email").focus();
		} //if		
		
	}); //$("#emailCheckBtn").click(function(){ ★★★★ click 이벤트와 onclick이벤트의 차이점
	//}; //document.signupForm.emailCheckBtn.onclick = function(){
	
	
	/* 전화번호(tel1) 형식 확인 */
	$("#tel1").keyup(function(){
		
		if (!$(this).val()) {
			$(".telSpan").html("&nbsp;");
		//} else if (!regTel1.test($(this).val())) {
		} else if (!regTel1.test($("#tel1").val())) {
			$(".telSpan").html("국번은 010만 가능합니다!").css("color","red");
		} else {
			$(".telSpan").html("사용 가능한 숫자입니다.").css("color","yellowgreen");
		} //if
		
		if (regTel1.test($(this).val()) == true 
				&& $(this).val().length == 3) {
			tel2.focus();
		}
		
	}); //tel1 keyup
	
	/* 전화번호(tel2) 형식 확인 */
	$("#tel2").keyup(function(){
		
		if (!$(this).val()) {
			$(".telSpan").html("&nbsp;");
		//} else if (!regTel2.test($(this).val())) {
		} else if (!regTel2.test($("#tel2").val())) {
			$(".telSpan").html("가운데 숫자는 숫자로 4자만 가능!").css("color","red");
		} else {
			$(".telSpan").html("사용 가능한 숫자입니다.").css("color","yellowgreen");
		} //if
		
		if (regTel2.test($(this).val()) == true 
				&& $(this).val().length == 4) {
			tel3.focus();
		}
		
	}); //tel2 keyup

	/* 전화번호(tel3) 형식 확인 */
	$("#tel3").keyup(function(){
		
		if (!$(this).val()) {
			$(".telSpan").html("&nbsp;");
		//} else if (!regTel3.test($(this).val())) {
		} else if (!regTel3.test($("#tel3").val())) {
			$(".telSpan").html("마지막 숫자는 숫자로 4자만 가능!").css("color","red");
		} else {
			$(".telSpan").html("사용 가능한 숫자입니다.").css("color","yellowgreen");
		} //if
		
	}); //tel3 keyup
	
	$("#close").mouseover(function() {
    for(var i = 0; i < 10; i++) {
//      this.style.padding = i + "px";
      $(this).css("padding", i);
    }
	});

	$("#close").mouseout(function() {
//    this.style.padding = 0 + "px";
    $(this).css("padding",0);
	});
	
	$("#close").click(function() {
		
		var input = confirm("회원가입을 취소하시겠습니까?")
		
		if (input == true) {
			alert("회원 가입이 취소 되었습니다\n메인 페이지로 이동합니다.");
	    location.href = "index.html";
		} else {
			return false;
		}
		
	});
	
	
}); //ready