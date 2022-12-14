<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	/* DB에서 해당 ID의 회원 정보 조회 */
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.memberDetail(id);
	pageContext.setAttribute("dto", dto);	// EL로 접근 가능
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.update { background: #faa1ff;}
</style>
<script type="text/javascript">
function fnReset() {
	if( confirm("정말 초기화 하시겠습니까?")) {
		return true;
	}
	return false;
}

function fnSubmit() {
	if (confirm("정말 수정하시겠습니까?")) {
		return true;
	}
	return false;	
}
</script>
</head>
<body>
<div align="center">
<form action="update.jsp" method="post" onsubmit="return fnSubmit()" onreset="return fnReset()">
<input type="hidden" name="id"  value="${dto.id }" />
<table border="1">
	<tr>
		<th>이름</th>
<%-- 		<td><input type="text" name="name" value="<%=dto.getName() %>" required></td> --%>
		<td><input type="text" name="name" value="${dto.name }" required class='update' /></td>
	</tr>
	<tr>
		<th>아이디</th>
<%-- 		<td><%=dto.getId() %></td> --%>
		<td>${dto.id }</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" value="${dto.pw }" required class='update' /></td>
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="text" name="age" value="${dto.age }" required class='update'/></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" value="${dto.addr }" required class='update'/></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="${dto.tel }" required class='update'/></td>
	</tr>
	<tr align="center">
		<td colspan="2">
			<input type="submit" value="수정하기" /> 
			<input type="reset" value="초기화하기" /> 
			<input type="button" value="목록보기" onclick='location.href="list.jsp"'/> 
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>







