$(document).ready(function(){
	var regUserName = /^[a-zA-Z-0-9]{4,12}$/;
	
	$('#id').on({
		"keyup" : function(){
			if(!id.value){
				$('#idcheck').html("아이디를 입력하세요").css("color","red");
			}else if(!regUserName.test(id.value)){
				$('#idcheck').html("유효한 아이디를 입력하세요").css("color","red");
			}else{
				$('#idcheck').html("가능합니다").css("color","blue");
			}
		}
	});
	
	$("#pw").click(function(){
		$("#pwCheckSpan").html("");
	}); //pw click
	
	$("#pw_verify").click(function(){
		$("#pwCheckSpan").html("");
	}); //pwCheck click
	
	$("#pw").keyup(function() {
		
		if ($("#pw").val() != $("#pw_verify").val()) {
				$("#pwCheckSpan").html("일치하지 않음").css("color","red");
		} else {
				$("#pwCheckSpan").html("일치함").css("color","blue");
		}
		
	}); //패스워드 체크는 무조건 키업으로 해야한다
	
	$("#pw_verify").keyup(function(){
		
		if ($("#pw").val() != $("#pw_verify").val()) {
			$("#pwCheckSpan").html("일치하지 않음").css("color","red");
	} else {
			$("#pwCheckSpan").html("일치함").css("color","blue");
	}
		
	});//pwCheck keyup
	
	$("#id_verify").click(function(){
		
		var cnt = 0;
		
		$.ajax({
			
			url : "js/loginCheck.json",
			dataType: "json",
			async: false, //동기적으로 통신
			
			success: function(result){
				$(result).each(function(key,value){
					
					if ($('#id').val() == value.id) {
						cnt = 1;
					} else if($('#id').val().trim() == ""){
						cnt = 2;
					} else if(!regUserName.test(id.value)){
						cnt = 3;
					}
				});
				if(cnt == 1) {
					alert("사용 불가능한 아이디입니다.");
				}else if(cnt == 2) {
					alert("아이디 입력이 공란입니다.")
				}else if(cnt == 3) {
					alert("유효한 아이디를 입력해 주십시오.")
				}else{
					alert("사용가능한 아이디입니다.");
				}
				cnt = 0;
			},
			error : function (xhr, status, error){
				alert("통신에러");
			}
		});
	});
	
	$("#signup").click(function(){
		alert("회원가입을 축하합니다.");
		location.href="index.html";
	});
}); //ready

	

