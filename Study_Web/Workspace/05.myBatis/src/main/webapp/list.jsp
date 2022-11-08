<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> list = dao.memberSearchAll();
	// 현재 페이지에서만 사용할 바인딩(연결) 객체 : EL 문법을 사용하기 위해
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function fnDelete(id) {
	alert("id : " + id);
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href='delete.jsp?id=' + id;
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
	<h3>[전체회원 목록보기]</h3>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>나이</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>삭제</th>
			<th>수정</th>
		</tr>
		<!-- for 문을 이용한 출력 -->
		<!-- 향상된 for 문(forEach)을 이용한 출력 -->
<%-- 		
		<% 
		for( MemberDTO dto : list) {
			out.println("<tr align='center'>");
			out.println("<td>" + dto.getName() + "</td>");
			out.println("<td>" + dto.getId() + "</td>");
			out.println("<td>" + dto.getPw() + "</td>");
			out.println("<td>" + dto.getAge() + "</td>");
			out.println("<td>" + dto.getAddr() + "</td>");
			out.println("<td>" + dto.getTel() + "</td>");
			out.println("<td></td>");
			out.println("<td></td>");
			out.println("</tr>");			
		}
		%>
--%>		
		<!-- JSTL core 문과 EL 표현식(문법)을 이용한 출력 -->
		<c:forEach items="${list }" var="dto">
			<tr align="center">
				<td>${dto.name }</td>
				<td>${dto.id }</td>
				<td>${dto.pw }</td>
				<td>${dto.age }</td>
				<td>${dto.addr }</td>
				<td>${dto.tel }</td>
				<td><input type="button" value="삭제" onclick='fnDelete("${dto.id}")' /> </td>
				<td><input type="button" value="수정" onclick='location.href="detail.jsp?id=${dto.id }"'/></td>
			</tr>		
		</c:forEach>
		<tr align="center">
			<td colspan="8">
				<form action="search.jsp" method="post">
					<select name="search">
						<option value="name">이름</option>
						<option value="id">아이디</option>
						<option value="addr">주소</option>
						<option value="tel">전화번호</option>
					</select>
					<input type="text" name="keyword" />
					<input type="submit" value="검색하기" />
					<input type="button" value="회원가입" onclick="location.href='MemberMain.html' " />
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>









