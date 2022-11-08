$(document).ready(function() {
	
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var idCheck;
	var idpwCheck;
	
	$("#loginBtn").click(function() {
		
		if (!$("#id").val()) {
			$("#idcheckmsg").html("아이디를 입력하세요").css("color","red");
			$("#id").focus();
			return false;
		}
		
		if (!$("#pw").val()) {
			$("#pwcheckmsg").html("비밀번호를 입력하세요").css("color","red");
			$("#pw").focus();
			return false;
		}
		
		
		idCheck = false;
		
		$.ajax({
			
			url: "loginCheck.json", 
			dataType: "json",
			async: false, //동기적으로 통신
			success: function(result) {
				
				$(result).each(function(key, value) {
					
					if ($("#id").val() == (value.id) && $("#pw").val() == (value.pw)) {
						idCheck = true;
					}//if
					
				});//each
				
			} //succes
			
		}); //ajax
		
		if(idCheck == true) {
			alert($("#id").val() + "님 로그인 하셨습니다.");
			
			location.href="last_project_고종훈.html";
			return false;
			
		} else {
			alert("존재하지 않은 아이디이거나 패스워드를 잘못 입력하셨습니다.")
			$("#id").val("");
			$("#pw").val("");
			$("#id").focus();
			return false;
		}//if
		
		
	}); //loginBtn click
	
	$("#csbtn").click(function() {
		
		var loginCancel = confirm("로그인을 취소하시겠습니까?");
		
		if (loginCancel == true) {
			alert("로그인이 취소 되었습니다. \n메인페이지로 이동합니다.");
			location.href = "last_project_고종훈.html";
			return false;
		} else {
			alert("로그인이 계속됩니다.");
			$("#id").focus();
			return false;
		}
		
	}); //resetBtn click
	
	$("#close").click(function() {
		
		var close = confirm("로그인을 취소하시겠습니까?");
		
		if (close == true) {
			alert("로그인이 취소 되었습니다. \n메인페이지로 이동합니다.");
			location.href = "last_project_고종훈.html";
			return false;
		} else {
			alert("로그인이 계속됩니다.");
			$("#id").focus();
			return false;
		}
		
	}); //close click
	
	
	
	
	
	
	/*$("#id").focus(function() {
		$("#id").attr("placeholder","아이디");
	});//focus
	$("#id").blur(function() {
		$("#idcheckmsg").html("placeholder","아이디(이메일)을 입력하세요");
		$("#idcheckmsg").html("");
	});//blur
*/	
	$("#pw").focus(function() {
		$("#pw").attr("placeholder","");
		
		if (!$("#id").val()) {
			$("#idcheckmsg").html("아이디(이메일)을 먼저 입력하셔야 합니다.").css("color","red");
			
			$("#id").focus();
		} else {
			$("#idcheckmsg").html("");	
		}//if
		
	});//focus
	
	$("#pw").focus(function() {
		$("#pw").attr("placeholder","");
		
		if (!$("#pw").val()) {
			$("#pwcheckmsg").html("비밀번호를 입력하셔야 합니다.").css("color","red");
			
			$("#pw").focus();
		} else {
			$("#pwcheckmsg").html("");
		}//if
		
	});//focus
	
	
	
	
	
/*	$("#pw").blur(function() {
		$("#pw").attr("placeholder","비밀번호를 입력하세요");
	});//blur
*/	
	
	
	
	

	$("#id").keyup(function() {
		
		idCheck = false;
		
		$.ajax({
			
			url: "loginCheck.json",
			dataType: "json",
			async: false,
			
			success: function(result) {
				$(result).each(function(key, value) {
					
					if ($("#id").val() == value.id) {
						idCheck = true;
					}
					
				});//each
				
			}//success
			
		});//ajax
		
		if(!$("#id").val()) {
			$("#idcheckmsg").html("");
		} else if (idCheck == true) {
			$("#idcheckmsg").html("사용 가능한 아이디입니다.").css("color","yellowgreen");
		} else {
			$("#idcheckmsg").html("사용 불가능한 아이디입니다.").css("color","red");
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
					
					if ($("#id").val() == value.id && $("#pw").val() == value.pw) {
						idpwCheck = true;
					}
					
				});//each
				
			}//success
			
		});//ajax
		
		if(!$("#pw").val()) {
			$("#pwcheckmsg").html("");
		} else if (idpwCheck == true) {
			$("#pwcheckmsg").html("사용 가능한 비밀번호입니다.").css("color","yellowgreen");
		} else {
			$("#pwcheckmsg").html("사용 불가능한 비밀번호입니다.").css("color","red");
		}//if
		
	});//keyup

	//눈모양
	
	$("#nun").click(function() {
		
		$("input").toggleClass("active");
		
		if ($("input").hasClass("active")) {
			$("#nun").attr("class","fa fa-eye-slash fa-lg").prev().attr("type","text");
		} else {
			$("#nun").attr("class","fa fa-eye fa-lg").prev().attr("type","password");
		}
		
	});//click
	
	$("#eye").on({
		"mouseenter" : function() {
			$("#pw").attr("type","text");
			$("#eye").html("비번감추기");
		},
		"mouseleave" : function() {
			$("#pw").attr("type","password");
			$("#eye").html("비번보이기");
		}
		
		
	});//on
	
	
}); //ready








