<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- - 기본프로그래밍 Tag : 변수, 배열, if, switch ~ case, for 등 ▶ core --%> 
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num1 = 100;
%>
JAVA num1 = <%=num1 %> <br />

<%-- JSTL 변수 선언 : <c:set ~~ /> --%>
<!-- JSTL 변수 선언 : <c:set ~~ /> --%>
<c:set var="num2" value="200" />
JSTL num2 = ${num2 } <br /> <!-- EL 문법으로 화면 표시 -->

<!-- JAVA num1 값을 JSTL num3 할당 -->
<c:set var="num3" value="<%=num1 %>" />
JSTL num3 = ${num3 } <br />

<!-- JSTL num2 값과 num3 값을 더한 값 : result -->
<c:set var="result" value="${num2 + num3 }" />
JSTL result = ${result } <br />
</body>
</html>














