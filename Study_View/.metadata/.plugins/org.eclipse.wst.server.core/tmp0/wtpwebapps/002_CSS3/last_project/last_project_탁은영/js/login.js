$(document).ready(function() {
	
	//비밀번호 입력 focus
    $("#pw").focus(function(){
        if(!$("#id").val()){
            alert("아이디를 먼저 입력하세요");
            $("#id").focus();
        }
    });

    //로그인 버튼 클릭	
    $("#loginbtn").click(function() {
		
    	//아이디 입력을 안 했을 때 
		if (!$("#id").val()) {
			alert("아이디를 입력하세요");
			$("#id").focus();
			return false;
		}
		
		//비밀번호 입력을 안 했을 때 
		if (!$("#pw").val()) {
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return false;
		}
		
        //ajax 통신 아이디 확인
		var idCheck = false;
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
		
		//아이디와 비밀번호가 일치할때 
		if(idCheck == true) {
			alert($("#id").val() + "님 로그인되었습니다. 메인페이지로 이동합니다.");
			location.href="index.html";
			return false;
			
		} else {
			alert("존재하지 않은 아이디이거나 패스워드를 잘못 입력하셨습니다.");
			$("#id").val("");
			$("#pw").val("");
			$("#id").focus();
			return false;
		}

	}); //loginbtn click

    //아이디 확인
    $("#id").keyup(function() {
		
		var idCheck = false;
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
			$("#idspan").html("");
		} else if (idCheck == true) {
			$("#idspan").html("존재하는 아이디입니다.").css("color","green");
		} else {
			$("#idspan").html("존재하지 않는 아이디입니다.").css("color","red");
		}//if
		
	});//keyup
	
    //비밀번호 확인
	$("#pw").keyup(function() {
		
		var allCheck = false;
		
		$.ajax({
			
			url: "loginCheck.json",
			dataType: "json",
			async: false,
			
			success: function(result) {
				$(result).each(function(key, value) {
					
					if ($("#id").val() == value.id && $("#pw").val() == value.pw) {
						allCheck = true;
					}
				});
				
			}//success
			
		});//ajax
		
		if(!$("#pw").val()) {
			$("#pwspan").html("");
		} else if (allCheck == true) {
			$("#pwspan").html("비밀번호가 일치합니다.").css("color","green");
		} else {
			$("#pwspan").html("비밀번호가 일치하지 않습니다.").css("color","red");
		}
		
	});//keyup

    //비밀번호 보기 버튼 클릭
    $("#unlock").on({
        "click" : function() {
			$("#pw").attr("type","text");
		},
		"mouseleave" : function() {
			$("#pw").attr("type","password");
		}
    })

});  //ready