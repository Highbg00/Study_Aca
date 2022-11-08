<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String[] fruit = { "오렌지", "멜론", "바나나", " 사과"};
	pageContext.setAttribute("fruit", fruit);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
○ JAVA 반복문 (단순 for문)<br />
<ul>
<%
for(int i = 0; i < fruit.length; i++) {
	out.println("<li>" + fruit[i] + "</li>");
}
%>
</ul>

○ JAVA 반복문 (향상된 for문)<br />
<ul>
<%
for(String f : fruit) {
	out.println("<li>" + f + "</li>");	
}
%>
</ul>

○ JSTL 반복문 (c:forEach)<br />
<ul>
<c:forEach var="f" items="${fruit }">
	<li>${f }</li>
</c:forEach>
</ul>

</body>
</html>