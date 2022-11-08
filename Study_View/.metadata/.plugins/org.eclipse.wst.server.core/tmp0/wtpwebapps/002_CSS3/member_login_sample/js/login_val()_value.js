$(document).ready(function() {
	
//	id = $("#id").val(); 	//☜값을 변수로 설정,  
		//input box는 $("#id")로 사용
//	pw = $("#pw").val(); 	//☜값을 변수로 설정,
		//input box는 $("#pw")로 사용
	
	var id = document.getElementById("id").value; //☜값을 변수로 설정, 
							//input box는 document.getElementById("id")로 사용
	var pw = document.getElementById("pw").value; //☜값을 변수로 설정,  
							//input box는 document.getElementById("pw")로 사용

	
	var idCheck = false;
	var idpwCheck = false;
	
	$("#loginBtn").click(function() {	/*submit버튼으로는 click 이벤트*/
//	$("#loginForm").submit(function() { /*폼으로는 submit 이벤트*/
//	document.loginForm.onsubmit = function() { /*폼으로 onsubmit = function(){}*/		
		
		if (!id) {
			alert("아이디를 입력해주세요");
//			$("#id").focus();
			document.getElementById("id").focus();
			return false;
		}
		
		if (!pw) {
			alert("패스워드를 입력해주세요");
//			$("#pw").focus();
			document.getElementById("pw").focus();
			return false;
		}
		
		idCheck = false;
//		-------------------------------------------------------------------------- 
		$.ajax({
			
			url: "loginCheck.json",
			type: "post",
			dataType: "json",
			async : false, //동기식으로 처리, 쌍따옴표 사용 안함
			
			success: function(result) {
				
				$(result).each(function(key, value) {
					
					if (id == (value.id) && pw == (value.pw)) {
						idCheck = true;
					} //if
					
				}); //each
				
			} //success
			
		}); //ajax
//		--------------------------------------------------------------------------
		
		if (idCheck == true) {
			alert(id + "님 로그인하셨습니다");
			location.replace("index.html");
			return false;
		} else {
			alert("존재하지 않은 아이디이거나 패스워드를 잘못 입력하셨습니다.");
			document.getElementById("id").value="";
			document.getElementById("pw").value="";
			document.getElementById("pw").focus();
//			id=""; 	//XXX jQuery 문법상 오류
//			pw="";	//XXX jQuery 문법상 오류
//			$("#id").val("");
//			$("#pw").val("");
//			$("#id").focus();
			return false;
		};  //if
		
	}); //loginBtnclick, loginFormsumit
//	}; //document.loginForm.onsubmit
	
	$("#resetBtn").click(function() {	/*reset버튼으로는 click 이벤트*/
//	$("#loginForm").reset(function() { /*폼으로는 reset 이벤트*/
//	document.loginForm.onreset = function() { /*폼으로 onreset = function(){}*/
		
		var input = confirm("로그인을 취소하시겠습니까?");

		if (input == true) {
			alert("로그인이 취소 되었습니다\n메인페이지로 이동합니다.");
			location.replace("index.html");
			return false;
		} else {
			alert("로그인이 계속됩니다.");
			return false; //return false 유무시 비교
		}
		
	}); //resetBtnclick, loginFormreset
//	}; //document.loginForm.onsubmit
		
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
		
		var input = confirm("로그인을 취소하시겠습니까?");

		if (input == true) {
			alert("로그인이 취소 되었습니다\n메인페이지로 이동합니다.");
			location.replace("index.html");
			return false;
		} else {
			alert("로그인이 계속됩니다.");
			return false; //return false 유무시 비교
		}
		
	});
	
	$("#id").focus(function () {
		$("#id").attr("placeholder", "");
	}).blur(function() {
		$("#id").attr("placeholder", "아이디(이메일)를 입력하세요");
	});
	
	$("#pw").focus(function () {
		$("#pw").attr("placeholder", "");
		
		if(!$("#id").val()) {
			$("#idSpan").html("아이디(이메일)를 먼저 입력하셔야만 합니다.").css("color","red");
			$("#id").focus();
		} else {
			$("#idSpan").html("");
		}
	}).blur(function() {
		$("#pw").attr("placeholder", "비밀번호를 입력하세요");
		
	});
	
	$("#id").keyup(function(){
		
//		$("#loginBtn").css({
//			"background-color": "#2ecc71",
//			"transition": "0.4s",
//		});
		$("input[type='submit']").prop("disabled", false);
		$("input[type='reset']").prop("disabled", false);
		
//		id = $("#id").val(); 	//★★★★★★★
		id = document.getElementById("id").value;	//★★★★★★★
		idCheck = false;			//★★★★★★★
//	--------------------------------------------------------------------------
		$.ajax({
			
			url: "loginCheck.json",
			type: "post",
			dataType: "json",
			async : false, //동기식으로 처리, 쌍따옴표 사용 안함
			
			success: function(result) {
				
				$(result).each(function(key, value) {
					
					if (id == (value.id)) {
						idCheck = true;
					} //if
					
				}); //each
				
			} //success
			
		}); //ajax
//	--------------------------------------------------------------------------
		
		if (!id) {
			$("#idSpan").html("");
		} else if (idCheck == true) {
			$("#idSpan").html("사용 가능한 아이디입니다.").css("color","yellowgreen");
		} else {
			$("#idSpan").html("사용 불가능한 아이디입니다.").css("color","red");
		};  //if
		
		console.log("idCheck");
		console.log(idCheck);
		
	}); //id keyup
	
			
	$("#pw").keyup(function(){
//		--------------------------------------------------------------------------
//		id = $("#id").val();	//★★★★★★★
//		pw = $("#pw").val();	//★★★★★★★
		id = document.getElementById("id").value; //★★★★★★★
		pw = document.getElementById("pw").value; //★★★★★★★
		
		idpwCheck = false;		//★★★★★★★
		
		$.ajax({
			
			url: "loginCheck.json",
			type: "post",
			dataType: "json",
			async : false, //동기식으로 처리, 쌍따옴표 사용 안함
			
			success: function(result) {
				
				$(result).each(function(key, value) {
					
					if (id == (value.id) && pw == (value.pw)) {
						idpwCheck = true;
					} //if
					
				}); //each
				
			} //success
			
		}); //ajax
//		--------------------------------------------------------------------------
		
		if (!pw) {
			$("#pwSpan").html("");
		} else if (idpwCheck == true) {
			$("#pwSpan").html("사용 가능한 패스워드입니다.").css("color","yellowgreen");
		} else {
			$("#pwSpan").html("사용 불가능한 패스워드입니다.").css("color","red");
		};  //if
		
		console.log("idpwCheck");
		console.log(idpwCheck);
		
	}); //pw keyup
	
	
	$("#eye").on("click mousedown mouseover", function(){
    $("#pw").attr("type","text");
    $("#eye").html("비번감추기");
	}).on("mouseup mouseleave", function() {
    $("#pw").attr("type","password");
    $("#eye").html("비번보기");
	});

	
  $('i').on('click',function(){
    $('input').toggleClass('active');
    
    if($('input').hasClass('active')){
        $(this).attr('class',"fa fa-eye-slash fa-lg")
        .prev('input').attr('type',"text");
    } else {
        $(this).attr('class',"fa fa-eye fa-lg")
        .prev('input').attr('type','password');
    }
    
	});
	
}); //ready





