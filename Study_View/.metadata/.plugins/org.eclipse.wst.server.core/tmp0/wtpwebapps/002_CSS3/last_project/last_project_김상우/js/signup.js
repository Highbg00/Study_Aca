$(document).ready(function() {

	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var email = document.getElementById("email");
	var name = document.getElementById("name");
	
	/*var tel = $("#phone1").val() + $("#phone2").val() + $("#phone3").val() 
	var regtel = /^(010)\d{4}\b{4}$/;
	var tel2 = $("#phone2").val().length;
	var tel3 = $("#phone3").val().length;*/
	
	var idCheck;
	var idpwCheck;
	var emailCheck

	
	
	
	
	
	
	
	
	
	
	
	
	
	var regname = /^[가-힣]{2,15}$/; //이름 유효성검사 정규식
	

	
	
	/*
	if(name.value ==''){
        alert("이름을 입력해주세요.");
        return false;
    }
    if(!regname.test(name.value)){
        alert("특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.");
        return false;
    }
*/
/*
	if (!$("#name").val()) {
		alert("이름을 입력하세요");
		$("#name").focus();
		return false;*/
	
	
	
	
	
//**유효성 검사**********************************************************
	
	
	
	$("#loginBtn").click(function() {
		//이름값이 없으면 이름 입력
		if (name.value =='') {
			alert("이름을 입력하세요");
			return false;
		}else if (!regname.test(name.value)) {
			alert("특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.");
	        return false;
		}
		
		// 아이디값이 없으면 아이디 입력
		if (!$("#id").val()) {
			alert("아이디를 입력하세요");
			$("#id").focus();
			return false;
			
		}// if
		// 비밀번호 값이 없으면 비밀번호 다시 입력
		if (!$("#pw").val()) {
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return false;
		}// if
		
		//비밀번호 확인 값이 없으면 다시
		if (!$("#pwCheck").val()) {
			alert("비밀번호확인을 입력하세요");
			$("#pwCheck").focus();
			return false;
		}// if
		
		//이메일 값이 없으면 다시
		if (!$("#email").val()) {
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}// if
		
		//연락처값이 없으면 다시
		if (!$("#phone").val()) {
			alert("전화번호를 입력하세요");
			$("#phone").focus();
			return false;
		}// if
		
		
		idCheck = false;
		
		
		// 서버랑 통신 하는거 객체형식
		$.ajax({

			url : "loginCheck.json",
			dataTypes: "json",
			async: false,				//동기적으로 통신
			success : function(result) {
				
				$(result).each(function(key, value) {
					
					if ($("#id").val() == (value.id) && $("#pw").val() == (value.pw) && $("#email").val() == (value.email) ) {
						idCheck = true;
					}//if id 랑 pw 비교
					
				});//each
				
			}// success

		});// ajax

		if(idCheck == true ){
			alert(id.value + "님 회원가입 하셧습니다.");//회원가입되면 알림
			
			location.href = "index3.html";		//index로 넘어가게함
			return false;
			
		}else{
			alert("회원가입에 실패하셧습니다. 다시하세요.")
			$("#name").val("");
			$("#id").val("");
			$("#pw").val("");
			$("#pwCheck").val("");
			$("#email").val("");
			$("#phone").val("");
			$("#name").focus();
			return false;
			
			
		}//if
		
	

	});// loginBtn click
	

// 패스워드 체크 keyup-----------------------------------------------------
	$("#pw").click(function(){
		$("#pwCheckSpan2").html("");
	});//pw click
	
	$("#pw").keyup(function(){
		
		if ($("#pw").val() != $("#pwCheck").val()) {
			$("#pwCheckSpan2").html("일치하지 않음").css("color","red");			
		} else {
			$("#pwCheckSpan2").html("일치함").css("color","yellowgreen");	
		}	//if
	}); //pw keyup
	
	$("#pwCheck").keyup(function(){
		
		if ($("#pw").val() != $("#pwCheck").val()) {
			$("#pwCheckSpan2").html("일치하지 않음").css("color","red");			
		} else {
			$("#pwCheckSpan2").html("일치함").css("color","yellowgreen");	
		}	//if
	}); //pwCheck keyup
//	------------------------------------------------------------------------
	
	
	
//	회원가입창에서 취소 버튼
	$("#resetBtn").click(function() {

		var loginCancel = confirm("회원가입을 취소하시겠습니까?");
		
		if (loginCancel == true) {
			alert("회원가입이 취소되었습니다. \n 메인페이지로 이동합니다.");
			location.href = "index3.html";
			return false;
		}else{
			alert("회원가입이 계속됩니다.");
			$("#name").focus();
			return false;
		}//if
		
	});//resetBtn click
//	회원가입창에서 닫기 버튼
	$("#close").click(function() {
		
var close = confirm("회원가입을 취소하시겠습니까?");
		
		if (close == true) {
			alert("회원가입이 취소되었습니다. \n 메인페이지로 이동합니다.");
			location.href = "index3.html";
			return false;
		}else{
			alert("회원가입이 계속됩니다.");
			$("#name").focus();
			return false;
		}//if
		
		
		
	});//close click
	
	
	
	/*
	$("#id").focus(function() {
		$("#id").attr("placeholder","");
	});//focus
	
	$("#id").blur(function() {
		$("#id").attr("placeholder","아이디를 입력하세요.");
		$("#idSpan").html("");
	});//blur
	*/
	
/*	$("#pw").focus(function() {
		$("#pw").attr("placeholder","");
		
		if (!$("#id").val()) {
			$("#idspan").html("아이디를 먼저입력하셔야합니다.").css("color","red");
			alert("아이디를 먼저입력하셔야합니다.");
			$("#id").focus();
		} else {
			$("#idspan").html("");	
		}//if
		
	});//focus
	
	$("#pw").blur(function() {
		$("#pw").attr("placeholder","비밀번호를 입력하세요");
	});//blur
	*/
	
//	아이디 확인
	$("#idck").click(function() {
		
		idCheck = false;
		
		$.ajax({
			
			url: "loginCheck.json",
			dataType: "json",
			async: false,
			
			success: function(result) {
				$(result).each(function(key, value) {
					
					if ($("#id").val() == value.id) {
						idCheck = true;
					}//if
					
				});//each
			}//success
			
			
		});//ajax
		if (!$("#id").val()) {
			$("#idspan").html("");
			
		}else if (idCheck == true) {
			$("#idspan").html("사용가능한 아이디입니다.").css("color","yellowgreen");
			
		} else {
			$("#idspan").html("사용불가능한 아이디입니다.").css("color","red");
		}//if
		
	});//keyup
	
$("#pw").keyup(function() {
		
	idpwCheck = false;
	
		$.ajax({
			
			url: "loginCheck.json",
			dataType: "json",
			async: false,
			
			success: function(result) {
				$(result).each(function(key, value) {
					
					if ($("#pw").val() == value.pw ) {
						idpwCheck = true;
					}//if
					
				});//each
			}//success
			
			
		});//ajax
		if (!$("#pw").val()) {
			$("#pwSpan").html("");
			
		}else if (idpwCheck == true) {
			$("#pwSpan").html("사용가능한 비밀번호입니다.").css("color","yellowgreen");
			
		} else {
			$("#pwSpan").html("사용불가능한 비밀번호입니다.").css("color","red");
		}//if
		
	});//keyup
	
$("#emailck").click(function() {
	
	emailCheck = false;
	
	$.ajax({
		
		url: "loginCheck.json",
		dataType: "json",
		async: false,
		
		success: function(result) {
			$(result).each(function(key, value) {
				
				if ($("#email").val() == value.email) {
					emailCheck = true;
				}//if
				
			});//each
		}//success
		
		
	});//ajax
	if (!$("#emailck").val()) {
		$("#emailspan").html("");
		
	}else if (emailCheck == true) {
		$("#emailspan").html("사용가능한 이메일입니다.").css("color","yellowgreen");
		
	} else {
		$("#emailspan").html("사용불가능한 이메일입니다.").css("color","red");
	}//if
	
});//keyup
	




});// ready



































































