<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
<%--
○ JAVA 반복문 : for, while, do~while

○ JSTL 반복문 : <c:forEach>실행문</c:forEach>
   ▶ <c:forEach items="객체명" var="반복변수명" 
   		begin="초기값" end="최종값" step="증감값" varStatus="other변수">
   			실행문
   	  </c:forEach>
 --%>

○ JAVA 반복문(for)<hr />
<%
for (int i = 1; i <= 7; i++) {
	out.println("<font size='" + i + "'>JSP/Servlet</font><br/>");
}
%>
<br /><br />
○ JSTL 반복문(c:forEach)<br />
<c:forEach var="i" begin="1" end="7" step="1">
	<font size="${i }">JSP/Servlet</font><br />
</c:forEach>
<br /><br />

<%
	ArrayList<String> list = new ArrayList<String>();
	list.add("홍길동");
	list.add("이순신");
	list.add("유관순");	
	request.setAttribute("name", list);
%>

○ JAVA 반복문(향상된 for문)<br />
<%
	for(String n : list) {
		out.println("<span>" + n + "</span><br />");
	}
%>
<br /><br />
○ JSTL 반복문(c:forEach)<br />
<c:forEach var="n" items="${name }">
	<c:out value="${n }" />
</c:forEach>

</body>
</html>









