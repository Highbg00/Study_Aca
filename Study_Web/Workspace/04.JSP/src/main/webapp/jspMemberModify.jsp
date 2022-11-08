<%@page import="com.hanul.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");	
%>
<!-- jspMemberUpdate.jsp 에서 보낸 dto 값을 액션 태그를 활용하여 dto 객체를 생성 -->
<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto" /> 
</jsp:useBean>

<%
	MemberDAO dao = new MemberDAO();
	int succ = dao.memberUpdate(dto);
	
	if (succ > 0) {
		out.println("<script>alert('수정 성공!')");
		out.println("location.href='jspMemberList.jsp'; </script> ");
	} else {
		out.println("<script>alert('수정 실패!')");
		out.println("location.href='jspMemberList.jsp'; </script> ");
	}
	
%>








