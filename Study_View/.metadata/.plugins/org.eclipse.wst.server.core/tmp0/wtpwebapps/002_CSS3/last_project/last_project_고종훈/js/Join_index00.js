
$(document).ready(function(){
	
	
	//input 박스 변수 할당
	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var pwchk = document.getElementById("pwchk");
	var name = document.getElementById("name");
	var tel = document.getElementById("tel");
	var email = document.getElementById("email");
	
	
	var idCheck;
  var emailCheck;

	
	
	//유효성 검사 변수 지정
	var getcheck = /^[a-zA-Z0-9]{4,12}$/;
	var namecheck = /^[가-힣]{2,5}$/;
	var telcheck = /^010\d{4}\d{4}$/;
	var email_check = /^[a-z]\w{4,11}@[a-z]{2,10}[\.]?[a-z]{0,2}$/;
	
	
	
	
	//이름 유효성검사, 경고메세지
	$("#name").click(function() {
		if(!name.value){
			$("#namecheckmsg").html("이름을 입력하세요.").css("color","red");
		}else if(!namecheck.test(name.value)){
			$("#namecheckmsg").html("이름을 정확히 입력하세요.").css("color","red");
		}else{
			$("#namecheckmsg").html("사용가능합니다.").css("color","blue");
			
			
		}//if
		
	});//name click
	
	
	
	$("#name").keyup(function() {
		if(!name.value){
			$("#namecheckmsg").html("이름을 입력하세요.").css("color","red");
		}else if(!namecheck.test(name.value)){
			$("#namecheckmsg").html("이름을 정확히 입력하세요.").css("color","red");
		}else{
			$("#namecheckmsg").html("사용가능합니다.").css("color","blue");
			
		}//if
		
	});//name keyup
	
	
	
	
	
	
	
	//아이디 유효성 검사, 경고메세지
	
	
	$("#id").click(function(){
		if(!id.value){
			$("#idcheckmsg").html("아이디를 입력하세요").css("color","red");
		}else if(!getcheck.test(id.value)){
			$("#idcheckmsg").html("유효한 아이디를 입력하세요").css("color","red");
		}else{
			$("#idcheckmsg").html("사용가능합니다.").css("color","blue");
		}//if
});//on

	$("#id").keyup(function(){
		if(!id.value){
			$("#idcheckmsg").html("아이디를 입력하세요").css("color","red");
		}else if(!getcheck.test(id.value)){
			$("#idcheckmsg").html("유효한 아이디를 입력하세요").css("color","red");
		}else{
			$("#idcheckmsg").html("사용가능합니다.").css("color","blue");
		}//if
	});
	
	//아이디 중복확인
	
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
					}
					
				});//each
				
			}//success
			
		});//ajax
		
		if(!$("#id").val()) {
			$("#idcheckmsg").html("");
		} else if (idCheck == true) {
			$("#idcheckmsg").html("사용 불가능한 아이디입니다.").css("color","red");
		} else {
			$("#idcheckmsg").html("사용 가능한 아이디입니다.").css("color","yellowgreen");
		}//if
		
	});//keyup
	

	





	
	
	
	

	
	//비밀번호 일치 불일치
	
	$("#pw").click(function() {
		$("#pwcheckmsg").html("일치하지 않음").css("color","red");
	});
	
	$("#pwchk").click(function() {
		$("#pwcheckmsg").html("");
	});
		
	$("#pw").keyup(function() {
		if($("#pw").val() != $("#pwchk").val()){
			$("#pwcheckmsg").html("일치하지 않음").css("color","red");
		}else {
			$("#pwcheckmsg").html("일치함").css("color","blue");		
	}
});
	
	
	$("#pwchk").keyup(function() {
		if($("#pw").val() != $("#pwchk").val()){
			$("#pwcheckmsg").html("일치하지 않음").css("color","red");
		}else {
			$("#pwcheckmsg").html("일치함").css("color","blue");		
	}
});
	
	
});
	
	
/*$("#email").click(function(){
	if(!email.value){
		$("#emailcheckmsg").html("이메일를 입력하세요").css("color","red");
	}else if(!email_check.test(email.value)){
		$("#emailcheckmsg").html("유효한 이메일를 입력하세요").css("color","red");
	}else{
		$("#emailcheckmsg").html("사용가능합니다.").css("color","blue");
	}//if
});//on

$("#email").keyup(function(){
	if(!email.value){
		$("#emailcheckmsg").html("이메일를 입력하세요").css("color","red");
	}else if(!email_check.test(email.value)){
		$("#emailcheckmsg").html("유효한 이메일를 입력하세요").css("color","red");
	}else{
		$("#emailcheckmsg").html("사용가능합니다.").css("color","blue");
	}//if
});
*/











	
	
	
// 이메일 중복확인
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
           }
           
        });//each
        
     }//success
     
  });//ajax
  
  if(!$("#email").val()) {
     $("#emailcheckmsg").html("");
  } else if (emailCheck == true) {
     $("#emailcheckmsg").html("사용 가능한 아이디 입니다.").css("color","blue");
  } else {
     $("#emailcheckmsg").html("사용 불가능한 아이디 입니다.").css("color","red");
  }//if
  
});//keyup



























	


$("#csbtn").click(function() {   // 해당아이디 값을 클릭하면
  
  var loginCancel = confirm("회원가입을 취소하시겠습니까?");
  // confirm 값을 받음 true & false
  if(loginCancel == true){
     alert("회원가입이 취소 되었습니다.\n메인화면으로 이동합니다.");
     location.href="index.html";
     return false; // 전송되면 안되니까
  }else {
     alert("회원가입이 계속됩니다.");
     $("#userName").focus();   
     return false; 
  }
  
  if(idCheck == true){
    alert(id.value + "님이 회원가입 되셨습니다!!!")
    
    location.href = "last_project_고종훈.html";
    return false;
 } else{
   alert("회원가입에 실패하셨습니다.")
    return false;
    
 }
  
});//resetBtn 

$("#loginBtn").click(function() {   // 해당아이디 값을 클릭하면
     
     var loginCancel = confirm("회원가입을 하시겠습니까?");
     // confirm 값을 받음 true & false
     if(loginCancel == true){
        alert("회원가입 되셨습니다!!!");
        location.href="last_project_고종훈.html";
        return false; // 전송되면 안되니까
     }else {
        alert("회원가입이 계속됩니다.");
        $("#userName").focus();   
        return false; 
     }
     
     
  });//submitBtn






















