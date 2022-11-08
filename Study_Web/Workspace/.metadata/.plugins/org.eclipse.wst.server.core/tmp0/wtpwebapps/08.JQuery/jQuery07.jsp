<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function () {
	$('#btn').click(function () {
		$.ajax({
			dataType : 'json'
			, url : 'memberList.json'
			, success : function ( data ) {
				resultHtml(data);
			}, error : function () {
				alert('로딩 실패!');
			}		
		});		
	});
});

function resultHtml(data) {
	alert('로딩 성공');	
	var html = "<table border='1'>";
	html += "<tr><th>Num</th><th>Name</th><th>Age</th><th>Addr</th><th>Tel</th></tr>";
	
	$.each(data, function(key, value) {
		html += "<tr align='center'>";
		html += "<td>" + value.num + "</td>";
		html += "<td>" + value.name + "</td>";
		html += "<td>" + value.age + "</td>";
		html += "<td>" + value.addr + "</td>";
		html += "<td>" + value.tel + "</td>";
		html += "</tr>";			
	});
	html += "</table>";
	$('#display').empty();
	$('#display').append(html);	
}
</script>
</head>
<body>
<button id='btn'>JSON Data Load</button>
<div id='display'>
JSON Data Loading...
</div>
</body>
</html>