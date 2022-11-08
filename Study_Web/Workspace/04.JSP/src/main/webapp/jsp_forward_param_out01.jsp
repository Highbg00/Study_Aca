<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

// 바인딩(연결) 객체를 받는다. : Class Type, Casting
MemberDTO dto = (MemberDTO) request.getAttribute("dto");

// 매개변수를 받는다.
String ip = request.getParameter("ip");
// 현재 페이지에서 사용할 바인딩(연결) 객체
pageContext.setAttribute("ip", ip);
%>
<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름(JSP) : <%=dto.getName() %><br />
<!-- getProperty Action Tag 는 반드시 useBean Action Tag로 객체가 생성되어야만 사용 가능 -->
이름(Action) : <jsp:getProperty property="name" name="actionDTO"/>
이름(EL) : ${dto.name } <br />

IP주소(JSP) : <%=ip %> <br />
IP주소(EL) : ${param.ip } <br />
IP주소(EL) : ${ip } <br />
</body>
</html>