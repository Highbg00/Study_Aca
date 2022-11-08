<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnTime() {
	var date = new Date();
	
	var hour = date.getHours();			// 현재 시각의 시 
	var minute = date.getMinutes();		// 현재 시각의 분
	var second = date.getSeconds();		// 현재 시각의 초
	
	// 오후 02시 05분 02초
	
	var setTime = hour > 12 ? "오후 " : "오전 ";	// 3항 연산자
	setTime += (hour > 12 ? hour-12 : hour) + "시 ";
	setTime += (minute < 10 ? "0" + minute : minute) + "분 ";
	setTime += (second < 10 ? "0" + second : second) + "초";
	
	document.getElementById("time").innerHTML = setTime;	
	setTimeout("fnTime()", 1000);		// 1000 = 1초
}
</script>



<style type="text/css">
table {
	width: 1000px; border: 1px solid #ccc; border-collapse: collapse;
}
th, td {
	border: 1px solid #ccc; padding: 10px;
}

</style>

</head>
<body onload="fnTime()">
<div align="center" id="time">현재시간</div>
<div align="center">
<table>
<tr>
	<td>
	<!-- header.jsp 파일 포함 -->
		<%@ include file="/include/header.jsp" %>
		<jsp:include page="/include/header.jsp" />
	</td>
</tr>
<tr>
	<!-- 본문 내용이 들어갈 부분 -->
	<td>본문영역(Content)이 들어갈 부분</td>
</tr>
<tr>
	<!-- footer.jsp 파일 포함 -->
	<td>
		<%@ include file="/include/footer.jsp" %> <br />
		<jsp:include page="/include/footer.jsp" />
	</td>
</tr>
<tr>
	<!-- include_date.jsp _날짜와 시간이 들어갈 부분 -->
	<td>
		<%@ include file="/include/include_date.jsp" %> <br />
		<jsp:include page="/include/include_date.jsp" />
	</td>
</tr>
</table>

</div>
</body>
</html>