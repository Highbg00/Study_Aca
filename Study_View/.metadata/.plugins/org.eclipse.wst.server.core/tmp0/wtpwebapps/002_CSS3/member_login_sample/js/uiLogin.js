$(document).ready(function(){

	$("#login").click(function () {
		$("#login_form").dialog("open");
	});
	
	$("#login_form").dialog({
		autoOpen: false,
		buttons: {
			로그인: function () {
				var id = $("#id").val();
				var pw = $("#pw").val();
				
				var idCheck = false;
				
				$.ajax({
					url : "loginCheck.json",
					dataType : "json",
					async: false,
					
					success : function(result){
						$(result).each(function(key, value){
							if(id==value.id && pw == value.pw) { 	
								idCheck = true;
							} //if
						}); //each
					}, //success
					
					error : function() { 
						alert("로딩 실패!");
					} //error 
				});
				
				if(idCheck) {
					alert(id + "님 로그인되었습니다.");
					$(".header_text").last().text("");
					$(".header_text").append(id + "님 반갑습니다.");
					$("#login_form").dialog("close");
				} else	{
					alert("존재하지 않는 아이디입니다.");
					$("#id").val("");
					$("#pw").val("");
					$("#id").focus();
				}
				
			},
			취소 : function () {
				$("#id").val("");
				$("#pw").val("");
				$("#login_form").dialog("close");
			}
		},
		modal: true
	});	
	
});

$(document).ready(function() {
	
	
	$(".menu").on("click", function() {
		$(".login_menu").show("slow");
	});
	
	
});