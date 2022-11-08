<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	/* DB에서 해당 id의 회원 정보 삭제 */
	MemberDAO dao = new MemberDAO();
	int succ = dao.memberDelete(id);
	
	if(succ > 0) {
		out.println("<script> alert('회원 정보 삭제 성공!!')");
		out.println("location.href='list.jsp';</script>");
	} else {
		out.println("<script> alert('회원 정보 삭제 실패!!')");
		out.println("location.href='list.jsp';</script>");
	}
%>