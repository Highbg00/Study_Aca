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
		$('#display').empty();
		for(var i=1; i <= 9; i++) {
			if($('#dan').val() * i < 10) {	// 계산된 값이 10보다 작으면
				$('#display').append($('#dan').val() + " * " + i + " = 0" + $('#dan').val() * i + "<br />");
			} else {
				$('#display').append($('#dan').val() + " * " + i + " = " + $('#dan').val() * i + "<br />");
			}
		}
	});	
});


</script>
</head>
<body>
<input type="number" id="dan" />
<button id='btn'>구구단 출력</button>

<br />

<div id='display'>
	여기에 구구단이 출력됩니다.
</div>


</body>
</html>