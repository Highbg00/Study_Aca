<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	session.setAttribute("id", id);
	
	// session 유지 시간 설정 	   초   분  시  일
	session.setMaxInactiveInterval(60 * 10 * 1 * 1); // (초단위, 600초, 10분 유지)
	
	response.sendRedirect("LoginMain.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>