<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//	session.setAttribute("id", id);	// 세션에 속성(id)을 담음.
//	session.setAttribute("pw", pw);	// 세션에 속성(pw)을 담음.
//	session.getAttribute("id");		// 세션에 담긴 속성을 가져옴.
	session.removeAttribute("id");	// 세션에 담긴 속성(id)을 제거
	session.invalidate();			// 모든 세션의 속성을 제거

	response.sendRedirect("LoginMain.jsp");
%>