<%@page import="com.hanul.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);
%>

<jsp:useBean id="actionDTO" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="actionDTO" />
</jsp:useBean>

<!-- 현재 페이지에서만 사용할 바인딩(연결) 객체 생성 : EL 문법(표현식) 사용 -->
<%
pageContext.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 표기법 (param)</title>
</head>
<body>
- JSP 기본 출력 <br />
이름(Parameter) : <%=name %> <br />
아이디 (dto) : <%=dto.getId() %>
주소 (actionDTO) : <%=actionDTO.getAddr() %> <br />

- Action Tag 출력 : jsp:useBean 으로 객체가 생성되어야 사용 가능 <br />
이름 : <jsp:getProperty property="name" name="actionDTO"/> <br />
주소 : <jsp:getProperty property="addr" name="actionDTO"/> <br />

- EL 문법(표현식) 출력 <br />
이름 : ${param.name } (Parameter), ${dto.name } (dto), ${actionDTO.name }(actionDTO)<br />
주소 : ${param.addr } (Parameter), ${dto.addr } (dto), ${actionDTO.addr }(actionDTO)<br />
</body>
</html>









