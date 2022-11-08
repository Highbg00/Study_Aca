$(document).ready(function() {
	var id_ok = 0;
	var pw_ok = 0;
	var cnt = 0;
	var userid = 0; 
	var reguserid = /^[a-z]\w{4,11}$/;
	
	$("#idcheck").click(function() {
		userid = document.getElementById("id"); //id
	$.ajax({
			
			url: "loginCheck.json",
			
			success: function(result) {
				$(result).each(function(key, value) {
					if ($("#id").val() == value.id) {
						alert("이미 존재합니다");
						cnt = 0;
						return false;
					}else{
						cnt++;
					}//if
				});//each
				
				//id 유효성 검사
				if (!userid.value){
					alert("아이디를 입력하세요");
					$("#id").focus();
				}else if(!reguserid.test(userid.value)){
					alert("아이디 형식이 맞지 않습니다. 잘못되었습니다.");
					$("#id").focus();
				}else if(cnt != 0){
					alert("사용할수 있는 아이디 입니다.");
					id_ok = 1;
				}//if
			}//success result
		});//ajax
		return false;
	});//click 
	
	$("#emailcheck").click(function() {
		useremail = document.getElementById("email"); //id
		var regEmail = /^[a-z]\w{4,11}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
		
	$.ajax({
			
			url: "loginCheck.json",
			
			success: function(result) {
				$(result).each(function(key, value) {
					if ($("#email").val() == value.email) {
						alert("이메일이 이미 존재합니다");
						cnt = 0;
						return false;
					}else{
						cnt++;
					}//if
				});//each
				
				//id 유효성 검사
				if (!useremail.value){
					alert("이메일을 입력하세요");
					$("#email").focus();
				}else if(!regEmail.test(useremail.value)){
					alert("이메일 형식이 맞지 않습니다.");
					$("#email").focus();
				}else if(cnt != 0){
					alert("사용할수 있는 이메일입니다.");
				}//if
			}//success result
		});//ajax
		return false;
	});//click 
	
	$("#pw").on({
		"keyup blur" : function() {
			if ($("#pw").val() != $("#pwcheck").val()) {
				$("#papwCheckSpan").html("일치하지 않음").css("color", "red");
				pw_ok = 0;
			} else {
				$("#papwCheckSpan").html("일치함").css("color", "white");
				pw_ok = 1;
			}//if
		}
	});//pw

	$("#pwcheck").on({
		"keyup blur" : function() {
			if ($("#pw").val() != $("#pwcheck").val()) {
				$("#papwCheckSpan").html("일치하지 않음").css("color", "red");
				pw_ok = 0;
			} else {
				$("#papwCheckSpan").html("일치함").css("color", "white");
				pw_ok = 1;
			}//if
		}
	});//pwcheck
	
	//유효성 검사
	var name_key = 0;
	var id_key = 0;
	var pw_key = 0;
	
	$("#name").keyup(function() {
		
		var username = document.getElementById("name"); //name
		var regusername = /^[가-힣]{2,5}$/;
		
		if (!username.value) {
			$("#name_span").html("이름을 입력하세요").css("color","red");
			$("#name").focus();
		} else if(!regusername.test(username.value)){
			$("#name_span").html("이름의 입력이 잘못되었습니다.").css("color","red");
			$("#name").focus();
		}else{
			$("#name_span").html("&nbsp;").css("color", "white");
			name_key = 1;
		}//id if
		
	});//name_span
	
	$("#id").keyup(function() {
		
	userid = document.getElementById("id"); //id
		
		var reguserid = /^[a-z]\w{4,11}$/;
		
		if (!userid.value) {
			$("#id_span").html("아이디를 입력하세요").css("color","red");
			$("#id").focus();
		} else if(!reguserid.test(userid.value)){
			$("#id_span").html("아이디의 입력이 잘못되었습니다.").css("color","red");
			$("#id").focus();
		}else{
			$("#id_span").html("&nbsp;").css("color", "white");
			id_key = 1;
		}//id if
		
	});//id_span
	
	$("#pw").keyup(function() {
		
		var userpw = document.getElementById("pw");	//pw
		var reguserpw = /^[a-z]\w{4,11}$/;
			
			if (!userpw.value ) {
				$("#pw_span").html("비밀번호를 입력하세요").css("color","red");
				$("#pw").focus();
			} else if(!reguserpw.test(userpw.value)){
				$("#pw_span").html("비밀번호의 입력이 잘못되었습니다.").css("color","red");
				$("#pw").focus();
			}else{
				$("#pw_span").html("&nbsp;").css("color", "white");
				pw_key = 1;
			}//pw if
		});//pw_span
	
		$("#email").keyup(function() {
			
			var useremail = document.getElementById("email");	//email
			var regEmail = /^[a-z]\w{4,11}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
				
				if (!useremail.value ) {
					$("#emailSpan").html("이메일을 입력하세요").css("color","red");
					$("#email").focus();
				} else if(!regEmail.test(useremail.value)){
					$("#emailSpan").html("이메일의 입력이 잘못되었습니다.").css("color","red");
					$("#email").focus();
				}else{
					$("#emailSpan").html("&nbsp;").css("color", "white");
				}//email if
		});//email_span
			
			
		$(".tel").keyup(function() {
				
				var useretel = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();	//tel
				var reguserTel = /^(010)\d{4}\d{4}$/;
				var usertellen1 = $("#tel1").val().length;
				var usertellen2 = $("#tel2").val().length;
				
					if (!useretel) {
						$("#telSpan").html("전화번호를 입력하세요").css("color","red");
					} else if(!reguserTel.test(useretel)){
						$("#telSpan").html("전화번호의 입력이 잘못되었습니다.").css("color","red");
					}else{
						$("#telSpan").html("&nbsp;").css("color", "white");
					}//tel if
					
				if(usertellen1 == 3){
					$("#tel2").focus();
				}
					
				if(usertellen2 == 4){
					$("#tel3").focus();
				}
		});
			
	document.getElementById("signup_form").onsubmit = function() {
				
		if(id_ok != 1){
			alert("ID중복 확인을 받지 않았습니다");
			return false;
		}else if(pw_ok != 1){
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}//id_ok pw_ok if
		
		if(name_key == 1 && id_key == 1 && pw_key == 1){
			if(id_ok == 1 && pw_ok == 1){
					alert("회원가입을 축하드립니다");
				location.href = "index.html";
				return false;
			}//if
		}else{
			alert("입력을 다시해주세요");
			return false;
		}//if
	};//#sign_up onsubmit
	
	$("close").click(function() {
		location.href = "index.html";
	})//click
	
	//placholder
	$("#name").focus(function() {
		$("#name").attr("placeholder","");
	})//name focus
	
	$("#name").focusout(function() {
		$("#name").attr("placeholder","이름을 입력하세요");
	})//name focusout
	
	$("#id").focus(function() {
		$("#id").attr("placeholder","");
	})//id focus
	
	$("#id").focusout(function() {
		$("#id").attr("placeholder","ID를 입력하세요");
	})//id focusout
	
	$("#pw").focus(function() {
		$("#pw").attr("placeholder","");
	})//pw focus
	
	$("#pw").focusout(function() {
		$("#pw").attr("placeholder","비밀번호를 입력하세요");
	})//pw focusout
	
	$("#pwcheck").focus(function() {
		$("#pwcheck").attr("placeholder","");
	})//pwcheck focus
	
	$("#pwcheck").focusout(function() {
		$("#pwcheck").attr("placeholder","비밀번호를 다시 입력하세요");
	})//pwcheck focusout
	
	$("#email").focus(function() {
		$("#email").attr("placeholder","");
	})//pwcheck focus
	
	$("#email").focusout(function() {
		$("#email").attr("placeholder","이메일을 입력하세요");
	})//pwcheck focusout
	
}); //ready