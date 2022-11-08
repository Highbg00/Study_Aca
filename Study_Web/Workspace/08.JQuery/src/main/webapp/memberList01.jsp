<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- MemberDAO 를 통해 DB에 접속 후, 
w_member 테이블의 전체 회원 정보(목록)를 조회해와
JSON 구조 형태로 변환하여 결과를 리턴 --%>

<%
MemberDAO dao = new MemberDAO();
String json = dao.memberList01();

%>

<%= json %>