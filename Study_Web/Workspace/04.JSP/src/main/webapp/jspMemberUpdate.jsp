<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.memberDetail(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnSubmit() {
	if (confirm('정말 수정하시겠습니까?')) {
		return true;
	}
	return false;
}
function fnReset() {
	if (confirm('정말 초기화하시겠습니까?')) {
		return true;
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
<h3>[회원정보 수정화면]</h3>
<form action="jspMemberModify.jsp" method="post" 
		onsubmit="return fnSubmit()" onreset="return fnReset()">
<input type="hidden" name="id" value="<%=dto.getId()%>" />		
<table border="1">
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="<%=dto.getName() %>" /></td>		
	</tr>
	<tr>
		<th>아이디</th>
		<td><%=dto.getId() %></td>		
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="pw" value="<%=dto.getPw() %>" /></td>		
	</tr>
	<tr>
		<th>나이</th>
		<td><input type="number" name="age" value="<%=dto.getAge() %>" /></td>		
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="addr" value="<%=dto.getAddr() %>" /></td>		
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="<%=dto.getTel() %>" /></td>		
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정하기" />
			<input type="reset" value="초기화하기" />
			<input type="button" value="목록보기"
				onclick="location.href='jspMemberList.jsp' " />
				
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>