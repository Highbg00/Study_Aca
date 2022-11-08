$(document).ready(function() {

	var id = document.getElementById("id"); // 아이디 값을 가져와서 id 에 저장
	var pw = document.getElementById("pw"); // 비번 값을 가져와서 pw 에저장
	var idCheck; // id 체크값
	var idpwCheck; // id pw 를 체크한 값을 저장
	
	$("#loginBtn").click(function() {

		if (!$("#id").val()) { // id의 값이 없다면
			alert("아이디를 입력하세요");
			$("#id").focus(); // 아이디에 커서가뜸
			return false; // 전송을 시키면 안됨
		}//if

		if (!$("#pw").val()) { // pw의 값이 없다면
			alert("비밀번호를 입력하세요");
			$("#pw").focus(); // 비밀번호에 커서가뜸
			return false; // 전송을 시키면 안됨
		}//if

		idCheck=false;  // 일단 무조건 false 넣어두고 ajax if 문을 통과하면 true

		
	// 위 if문에 안걸리면 ajax 를 사용함
		$.ajax({ // 객체 형태로 들어감
		url : "loginCheck.json",
		dataType : "json", // loginCheck.json 파일을 result로 받아옴
		async : false, // ←동기적으로 통신 (한번에) (비동기는 하나씩)
		success : function(result) { // url 에 접속이 성공하면 실행
			$(result).each(function(key, value) {// result 를 하나하나씩
				if ($("#id").val() == (value.id) && $("#pw").val() == (value.pw)) {
					// 내가 입력한 아이디 val 은 값을 가져오는? 그런거같음
					// value.pw 은 서버에 있는 비밀번호 또는 아이디
				
					idCheck=true; // false 에서 통과했기 때문에 true
				}//if	
				
				}); // each
			
			} // succes
	
		}); // ajax
	
	
		
		if(idCheck == true){
			alert($("#id").val() + "님 로그인 하셨습니다.");
		
		
			location.replace("index.html");  // "" 안에 주소로 이동
			return false;
	
		} else{
			alert("존재하지 않는 아이디이거나 패스워드를 잘못 입력하셨습니다.")
			$("#id").val("");
			$("#pw").val("");
			$("#id").focus();
			return false;
		}// if
	
	}); // loginBtn click

	$("#resetBtn").click(function() {// 해당아이디 값을 클릭하면
		
		var loginCancel = confirm("로그인을 취소하시겠습니까?");
		// confirm 값을 받음 true & false
		if(loginCancel == true){
			alert("로그인이 취소 되었습니다.\n메인화면으로 이동합니다.");
			location.href="index.html";
			return false; // 전송되면 안되니까
		}else {
			alert("로그인이 계속됩니다.");
			$("#id").focus();	
			return false; 
		}//if
	});//resetBtn
	
	$("#close").click(function() {
		var close = confirm("로그인을 취소하시겠습니까?");
		// confirm 값을 받음 true & false
		if(close == true){
			alert("로그인이 취소 되었습니다. \n메인페이지로 이동합니다.");
			location.href="index.html";
			return false; // 전송되면 안되니까
		}else {
			alert("로그인이 계속됩니다.");
			$("#id").focus();	
			return false; 
		}//if
	});//close
	
	$("#id").focus(function() {
		$("#id").attr("placeholder","");
	});//focus
	$("#id").blur(function() {
		$("#id").attr("placeholder","아이디(이메일)을 입력하세요");
		$("#idspan").html("");
	});//blur
	
	$("#pw").focus(function() {
		$("#pw").attr("placeholder","");
		
		if (!$("#id").val()) {
			$("#idspan").html("아이디(이메일)을 먼저 입력하셔야 합니다.").css("color","red");
			alert("아이디(이메일)을 먼저 입력하셔야 합니다.");
			$("#id").focus();
		} else {
			$("#idspan").html("");	
		}//if
		
	});//focus
	
	$("#pw").blur(function() { // pw에 커서가없을때 발동 blur 
		$("#pw").attr("placeholder","비밀번호를 입력하세요"); // attr 은 속성값을 가져와서 수정
	});// blur
	
	$("#id").keyup(function() {
		
		idCheck = false;
		
		$.ajax({
			
			url: "loginCheck.json",
		
			dataType: "json",
			async : false, //동기식으로 처리, 쌍따옴표 사용 안함
			
			success: function(result) {
				idCheck = false; //중요
				
				$(result).each(function(key, value) {
					
					if ($("#id").val() == (value.id)) {
						idCheck = true;
					} //if
					
				}); //each
				
			} //success
			
		}); //ajax
		
		if(!$("#id").val()) {
			$("#idspan").html("");
		} else if (idCheck == true) {
			$("#idspan").html("사용 가능한 아이디입니다.").css("color","blue");
		} else {
			$("#idspan").html("사용 불가능한 아이디입니다.").css("color","red");
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
					}//if
					
				});//each
				
			}//success
			
		});//ajax
		
		if(!$("#pw").val()) {
			$("#pwspan").html("");
		} else if (idpwCheck == true) {
			$("#pwspan").html("사용 가능한 비밀번호입니다.").css("color","blue");
		} else {
			$("#pwspan").html("사용 불가능한 비밀번호입니다.").css("color","red");
		}//if
		
	});//keyup
	
	// 눈모양
	$("#nun").click(function() {
		
		$("input").toggleClass("active");
		
		if ($("input").hasClass("active")) {
			$("#nun").attr("class","fa fa-eye-slash fa-lg").prev().attr("type","text");
		}else{
			$("#nun").attr("class","fa fa-eye fa-lg").prev().attr("type","password");
		}//if
		
	}); // click
	
	$("#eye").on({
		"mouseenter" : function() {
			$("#pw").attr("type","text");
			$("#eye").html("비번감추기");
			
		},
		"mouseleave" : function(){
			$("#pw").attr("type","password");
			$("#eye").html("비번보이기");
			
		}//mouseleave
		
	});//eye
	
}); // ready
	


























