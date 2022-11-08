<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>[ 게시판 글쓰기 ]</h3>
<form action="boardInsert.bo" method="post">
<table border="1">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer" required="required" autofocus /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" required="required" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="50" name="content" required="required" ></textarea></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" required="required" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="등록하기" />
			<input type="reset" value="다시 작성하기" />
			<input type="button" value="목록보기" onclick="location.href='boardList.bo' " />
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>







