<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='jQuery/jquery-3.6.0.min.js'></script>
<script type="text/javascript">
/* 버튼 클릭시 member.json 파일을 읽어 데이터를 화면에 출력 */
$(function () {
	$('#btn').click(function () {
		$.getJSON('member.json', function (data) {
			var html = "<table border='1'>";
			html += "<tr><th>Num</th><th>Name</th><th>Age</th><th>Addr</th><th>Tel</th></tr>";
			
			$.each(data, function(key, value) {
				html += "<tr align='center'>";
				html += "<td>" + value.member.num + "</td>";
				html += "<td>" + value.member.name + "</td>";
				html += "<td>" + value.member.age + "</td>";
				html += "<td>" + value.member.addr + "</td>";
				html += "<td>" + value.member.tel + "</td>";
				html += "</tr>";			
			});
			html += "</table>";
			$('#display').empty();
			$('#display').append(html);		
		});		
	});
});
</script>
</head>
<body>
<button id='btn'>JSON Data Load</button>
<div id='display'>
	JSON Data Loading...
</div>
</body>
</html>