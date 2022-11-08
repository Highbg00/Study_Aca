$(document).ready(function() {

    //input 박스 변수할당
        var userId = document.getElementById("userId");
        var userPw = document.getElementById("userPw");
        var userPwCheck = document.getElementById("userPwCheck");
        var userName = document.getElementById("userName");
        var userTel = document.getElementById("userTel");
        var userEmail = document.getElementById("userEmail");
        
        var idCheck;
        var emailCheck;
        var passwordCheck;
        
        //유효성 검사 변수 지정
        var regUserId = /^[a-z]\w{4,11}$/;
        var regUserPw = /^[a-z]\w{4,11}$/;
        var regUserPwCheck = /^[a-z]\w{4,11}$/;
        var regUserName = /^[가-힣]{2,5}$/;
        var regUserTel = /^010\d{4}\d{4}$/;
        var regUserEmail = /^[a-z]\w{4,11}@[a-z]{2,10}[\.][a-z][\.]?[a-z]{0,2}$/;
        
     
        
        
        
      $("#userName").click(function() {
          if(!userName.value){
             $("#namecheckmsg").html("이름을 입력하세요.").css("color","red");
          }else if(!regUserName.test(userName.value)){
             $("#namecheckmsg").html("이름을 정확히 입력하세요.").css("color","red");
          }else{
             $("#namecheckmsg").html("사용 가능합니다.").css("color","blue");
             
          }//if
          
       });//name click
      
      
      $("#userName").keyup(function() {
    	  if(!userName.value){
    		  $("#namecheckmsg").html("이름을 입력하세요.").css("color","red");
    	  }else if(!regUserName.test(userName.value)){
    		  $("#namecheckmsg").html("이름을 정확히 입력하세요.").css("color","red");
    	  }else{
    		  $("#namecheckmsg").html("사용 가능합니다.").css("color","blue");
    		  
    	  }//if
    		  
      });//name click
      
      
     // 아이디 중복확인
      $("#idck").click(function() {
  		
  		idCheck = false;
  		
  		$.ajax({
  			
  			url: "loginCheck.json",
  			dataType: "json",
  			async: false,
  			
  			success: function(result) {
  				$(result).each(function(key, value) {
  					
  					if ($("#userId").val() == value.id) {
  						idCheck = true;
  					}
  					
  				});//each
  				
  			}//success
  			
  		});//ajax
  		
  		if(!$("#userId").val()) {
  			$("#idmsg").html("");
  		} else if (idCheck == true) {
  			$("#idmsg").html("사용 가능한 아이디 입니다.").css("color","blue");
  		} else {
  			$("#idmsg").html("사용 불가능한 아이디 입니다.").css("color","red");
  		}//if
  		
  	});//keyup
      
   // 이메일 중복확인
      $("#emailck").click(function() {
  		
  		emailCheck = false;
  		
  		$.ajax({
  			
  			url: "loginCheck.json",
  			dataType: "json",
  			async: false,
  			
  			success: function(result) {
  				$(result).each(function(key, value) {
  					
  					if ($("#userEmail").val() == value.email) {
  						emailCheck = true;
  					}
  					
  				});//each
  				
  			}//success
  			
  		});//ajax
  		
  		if(!$("#userEmail").val()) {
  			$("#emailmsg").html("");
  		} else if (emailCheck == true) {
  			$("#emailmsg").html("사용 가능한 이메일 입니다.").css("color","blue");
  		} else {
  			$("#emailmsg").html("사용 불가능한 이메일 입니다.").css("color","red");
  		}//if
  		
  	});//keyup
      
      
      
      
     
      
      /*$("#userId").click(function() {
       if(!userId.value){
             $("#idmsg").html("아이디를 입력하세요.").css("color","red");
         }else if(!regUserId.test(userId.value)){
            $("#idmsg").html("아이디를 정확히 입력하세요.").css("color","red");
         }else{
            $("#idmsg").html("사용 가능합니다.").css("color","blue");
             
          }//if
          
       });//name click
      
      
      $("#userId").keyup(function() {
    	  if(!userId.value){
  		  $("#idmsg").html("아이디를 입력하세요.").css("color","red");
   	  }else if(!regUserId.test(userId.value)){
    		  $("#idmsg").html("아이디를 정확히 입력하세요.").css("color","red");
   	  }else{
    		  $("#idmsg").html("사용 가능합니다.").css("color","blue");
    		  
    	  }//if
    		  
      });//name click
*/     
	  
	 
      $("#userPw").click(function() {
          $("#pwcheckmsg").html("비밀번호가 일치하지 않습니다.").css("color","red");
       });
       
       $("#userPwCheck").click(function() {
          $("#pwcheckmsg").html("");
       });
          
       $("#userPw").keyup(function() {
          if($("#userPw").val() != $("#userPwCheck").val()){
             $("#pwcheckmsg").html("비밀번호가 일치하지 않습니다.").css("color","red");
          }else {
             $("#pwcheckmsg").html("비밀번호가 일치합니다.").css("color","blue");      
       }
    });
       
       
       $("#userPwCheck").keyup(function() {
          if($("#userPw").val() != $("#userPwCheck").val()){
             $("#pwcheckmsg").html("비밀번호가 일치하지 않습니다.").css("color","red");
          }else {
             $("#pwcheckmsg").html("비밀번호가 일치합니다.").css("color","blue");      
       }
    });
	  

    
/*       $("#userEmail").click(function() {
           if(!userEmail.value){
              $("#emailCheckmsg").html("이메일을 입력하세요.").css("color","blue");
           }else if(!regUserEmail.test(userEmail.value)){
              $("#emailCheckmsg").html("이메일을 정확히 입력하세요.").css("color","red");
           }else{
              $("#emailCheckmsg").html("사용 가능합니다.").css("color","blue");
              
           }//if
           
        });//name click
       
       
       $("#userEmail").keyup(function() {
     	  if(!userEmail.value){
     		  $("#emailCheckmsg").html("이메일을 입력하세요.").css("color","blue");
     	  }else if(!regUserEmail.test(userEmail.value)){
     		  $("#emailCheckmsg").html("이메일을 정확히 입력하세요.").css("color","red");
     	  }else{
     		  $("#emailCheckmsg").html("사용 가능합니다.").css("color","blue");
     		  
     	  }//if
     		  
       });//name click
*/       
       
$("#submitBtn").click(function() {	// 해당아이디 값을 클릭하면
      		
	if(!$("#userName").val()){
		alert("이름을 입력하세요.");
		$("#userName").focus();
		return false;
	}else if(!$("#userId").val()){
		alert("아이디를 입력하세요.");
		$("#userId").focus();
		return false;
	}else if(!$("#userPw").val()){
		alert("비밀번호를 입력하세요.");
		$("#userPw").focus();
		return false;
	}else if(!$("#userPwCheck").val()){
		alert("비밀번호를 확인하세요.");
		$("#userPwCheck").focus();
		return false;
	}else if(!$("#userEmail").val()){
		alert("이메일을 입력하세요.");
		$("#userEmail").focus();
		return false;
	}else if(!$("#tel").val()){
		alert("휴대폰 번호를 입력하세요.");
		$("#tel").focus();
		return false;
	}
      		/*var loginCancel = confirm("회원가입을 하시겠습니까?");
      		// confirm 값을 받음 true & false
      		if(loginCancel == true){
      			alert("회원가입 되셨습니다!!!");
      			location.href="index.html";
      			return false; // 전송되면 안되니까
      		}else {
      			alert("회원가입이 계속됩니다.");
      			$("#userName").focus();	
      			return false; 
      		}*/
      		
       id.Check = false;
       
       $.ajax({
    	   
			
			url: "loginCheck.json",
		
			dataTypes: "json",
			async : false, //동기식으로 처리, 쌍따옴표 사용 안함
			
			success: function(result) {
				
				$(result).each(function(key, value) {
					
					if ($("#userId").val() == (value.id) && $("#userPw").val() == (value.pw) && $("#userEmail").val() == (value.email)) {
						idCheck = true;
					} //if
					
				}); //each
				
			} //success
			
		}); //ajax
      
	

       if(idCheck == true){
    	   alert(id.value + "님이 회원가입에 성공하셨습니다!!!");
    	   
    	   location.href = "index.html";
    	   return false;
    	   
       } else {
    	   alert("회원가입에 실패하셨습니다.");
    	   return false;
       }
       
});//submitBtn
       
      
       
       $("#resetBtn").click(function() {	// 해당아이디 값을 클릭하면
   		
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
   		
   		/*if(idCheck == true){
     	   alert(id.value + "님이 회원가입 되셨습니다!!!")
     	   
     	   location.href = "index.html";
     	   return false;
        } else{
     	  alert("회원가입에 실패하셨습니다.")
      	  return false;
     	   
        }*/
     	 
   	});//resetBtn 

});	//ready

