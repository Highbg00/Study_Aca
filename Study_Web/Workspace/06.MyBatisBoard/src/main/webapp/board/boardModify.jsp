<%@page import="com.hanul.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>[ 글 수정 화면 ]</h3>
<form action="boardUpdate.bo" method="post">

<!-- 글 수정을 위해 게시번호를 넘겨야 하기에 숨김 속성으로 name="num" 을 넘긴다. -->
<input type="hidden" name="num" value="${dto.num }">

<table border="1">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer" value="${dto.writer }" /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="${dto.title }" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="50" name="content">${dto.content }</textarea></td>
	</tr>
	<tr>
		<th>수정할 비밀번호</th>
		<td>
			<input type="password" name="pw" value="${dto.pw }" />
			<input type="submit" value="수정하기" />
			<input type="reset" value="초기화하기">
			<input type="button" value="목록보기" onclick="location.href='boardList.bo'" />
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>












