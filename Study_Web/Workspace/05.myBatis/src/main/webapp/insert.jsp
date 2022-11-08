<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property ="*" name="dto" />
</jsp:useBean>

<!-- 비지니스 로직 -->
<%
	MemberDAO dao = new MemberDAO();
	// 회원 가입 정보를 저장
	int succ = dao.memberInsert(dto);

	if ( succ > 0 ) {
		out.println("<script>alert('회원 가입 성공!');");
		out.println("location.href='list.jsp';</script>");
	} else {
		out.println("<script>alert('회원 가입 실패!');");
		out.println("location.href='list.jsp';</script>");
		
	}	
%>