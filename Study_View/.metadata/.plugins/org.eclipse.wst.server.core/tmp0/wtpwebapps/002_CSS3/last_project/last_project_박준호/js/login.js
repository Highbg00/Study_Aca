$(document).ready(function() {
	
	document.getElementById("login_form").onsubmit = function() {
		var cnt = 0;
		var id_key = 0;
		var pw_key = 0;
		
		var userid = document.getElementById("id"); //id
		var userpw = document.getElementById("pw");	//pw
		
		//유효성 검사
		var reguserid = /^[a-z]\w{4,11}$/;
		var reguserpw = /^[a-z]\w{4,11}$/;
		
		if (!userid.value) {
			alert("아이디를 입력하세요");
			userid.focus();
		} else if(!reguserid.test(userid.value)){
			alert("아이디가 존재하지 않거나 입력이 잘못되었습니다.");
			userid.focus();
		}else{
			id_key = 1;
		}//id if
		
		if (!userpw.value) {
			alert("비밀번호를 입력하세요");
			userpw.focus();
		} else if(!reguserpw.test(userpw.value)){
			alert("비밀번호를 틀리셨거나 입력이 잘못되었습니다.");
			userpw.focus();
		}else{
			pw_key = 1;
		}//id if
		
		 if(id_key == 1&& pw_key == 1){
			$.ajax({
				url: "loginCheck.json",
				type: "post",
				
				success: function(result) {
					
					$(result).each(function(key, value) {
						if ($("#id").val() == value.id && $("#pw").val() == value.pw) {
							alert("로그인 되었습니다.");
							cnt = 0;
							return false;
						}else{
							cnt++;
						}//if
					});//each
					if(cnt != 0){
						alert("아이디가 존재하지 않거나 비밀번호가 틀립니다.");
					}else{
						location.href = "index.html";
					}//if
				}//success result
			});//ajax
		}//if ajax
		
		return false;
	}//login submit
	
	$("#pwcheck").mousedown(function() {
		$("#pw").attr("type", "text");
	})//mousedown
	$("#pwcheck").mouseup(function() {
		$("#pw").attr("type", "password");
	})//mousedown
	
	$("#close").click(function() {
		location.href = "index.html";
	})//click
	
	$("#id").focus(function() {
		$("#id").css({
				"padding" : "1px",
				"border-color" : "red"}).attr("placeholder","");
	})//id focus
	
	$("#id").focusout(function() {
		$("#id").css({
				"padding" : "0px",
				"border₩-color" : "#FFFCAA"}).attr("placeholder","아이디(이메일)를 입력하세요");
	})//id focusout
	
	$("#pw").focus(function() {
		$("#pw").html("").css({
			"padding" : "1px",
			"border-color" : "red"}).attr("placeholder","");
	})//pw pwfocus
	
	$("#pw").focusout(function() {
		$("#pw").css({
			"padding" : "0px",
			"border-color" : "white"}).attr("placeholder","비밀번호를 입력하세요");
	})//pw focusout
	});//ready