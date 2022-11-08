<%@page import="com.hanul.study.CalcDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  CalcDTO dto = (CalcDTO) request.getAttribute("dto"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>누적합 결과</title>
</head>
<body>
첫 번째 수 : <%=dto.getNum1() %><br />
두 번째 수 : <%=dto.getNum2() %><br />
두 수 사이의 누적 합 : <%=dto.getSum() %>
</body>
</html>