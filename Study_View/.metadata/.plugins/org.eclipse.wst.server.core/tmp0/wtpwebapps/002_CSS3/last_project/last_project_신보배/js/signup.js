//신보배 회원가입
$(document).ready(function() {

	//input 박스 변수할당	
	var name = document.getElementById("name")
	var id = document.getElementById("id")
	var pw = document.getElementById("pw")
	var pwCheck = document.getElementById("pwCheck")
	var tel = document.getElementById("tel")
	var email = document.getElementById("email")
		
	
	//유효성 검사 변수 지정
	var regName = /^[가-힣]{2,5}$/;	
	var regId = /^[a-z]\w{4,11}$/;
	var regPw = /^[a-z]\w{4,11}$/;
	var regPwCheck = /^[a-z]\w{4,11}$/;
	var regTel = /^010\d{4}\d{4}$/;
	var regEmail = /^[a-z]\w{4,11}@[a-z]{2,10}[\.][a-z][\.]?[a-z]{0,2}$/;

	var idCheck;
	var emailCheck;
	
	$("#joinBtn").click(function() {
		
		//공백확인
		if (!$("#name").val()) { //이름이 없다면
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;  //전송안시킴
		}
		if (!$("#id").val()) { //아이디가 없다면
			alert("아이디를 입력하세요");
			$("#id").focus();
			return false;  //전송안시킴
		}
		if (!$("#pw").val()) { //비밀번호가 없다면
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return false;  //전송안시킴
		}
		
		if (!$("#pwCheck").val()) { //비밀번호가 없다면
			alert("비밀번호를 확인하세요");
			$("#pwCheck").focus();
			return false;  //전송안시킴
		}
		
		if (!$("#tel").val()) { //전화번호 없다면
			alert("전화번호를 입력하세요");
			$("#tel").focus();
			return false;  //전송안시킴
		}
		if (!$("#email").val()) { //이메일이 없다면
			alert("비밀번호를 입력하세요");
			$("#email").focus();
			return false;  //전송안시킴
		}
		
        var loginCancel = confirm("회원가입을 하시겠습니까?");
        if(loginCancel == true){
          alert("회원가입 되셨습니다!!!");
          location.href="index.html";
       }else {
          alert("회원가입이 계속됩니다.");
          $("#name").focus();   
          return false; 
       }
        
	});//joinBtn	
	

	//이름 유효성 검사
	$("#name").keyup(function() {
		if (!regName.test(name.value)){
			$("#nameCheckSpan").html("이름을 정확히 입력하세요").css("color","red");
		} else{
			$("#nameCheckSpan").html("");
		}//if
	});
	
	//아이디 유효성 검사
	
	$("#id").keyup(function() {
		if (!regId.test(id.value)){
			$("#idCheckSpan").html("사용 불가능한 아이디입니다").css("color","red");
		} else{
			$("#idCheckSpan").html("");
		}//if
	});	

	//비밀번호 유효성 검사
		
	$("#pw").keyup(function() {
		if (!regPw.test(pw.value)){
			$("#pwSpan").html("사용 불가능한 비밀번호입니다").css("color","red");
		} else{
			$("#pwSpan").html("");
		}//if
	});
	
	
	//전화번호 유효성 검사
	
	$(".tel").keyup(function() {
		if (!regTel.test(tel.value)){
			$("#telCheckSpan").html("정확한 번호를 입력해주세요").css("color","red");
		} else{
			$("#telCheckSpan").html("");
		}//if
	});
	
	
	//이메일 유효성 검사
	
	$("#email").keyup(function() {
		if (!regEmail.test(email.value)){
			$("#emailSpan").html("사용 불가능한 이메일입니다").css("color","red");
		} else{
			$("#emailSpan").html("");
		}//if
	});
	
	//pw 재입력 체크
	$("#pw").on({
		"keyup blur" : function() {
			if ($("#pw").val() != $("#pwCheck").val()) {
				$("#pwCheckSpan").html("일치하지않음").css("color","red");
			} else {
				$("#pwCheckSpan").html("일치함").css("color","green");
			} //if
		}, //keyup blur
		"click" : function() {
			$("#pwCheckSpan").html("");
		} //click
	}); //pw on
	
	$("#pwCheck").on({
		"keyup blur" : function() {
			if ($("#pw").val() != $("#pwCheck").val()) {
				$("#pwCheckSpan").html("일치하지않음").css("color","red");
			} else {
				$("#pwCheckSpan").html("일치함").css("color","green");
			} //if
		}, //keyup blur
		"click" : function() {
			$("#pwCheckSpan").html("");
		} //click
	}); //pw on
	
	
	//눈모양1
	$("#nun1").click(function() {
		
		$("input").toggleClass("active"); 
		
		if ($("input").hasClass("active")) {
		  $("#nun1").attr("class","fa fa-eye-slash fa-lg").prev().attr("type","text");
		} else {
		  $("#nun1").attr("class","fa fa-eye fa-lg").prev().attr("type","password");
		}
	}); //click

	
	//눈모양2
	$("#nun2").click(function() {
		
		$("input").toggleClass("active"); 
		
		if ($("input").hasClass("active")) {
		  $("#nun2").attr("class","fa fa-eye-slash fa-lg").prev().attr("type","text");
		} else {
		  $("#nun2").attr("class","fa fa-eye fa-lg").prev().attr("type","password");
		}
	}); //click
	


	//회원가입 취소 버튼 클릭
	$("#joinResetBtn").click(function() {
		
		var loginCancel = confirm("회원가입을 취소하시겠습니까?");
		
		if (loginCancel == true) {
			alert("회원가입이 취소되었습니다. \n로그인페이지로 이동합니다.");
			location.href = "login.html";
			return false;
		} else {
			alert("회원가입이 계속됩니다.");
			//$("#joinBtn").focus();
			$("#name").focus();
			return false;
		}
	}); //joinResetBtn click

	
	
	//close클릭
	$("#close").click(function() {
		
		var close = confirm("회원가입을 취소하시겠습니까?");
			
			if (close == true) {
				alert("회원가입이 취소되었습니다. \n메인페이지로 이동합니다.");
				location.href = "index.html";
				return false;
			} else {
				alert("회원가입이 계속됩니다.");
				$("#id").focus();
				return false;
			}
	});//close click
	
	//아이디 중복검사
	$("#idchk").click(function() {
	
		idCheck = false; //id체크값을 false로 우선줌
		
		$.ajax({ 
			
			url: "loginCheck.json",//세미클론없음
			dataType: "json",
			async: false, //동기적(한꺼번에가져와서)으로 통신
			success: function(result) { //성공을해서 받아오면 result
				
				$(result).each(function(key, value) {
					//내가 입력한 id랑 서버의 id랑 같다
					if ($('#id').val() == (value.id)) {
						idCheck = true; //오 같은게 잇네?				
					}//if
					
				}); //each
				
			}//success
	
		}); //ajax
		
		if(idCheck == true ){ //id 체크값이 트루라면
			alert("사용중인 아이디입니다.");
		 }else{
			alert("사용이 가능합니다.");

		 }//if ajax 밑에다가 트루만 넣고 빠져나와
		
		
	});
	
	//이메일 중복검사
	$("#emailCheck").click(function() {
		
		emailCheck = false; //체크값을 false로 우선줌
		
		$.ajax({ 
			
			url: "loginCheck.json",//세미클론없음
			dataType: "json",
			async: false, //동기적(한꺼번에가져와서)으로 통신
			success: function(result) { //성공을해서 받아오면 result
				
				$(result).each(function(key, value) {
					if ($('#email').val() == (value.email)) {
						emailCheck = true; 				
					}//if
					
				}); //each
				
			}//success
	
		}); //ajax
		
		if(emailCheck == true ){ //체크값이 트루라면
			alert("사용중인 이메일입니다.");
		 }else{
			alert("사용이 가능합니다.");

		 }//if ajax 밑에다가 트루만 넣고 빠져나와
		
	});

}); //ready
