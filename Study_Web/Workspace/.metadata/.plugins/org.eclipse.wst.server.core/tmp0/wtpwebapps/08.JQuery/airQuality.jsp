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
		
		$.ajax ({
			dataType : 'json'
			, url : 'airInfo01.jsp'
			, success : function ( data ) {
				resultHtml( data );
			}, error : function () {
				alert('로딩 실패!');
			}			
		});
	});
});

function resultHtml( data ) {
	alert('로딩 성공!');
	var i = 0;
	var html = "<table border='1'>";
	html += "<tr>";
	html += "<th>No.</th>";
	html += "<th>지역명</th>";
	html += "<th>권역명</th>";
	html += "<th>항목명</th>";
	html += "<th>발령농도</th>";
	html += "<th>경보단계</th>";
	html += "<th>발령일</th>";
	html += "<th>해제일</th>";
	html += "</tr>";	

	$.each(data, function (key, value) {
		html += "<tr align='center'>";
		html += "<td>" + (++i) + "</td>";
		html += "<td>" + value.districtName + "</td>";
		html += "<td>" + value.moveName + "</td>";
		html += "<td>" + value.itemCode + "</td>";
		html += "<td>" + value.issueVal + "</td>";
		html += "<td>" + value.issueGbn + "</td>";
		html += "<td>" + value.issueDate + "</td>";
		html += "<td>" + value.clearDate + "</td>";
		html += "</tr>";		
	});
	html += "</table>";
	$('#display').empty();
	$('#display').append(html);	
}
</script>


</head>
<body>
<h3>우리나라 대기 정보</h3>
<button id='btn'>대기 정보 보기</button>
<div id='display'>
여기에 대기 정보를 출력합니다.
</div>
</body>
</html>