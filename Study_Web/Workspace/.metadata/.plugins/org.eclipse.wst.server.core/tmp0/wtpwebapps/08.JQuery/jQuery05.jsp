<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CDN 방식 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 다운로드 방식 -->
<script type="text/javascript" src="jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function () {
	// 행과 열 값을 입력받아 표를 만듬
	$('#btn').click(function () {
		var row = $('#row').val();	// 사용자가 입력한 row 값을 할당
		var col = $('#col').val();	// 사용자가 입력한 col 값을 할당
// 		alert('row : ' + row +"\ncol : " + col);
		
		var html = "<table border='1'>";
		for ( var i= 0; i < row; i++) {
			html += "<tr align='center'>";
			for ( var j = 0; j < col; j++) {
				html += "<td>";
				html += (i + 1) + "행" + (j + 1) + "열";
				html += "</td>";
			}
			html += "</tr>"
		}
		html += "</table>"	
		
		$('#display').empty();			// #display 영역의 내용을 비움
		$('#display').append(html);		// #display 영역에 html 값(속성)을 더함(추가, 적용)
	});
})
</script>
</head>
<body>
<input type="number" id='row' />행 * <input type="number" id='col' />열
<button id='btn'>테이블 생성하기</button>
<div id='display'>
여기에 테이블을 생성합니다.
</div>
</body>
</html>