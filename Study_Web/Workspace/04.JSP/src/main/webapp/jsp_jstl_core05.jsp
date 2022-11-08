<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num")) ;

	if (num == 1) {
		out.println("1. 한울(java:if)");
	} else if (num == 2) {
		out.println("2. 자바(java:if)");		
	} else {
		out.println("3. Servlet/JSP(java:if)");
	}
%>
<br /><br />
<c:if test="${param.num eq 1}">1. 한울(c:if)</c:if>
<c:if test="${param.num eq 2}">2. 자바(c:if)</c:if>
<c:if test="${param.num eq 3}">3. Servlet/JSP(c:if)</c:if>
<br /><br />
<%--
○ JAVA : switch(기준값) case 비교값 break; default

○ JSTL : <c:choose>
		    <c:when test='조건식'>실행문</c:when>     if()
		    <c:when test='조건식'>실행문</c:when>     else if()
		    			:			:
		    <c:otherwise>실행문</c:otherwise>		  else 역할
		  </c:choose>
 --%>
<%
switch(num) {
	case 1 :
		out.println("1. 한울(switch)");
		break;
	case 2 :
		out.println("2. 자바(switch)");
		break;
	default :
		out.println("3. Servlet/JSP(switch)");
		break;
}
%>
<br /><br />
<c:choose>
	<c:when test="${param.num eq 1}">1. 한울(c:choose)</c:when>
	<c:when test="${param.num eq 2}">2. 자바(c:choose)</c:when>
	<c:otherwise>3. Servlet/JSP(c:choose)</c:otherwise>
</c:choose>

</body>
</html>















