<%@page import="com.hanul.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
// 	request.setCharacterEncoding("utf-8");
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	
	pageContext.setAttribute("crlf", "\r\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnDelete( pw ) {
	var user_pw = document.getElementById('pw');	
	
	if(user_pw.value.trim() == "") { // 비밀번호 미입력한 경우
		alert("비밀번호를 입력하세요!");
		user_pw.value = "";
		user_pw.focus();
	} else if ( user_pw.value != pw) {	// 비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!");
		user_pw.value = "";
		user_pw.focus();
	} else {	// 비밀번호 일치 ▶ 
		if (confirm ("정말 삭제하시겠습니까?")) {
			location.href="boardDelete.bo?num=" + ${dto.num};
		} else {
			user_pw.value = "";
			user_pw.focus();
		}
	}
}

function fnModify( pw ) {
var user_pw = document.getElementById('pw');	
	
	if(user_pw.value.trim() == "") { // 비밀번호 미입력한 경우
		alert("비밀번호를 입력하세요!");
		user_pw.value = "";
		user_pw.focus();
	} else if ( user_pw.value != pw) {	// 비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!");
		user_pw.value = "";
		user_pw.focus();
	} else {	// 비밀번호 일치
		/* 수정을 위하여 게시판 번호 값을 넘겨 해당 번호의 글을 수정 처리 */
		location.href="boardModify.bo?num=" + ${dto.num};
	}
}

</script>
<link rel="stylesheet" href="css/common.css">
</head>
<body>
<div align="center">
<table border="1">
	<tr align="center">
		<th>작성자</th>
<%-- 		<td><%=dto.getWriter() %></td> --%>
		<td>${dto.writer }</td>
		<th>조회수</th>
		<td>${dto.readcnt }</td>
	</tr> 
	<tr>
		<th>제목</th>
		<td colspan="3">${dto.title }</td>
	</tr>
	<tr>
		<th>내용</th>
<%-- 		<td colspan="3">${dto.content }</td> --%>
		<td colspan="3">
			<!-- 게시글 내용 줄바꿈 처리 방법 -->
<%-- 			<%=dto.getContent().replace("\r\n", "<br />") %> --%>
			${fn:replace(dto.content, crlf, "<br />" )}
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td colspan="3">
			<input type="password" name="pw" id="pw" />
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
		<!-- 삭제, 수정, 목록보기  버튼을 생성 -->
			<input type="button" value="삭제" onclick='fnDelete("${dto.pw }")' />
			<input type="button" value="수정" onclick='fnModify("${dto.pw}")' />
			<input type="button" value="목록보기" onclick="location.href='boardList.bo' "/>
		</td>
	</tr>
</table>
</div>
</body>
</html>