<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<jsp:setProperty property="*" name="dto" />
</jsp:useBean>

<!-- dto 객체를 jsp_forward_param_out01.jsp로 넘겨서 출력 : 동적페이지 전환(forward 방식) -->

<%
String ip = request.getRemoteHost();	// 클라이언트의 IP 주소를 가져온다.
request.setAttribute("dto", dto);		// 바인딩(연결) 객체
// 기존 방식 : 동적 페이지 전환(forward)
// RequestDispatcher rd = request.getRequestDispatcher("jsp_forward_param_out01.jsp");
// rd.forward(request, response);
%>

<!-- jsp:forward 액션 태그 -->
<jsp:forward page="jsp_forward_param_out01.jsp">
	<jsp:param value="<%=ip %>" name="ip" />
</jsp:forward>








