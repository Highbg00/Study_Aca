<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hidden {
	display: none;
}
</style>


<script type="text/javascript" src="jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#btn').click(function () {
// 		$('#display').toggle();
		$('#display').toggleClass('hidden');
	});
});


</script>


</head>
<body>
<button id='btn'>클릭하세요.</button>

<div id='display' style='background-color: yellow; width:200px; height:100px;'>
안녕하세요
</div>


<!-- 버튼을 클릭할 때마다 display 의 내용이 보였다 사라졌다 처리하시오.  -->


</body>
</html>