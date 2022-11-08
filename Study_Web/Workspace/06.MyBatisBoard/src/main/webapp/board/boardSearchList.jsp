<%@page import="com.hanul.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>[ 검색 결과 화면 ]</h3>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<!-- JAVA 문법을 이용한 검색한 게시글을 출력 -->
	<%
	if(list.size() == 0) {	// list 의 크기가 0이면 (값이 없음)
		out.println("<tr align='center'><td colspan='5'>검색된 게시글이 없습니다.</td></tr>");
	} else {
		for(int i=0; i < list.size(); i++) {
			out.println("<tr align='center'>");
			out.println("<td>" + list.get(i).getNum()  + "</td>");
			out.println("<td>" + list.get(i).getTitle()  + "</td>");
			out.println("<td>" + list.get(i).getWriter()  + "</td>");
			out.println("<td>" + list.get(i).getWritedate()  + "</td>");
			out.println("<td>" + list.get(i).getReadcnt()  + "</td>");
			out.println("</tr>");
		}
	}
	%>
	
	<!-- JSTL을 이용한 검색한 게시글을 출력 -->
<%-- 	
	<c:if test="${ empty list }">
		<tr align="center">
			<td colspan="5">검색된 게시글이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${ ! empty list }">
		<c:forEach items="${list }" var="dto">	
			<tr align="center">
				<td>${dto.num }</td>
				<td>${dto.title }</td>
				<td>${dto.writer }</td>
				<td>${dto.writedate }</td>
				<td>${dto.readcnt }</td>
			</tr>
		</c:forEach>
	</c:if>
--%>
</table>


</div>
</body>
</html>