<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("cart");			// 세션 cart 종료(닫기, 삭제))
	response.sendRedirect("ShopMain.jsp");		// 메인으로 이동
%>