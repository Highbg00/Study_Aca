<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	// 현재 문서의 tr에서 홀수번째(odd) 또는 짝수번째(even) 을 찾아 .css를 적용
	$('tr:odd').css("background", "#ff0000");
	$('tr:even').css("background", "#00ff00");
	$('tr:first').css("background", "#0000ff").css("color", "#ffffff");	
});

</script>
</head>
<body>
<div align="center">
	<table border="1">
		<tr>
			<th>이름</th>
			<th>혈액형</th>
			<th>주소</th>
		</tr>
		<tr>
			<td>홍길동</td>
			<td>A형</td>
			<td>광주광역시 서구</td>			
		</tr>	
		<tr>
			<td>홍길동</td>
			<td>B형</td>
			<td>광주광역시 동구</td>			
		</tr>	
		<tr>
			<td>홍길동</td>
			<td>O형</td>
			<td>광주광역시 남구</td>			
		</tr>	
		<tr>
			<td>홍길동</td>
			<td>AB형</td>
			<td>광주광역시 북구</td>			
		</tr>	
	</table>
</div>
</body>
</html>