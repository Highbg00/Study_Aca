<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN 방식 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
// $(document).ready(function () {
	
// });

$(function () {
	// 버튼에 대한 이벤트 적용
	$('#btn').on('click', function () {
// 		$('#display').text("한울직업전문학교");
		$('#display').empty();	// display 영역에 있는 내용을 비움
		$('#display').append('한울직업전문학교');	// display 영역에 있는 내용에 문구 추가
	})
})

</script>
</head>
<body>
<button id="btn">클릭하세요</button>
<br />
<div id='display'>
	클릭하시면 글자가 바뀝니다.
	<!-- 한울직업전문학교 -->
</div>
</body>
</html>