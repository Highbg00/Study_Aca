<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 1000px; border: 1px solid #ccc; border-collapse: collapse;
}
th, td {
	border: 1px solid #ccc; padding: 10px;
}

</style>

</head>
<body>
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
	<td>2번째 본문영역(Content)이 들어갈 부분</td>
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