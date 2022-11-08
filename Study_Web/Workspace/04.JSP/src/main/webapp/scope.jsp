<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
○ scope.jsp 페이지에서 생성한 바인딩(연결) 객체를 scopeUse.jsp 넘기자 : 공유
   - scope 내장객체(pageContext, request, session, application)를 이용하여 바인딩 객체를 생성
   - 형식 : 내장객체.setAttribute(name, value); ▶ request.setAttribute("dto", dto);
   - name : 문자열(식별자), value : 공유객체(값)
-->

<%
// 바인딩(연결) 객체 생성 : setAttribute();
pageContext.setAttribute("pageContextName", "홍길동");
request.setAttribute("requestName", "JAVA");
session.setAttribute("sessionName", "Servlet/JSP");
application.setAttribute("applicationName", "Android");
%>

<%
// 바인딩(연결) 객체를 받음 : getAttribute(); ▶ Class Type, Casting
String pageContextName = (String) pageContext.getAttribute("pageContextName");
String requestName = (String) request.getAttribute("requestName");
String sessionName = (String) session.getAttribute("sessionName");
String applicationName = (String) application.getAttribute("applicationName");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul> <!-- JSP -->
	<li>pageContext : <%=pageContextName %> </li>
	<li>request : <%=requestName %></li>
	<li>session : <%=sessionName %></li>
	<li>application : <%=applicationName %></li>
</ul>
<ul> <!-- EL -->
	<li>pageContext : ${pageContextName }</li>
	<li>request : ${requestName }</li>
	<li>session : ${sessionName }</li>
	<li>application : ${applicationName }</li>
</ul>
</body>
</html>