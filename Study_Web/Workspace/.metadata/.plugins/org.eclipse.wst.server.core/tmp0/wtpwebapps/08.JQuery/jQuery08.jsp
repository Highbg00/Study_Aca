<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='jQuery/jquery-3.6.0.min.js'></script>
<script type="text/javascript">
$(function () {
	$('#btn').click(function () {
		/* 동기식(처리속도, 변경 내용을 맞춤), 
		비동기(처리속도, 호출이 필요할 때만 접근, 해당 페이지 내에서 통신을 이룰 때) */
		$.ajax({
			dataType :'json'
			, url : 'memberList01.jsp' 
			, success : function ( data ) {
				resultHtml(data);	
			}, error : function () {
				alert("로딩 실패!");
			}			
		});
	});
});

function resultHtml(data) {
	alert("로딩 성공!");
	
	var html = "<table border='1'>";
	html += "<tr><th>이름</th><th>아이디</th><th>비밀번호</th><th>나이</th><th>주소</th><th>연락처</th></tr>";
	
	$.each(data, function (key, value) {
		html += "<tr align='center'>";
		html += "<td>" + value.member.name + "</td>";
		html += "<td>" + value.member.id + "</td>";
		html += "<td>" + value.member.pw + "</td>";
		html += "<td>" + value.member.age + "</td>";
		html += "<td>" + value.member.addr + "</td>";
		html += "<td>" + value.member.tel + "</td>";
		html += "</tr>";		
	});
	html += "</table>";
	
	$('#display').empty();
	$('#display').append(html);
}


</script>
</head>
<body>
<button id='btn'>회원목록 가져오기</button>
<div id = 'display'>
	여기에 회원목록이 출력됩니다.
</div>
</body>
</html>