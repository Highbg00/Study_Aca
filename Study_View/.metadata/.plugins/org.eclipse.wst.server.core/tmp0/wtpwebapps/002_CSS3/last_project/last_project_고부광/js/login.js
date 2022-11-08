$(document).ready(function() {
	$("#btn_login").click(function(){
		var username = 0;
		var userpw = 0;
		var cnt = 0;
		$.ajax({
			
			url : "js/loginCheck.json",
			dataType: "json",
			async: false, //동기적으로 통신
			
			success: function(result){
				$(result).each(function(key,value){
					
					username = $('#username').val();
					userpw = $('#password').val();
					if (( username == value.id) && (userpw == value.pw)) {
						cnt++;
					}
				});
				if(cnt == 1) {
					alert( username + "님 로그인되었습니다");
					location.href="index.html";
				}else{
					alert("아이디가 일치하지 않거나 비밀번호가 틀립니다");
					location.href="login.html";
				}
				cnt = 0;
			},
			error : function (xhr, status, error){
				alert("통신에러");
			}
		});
	
		
		
		
	});
}); 
//alert("아이디가 일치하지 않거나 비밀번호가 틀립니다");
//location.replace("login.html")
//alert("로그인되었습니다");
//location.replace("index.html")
// 데이터 타입 불러오는 법
//$(result).each(function(key, value){
//	
//	$("body").append("<h1> id :" + value.id + " pw : " + value.pw + " email : " + value.email + "</h1>");//append
//	
//});