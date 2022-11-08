<!-- 지시자 : HTML 주석 -->
<%-- 지시자 <%@ ... %> : JSP 주석 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int num1 = 1;
	int num2 = 100;
	int sum = getSum(num1, num2);
%> <%--  스크립틀릿<% %> --%>

<%!
	public int getSum(int num1, int num2) {
		int sum = 0;
		for (int i = num1; i < num2; i++) {
			sum += i;
		}
		return sum;
	}
%>  <%-- 선언문<%! %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	두 수 사이의 누적합 : <%=sum %>   <%-- 표현식<%= %> --%>
</body>
</html>