<%@page import="com.hanul.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
// 	request.setCharacterEncoding("utf-8");
	List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css">
</head>
<body>
<div align="center">
<h3>[ 게시판 전체 목록 보기 ]</h3>
<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<!-- JAVA forEach문을 이용한 출력  -->
<%-- 	
	<%
		if( list.size() == 0 ) {
			out.println("<tr align='center'><td colspan='5'>입력한 게시글이 없습니다.</td></tr>");
		} else {
			for(BoardDTO dto : list) {
				out.println("<tr align='center'>");
				out.println("<td>" + dto.getNum() + "</td>");
				out.println("<td>" + dto.getTitle() + "</td>");
				out.println("<td>" + dto.getWriter() + "</td>");
				out.println("<td>" + dto.getWritedate() + "</td>");
				out.println("<td>" + dto.getReadcnt() + "</td>");
				out.println("</tr>");
			}
		}	
	%>
--%>
	<!-- JSTL core 라이브러리를 이용한 출력 -->
	<c:if test="${empty list}">
		<tr align="center">
			<td colspan="5">입력한 게시글이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${ ! empty list }">
		<c:forEach items="${list }" var='dto' >
			<tr align="center">
				<td>${dto.num }</td>
				<!-- 글 제목 클릭시 게시글 번호를 전달하여 게시글 번호로 조회 처리토록 함. -->
				<td><a href='boardDetail.bo?num=${dto.num }'>${dto.title }</a></td>
				<td>${dto.writer }</td>
				<td>
					<fmt:parseDate value="${dto.writedate }" pattern="yyyy-MM-dd HH:mm:ss" var='dateString' />				
					<fmt:formatDate value="${dateString}" pattern="yy/MM/dd" />
				</td>
				<td>${dto.readcnt }</td>
			</tr>			
		</c:forEach>
	</c:if>
	<tr>
		<td colspan="5" align="center">
			<form action="boardSearch.bo" method="post">
				<select name='search'>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" name="keyword" />
				<input type="submit" value="검색하기" />
				<input type="button" value="글쓰기" onclick="location.href='boardWrite.bo' "/>
			</form> 
		</td>		
	</tr>
	
</table>

</div>
</body>
</html>










