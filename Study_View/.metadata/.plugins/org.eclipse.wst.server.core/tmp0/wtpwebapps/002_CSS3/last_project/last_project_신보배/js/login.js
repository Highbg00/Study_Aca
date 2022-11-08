//신보배 login.js
$(document).ready(function() {
	
	var id = document.getElementById("id")
	var pw = document.getElementById("pw")
	var idCheck;//아이디쳌 선언만할게용
	var idpwCheck;//아이디 패스워드 같은지 쳌
	
	$("#loginBtn").click(function() {
		
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
		
		//id랑 pw같다면 id체크값을 주고
		idCheck = false; //id체크값을 false로 우선줌
		
		$.ajax({ //아이디랑 비번있으면 통신하는거,, 반드시필요한건 url
			
			url: "loginCheck.json",//세미클론없음
			dataType: "json",
			async: false, //동기적(한꺼번에가져와서)으로 통신
			success: function(result) { //성공을해서 받아오면 result
				
				$(result).each(function(key, value) {
					//내가 입력한 id랑 서버의 id랑 같고, 내가입력한pw랑 서버의 pw가 같다면
					if ($('#id').val() == (value.id) && $('#pw').val() == (value.pw)) {
						idCheck = true; //오 같은게 잇네?				
					}//if
					
				}); //each
				
			}//success
	
		}); //ajax
	
		if(idCheck == true ){ //id 체크값이 트루라면
			alert($("#id").val() + "님 로그인하셨습니다.");
			
			location.href="index.html";
			return false; //전송no
			
		 }else{
			alert("존재하지않은 아이디거나 이메일입니다.");
			$("#id").val("");
			$("#pw").val("");
			$("#id").focus();
			return false;
		 }//if ajax 밑에다가 트루만 넣고 빠져나와
		
	}); //loginBtn click 	

	$("#resetBtn").click(function() {
		
		var loginCancel = confirm("로그인을 취소하시겠습니까?");
		
		if (loginCancel == true) {
			alert("로그인이 취소되었습니다. \n메인페이지로 이동합니다.");
			location.href = "index.html";
			return false;
		} else {
			alert("로그인이 계속됩니다.");
			//$("#loginBtn").focus();
			$("#id").focus();
			return false;
		}
		
	}); //resetBtn click
	
	$("#close").click(function() {
		
	var close = confirm("로그인을 취소하시겠습니까?");
		
		if (close == true) {
			alert("로그인이 취소되었습니다. \n메인페이지로 이동합니다.");
			location.href = "index.html";
			return false;
		} else {
			alert("로그인이 계속됩니다.");
			$("#id").focus();
			return false;
		}
		
	});//close click
	
	$("#id").focus(function() { //아이디에 포커스가 들어가면 펑션으로
		$("#id").attr("placeholder","");//플레이스홀더에 지워버림
	}); //focus 
	$("#id").blur(function() {
		$("#id").attr("placeholder","아이디를 입력하세요");
		$("#idSpan").html("");
	}); //focus 
	
	$("#pw").focus(function() { //비번에 포커스가 들어가면 펑션으로
		$("#pw").attr("placeholder","");//플레이스홀더에 지워버림
		
		if (!$("#id").val()) {
			$("#idSpan").html("아이디(이메일)를 먼저 입력하셔야 합니다.").css("color","red");
			alert("아이디(이메일)를 먼저 입력하셔야 합니다.");
			$("#id").focus();
		} else {
			$("#idSpan").html("");
		}//if
		
	}); //focus
	
	$("#pw").blur(function() { 
		$("#pw").attr("placeholder","비밀번호를 입력하세요");
	});
	
	$("#id").keyup(function() {
		
		idCheck = false;
		
		$.ajax({

			url: "loginCheck.json",
			type: "post",	  //전송할거
			dataType: "json", //받아올거
			async: false,
			
			success: function(result) {
				$(result).each(function(key, value) { //키하고 밸류하고 나뉨
					//내가 입력한id와 서버에 id가 같다면
					if ($("#id").val() == (value.id)){
						idCheck = true;
					}
					
				});//each
				
			}//success
			
		});//ajax
		if(!$("#id").val()){
			$("#idspan").html("");
		}else if (idCheck == true) {
			$("#idSpan").html("사용가능한 아이디입니다.").css("color","yellowgreen");
		}else {
			$("#idSpan").html("사용불가능한 아이디입니다.").css("color","red");
		}//if
		
	});	//keyup
	
	
	$("#pw").keyup(function() {
			
			idpwCheck = false;
			
			$.ajax({
	
				url: "loginCheck.json",
				type: "post",	  //전송할거
				dataType: "json", //받아올거
				async: false,
				
				success: function(result) {
					$(result).each(function(key, value) { //키하고 밸류하고 나뉨
						//내가 입력한id와 서버에 id가 같다면
						if ($("#id").val() == value.id && $ ("#pw").val() == value.pw){
							idpwCheck = true;
						}
						
					});//each
					
				}//success
				
			});//ajax
			if(!$("#pw").val()){
				$("#pwspan").html("");
			}else if (idpwCheck == true) {
				$("#pwSpan").html("사용가능한 비밀번호입니다.").css("color","yellowgreen");
			}else {
				$("#pwSpan").html("사용불가능한 비밀번호입니다.").css("color","red");
			}//if
			
		});	//keyup
	
	//눈모양
	
	$("#nun").click(function() {
		
		$("input").toggleClass("active"); //css에서는 active태그 없음
		
		if ($("input").hasClass("active")) {
		  $("#nun").attr("class","fa fa-eye-slash fa-lg").prev().attr("type","text");
		} else {
		  $("#nun").attr("class","fa fa-eye fa-lg").prev().attr("type","password");

		}
		
	}); //click
	
	
	$("#eye").on({
		"mouseenter": function() {
			$("#pw").attr("type","text");
			$("#eye").html("비번감추기");
		},
		"mouseleave": function() {
			$("#pw").attr("type","password");
			$("#eye").html("비번보이기");
			
		}
		
	});//on
	
	
}); //ready









































