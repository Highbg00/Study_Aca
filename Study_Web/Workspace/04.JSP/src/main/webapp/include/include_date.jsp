<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Date date = new Date();		// 날짜와 시간정보를 제공하는 클래스
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 날짜/시간</title>
</head>
<body>
<%=date %>
<%=sdf.format(date) %>
</body>
</html>