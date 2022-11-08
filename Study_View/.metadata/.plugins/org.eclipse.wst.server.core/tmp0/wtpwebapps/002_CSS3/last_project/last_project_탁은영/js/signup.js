
$(document).ready(function() {
    

    //input 변수
    var name = document.getElementById("name");
    var id = document.getElementById("id");
    var pw = document.getElementById("pw");
    var email = document.getElementById("email");
    var phone1 = document.getElementById("phone1");
    var phone2 = document.getElementById("phone2");
    var phone3 = document.getElementById("phone3");

    //유효성검사 변수
    var checkid = /^[a-z0-9]\w{4,11}$/;
    var checkpw = /^[a-z0-9A-Z]\w{4,11}$/;
    var checkname = /^[가-힣]{2,5}$/;
    var checkemail = /^[a-z]\w{4,11}@[a-z]{2,10}[\.][a-z][\.]?[a-z]{0,2}$/;
    var checkphone=/^(010|011|016|017|018|019)$/;
    var checkphone2=/^[0-9]{4}$/;
    var checkphone3=/^[0-9]{4}$/;

    //회원가입 버튼 클릭
    $("#signupbtn").click(function(){
        
        //이름 유효성 검사
        if(!name.value){                                    //이름 입력이 없을때
            alert("이름을 입력하세요");
            name.focus();
            return false;
        } else if(!checkname.test(name.value)){            //유효성검사 실패
            alert("이름은 한글 2~5글자 이내로 입력하세요");
            name.value="";
            name.focus();
            return false;
        }
        //아이디 유효성 검사
        if(!id.value){
            alert("아이디를 입력하세요");
            id.focus();
            return false;
        }else if(!checkid.test(id.value)){
            alert("아이디는 영어 소문자, 숫자 4~11글자 이내로 입력하세요");
            id.value="";
            id.focus();
            return false;
        }
        //비밀번호 유효성 검사
        if(!pw.value){
            alert("비밀번호를 입력하세요");
            pw.focus();
            return false;
        }else if(!checkpw.test(pw.value)){
            alert("비밀번호는 영어 대·소문자,숫자 4~11글자 이내로 입력하세요");
            pw.value="";
            pw.focus();
            return false;
        }
        //비밀번호 확인 유효성 검사
        if(!pw2.value){
            alert("비밀번호를 입력하세요");
            pw2.focus();
            return false;
        }else if(!checkpw.test(pw2.value)){
            alert("비밀번호는 영어 대·소문자,숫자 4~11글자 이내로 입력하세요");
            pw2.value="";
            pw2.focus();
            return false;
        }
        //이메일 유효성 검사
        if(!email.value){
            alert("이메일을 입력하세요");
            email.focus();
            return false;
        }else if(!checkemail.test(email.value)){
            alert("이메일 형식이 맞지 않습니다.");
            email.value="";
            email.focus();
            return false;
        }
        //전화번호 유효성 검사
        if(!phone1.value){
            alert("전화번호를 입력하세요");
            phone1.focus();
            return false;
        }else if(!checkphone.test(phone1.value)){
            alert("전화번호 형식이 맞지 않습니다.");
            phone1.value="";
            phone1.focus();
            return false;
        }
        if(!phone2.value){
            alert("전화번호를 입력하세요");
            phone2.focus();
            return false;
        }else if(!checkphone2.test(phone2.value)){
            alert("전화번호 형식이 맞지 않습니다.");
            phone2.value="";
            phone2.focus();
            return false;
        }
        
        if(!phone3.value){
            alert("전화번호를 입력하세요");
            phone3.focus();
            return false;
        }else if(!checkphone3.test(phone3.value)){
            alert("전화번호 형식이 맞지 않습니다.");
            phone3.value="";
            phone3.focus();
            return false;
        }

        // ajax 통신 중복 확인
        var allid = false;
        var allemail = false;
		$.ajax({
			
			url:'loginCheck.json',
			dataType:"json",
			async:false, //동기적으로 통신
			success: function(result){
				
                //아이디와 이메일 중복 확인
				$(result).each(function(key,value){
					if($("#id").val() == (value.id) ){	
						allid = true;
                    }	
                    if($("#email").val()==(value.email)){
                        allemail = true;
                    }
				}); //each

				
			}//success
			
		}); //ajax

		
        if($("#pw").val()!=$('#pw2').val()){
            alert("비밀번호가 불일치합니다. 수정해주세요");
            $('#pw2').val("");
            $('#pw2').focus();
            return false;
        }else if(allid == true){
            alert("중복된 아이디입니다. 수정해주세요");
            $("#id").val("");
            return false;
        } else if(allemail==true){
            alert("중복된 이메일입니다. 수정해주세요");
            $("#email").val("");
            return false;
        } else{
            alert($("#id").val()+"님 회원가입이 완료되었습니다. 메인화면으로 이동합니다. ");
            location.href="index.html";
            return false;
        }

       
     }); //signup click

     $("#id").focus(function() {
		$("#id").attr("placeholder","");
	});//focus


     //아이디 중복확인버튼 클릭
     $("#idcheck").click(function() {
    	 
    	 //아이디 입력이 없을 때
        if(!$("#id").val()){
        	
            alert("아이디를 먼저 입력하세요");
            $("#id").focus();
            
        }else{

            var idC = false;
            $.ajax({
                
                url:'loginCheck.json',
                dataType:"json",
                async:false, //동기적으로 통신
                success: function(result){
                    $(result).each(function(key,value){
                        if($("#id").val() == value.id){	
                            idC=true;
                        }	
                    }); //each

                }//success
                
            }); //ajax
            
            if(idC==true){
                $("#idanswer").html("사용불가능한 아이디입니다.").css("color","red");
            }else{
                $("#idanswer").html("사용가능한 아이디입니다.").css("color","green");
            }
        }  
     }); //idcheck click

     //비밀번호 일치여부 확인
	$("#pw2").keyup(function(){
		
		if($("#pw").val()==$('#pw2').val()){
			$("#pwanswer").html("비밀번호가 일치합니다.").css("color","green");
		}
		else{
			$("#pwanswer").html("비밀번호가 일치하지 않습니다").css("color","red");
		}
	}); //pw2

    //이메일 중복확인버튼 클릭
    $("#emailcheck").click(function() {
    	
    	//이메일 입력이 없을 때
        if(!$("#email").val()){
            alert("이메일을 먼저 입력하세요");
            $("#email").focus();
            
        }else{
            var emailC = false;
            
            $.ajax({
                
                url:'loginCheck.json',
                dataType:"json",
                async:false, //동기적으로 통신
                success: function(result){
                    $(result).each(function(key,value){
                        if($("#email").val() == value.email){	
                            emailC=true;
                        }	
                    }); //each

                }//success
                
            }); //ajax
        
            if(emailC==true){
                $("#emailanswer").html("사용불가능한 이메일입니다.").css("color","red");
            }else{
                $("#emailanswer").html("사용가능한 이메일입니다.").css("color","green");
            }
        }    
     }); //idcheck click

	//전화번호 3-4-4 입력시 다음 input으로 focus 이동
    
	//첫번째 칸
	$("#phone1").keyup(function(){
		if($("#phone1").val().length==3){
			$("#phone2").focus();
		}
	});//phone1
	
	//두번째 칸
	$("#phone2").keyup(function(){
		if($("#phone2").val().length==4){
			$("#phone3").focus();
		}
	});

	//가입취소 버튼 클릭
    $("#resetbtn").click(function(){
    	
        var resetquestion = confirm("가입을 취소하시겠습니까?");
        
        if (resetquestion == true){
            alert("가입이 취소되었습니다. 메인화면으로 이동합니다.");
            location.href= "index.html";
            return false;
        } else{
            alert("가입을 계속 진행합니다.");
            return false;
        }
    }); //reset

    
    
}); //readys