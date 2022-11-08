<%@page import="com.hanul.study.SumMachine"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	SumMachine sm = new SumMachine();
	int sum = sm.getSum(1, 100);
	pageContext.setAttribute("sum", sum);	// 바인딩(연결) 객체 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
두 수 사이의 누적합 : <%=sum %> <br /> <%-- 표현식<%= %> --%>
두 수 사이의 누적합 : ${sum }	<%-- EL 표기법(문법) --%> 
</body>
</html>