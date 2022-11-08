<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

첫 번째 정수 (JSP) : <%=request.getParameter("num1") %> <br />
두 번째 정수 (JSP) : <%=request.getParameter("num2") %> <br />
<br />

첫 번째 정수 (EL) : ${param.num1 } <br />
두 번째 정수 (EL) : ${param.num2 } <br />
<br />

<%-- 
	<c:if test="조건식">실행문</c:if>
--%>
최대값 : <c:if test="${param.num1 - param.num2 > 0 }">${param.num1 }(num1)</c:if>
		 <c:if test="${param.num1 - param.num2 < 0 }">${param.num2 }(num2)</c:if>
<br />
최소값 : <c:if test="${param.num1 - param.num2 > 0 }">${param.num2 }(num2)</c:if>
		 <c:if test="${param.num1 - param.num2 < 0 }">${param.num1 }(num1)</c:if> 
<br />





</body>
</html>