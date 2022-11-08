<%@page import="com.hanul.study.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> list = dao.searchAllMember();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fnDel(id) {
		// alert("id : " + id);
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href='jspMemberDelete.jsp?id=' +id;
		}
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
	<% for(MemberDTO dto : list) {%>
		<tr>
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getPw() %></td>
			<td><%=dto.getAge() %></td>
			<td><%=dto.getAddr() %></td>
			<td><%=dto.getTel() %></td>
			<td><input type="button" value="삭제" onclick="fnDel('<%=dto.getId() %>')" /> </td>
			<td><input type="button" value="수정" 
				onclick="location.href='jspMemberUpdate.jsp?id=<%=dto.getId() %>'" /> </td>
		</tr>
	<%} %>
	<tr>
		<td colspan="7" align="center">
			<input type="button" value="회원가입"
			 onclick="loation.href='jspMemberMain.html'" />
		</td>
	</tr>
</table>


</div>

</body>
</html>





