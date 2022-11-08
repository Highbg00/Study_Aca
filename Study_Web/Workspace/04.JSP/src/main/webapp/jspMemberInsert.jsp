<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 순수 자바코드<POJO>


// ① 클라이언트의 요청을 받는다. : 폼의 매개변수를 가져온다.
// request.setCharacterEncoding("utf-8");

// 방법 1 : 미리 만들어둔 DTO 클래스 이용	
// String name = request.getParameter("name");
// String id = request.getParameter("id");
// String pw = request.getParameter("pw");
// int age = Integer.parseInt(request.getParameter("age"));
// String addr = request.getParameter("addr");
// String tel = request.getParameter("tel");
//
// MemberDTO dto = new MemberDTO(name, id, pw, age, addr, tel);

// MemberDTO dto = new MemberDTO();

// dto.setName(request.getParameter("name"));
// dto.setId(request.getParameter("id"));
// dto.setPw(request.getParameter("pw"));
// dto.setAge( Integer.parseInt(request.getParameter("age")) );
// dto.setAddr(request.getParameter("addr"));
// dto.setTel(request.getParameter("tel"));

// ② 비지니스 로직 : DB 연동 → 회원가입 처리 ▶ DAO Class
// MemberDAO dao = new MemberDAO();
// int succ = dao.insertMember(dto);
%>

<!-- 1. 클라이언트의 요청을 받는다. -->
<% request.setCharacterEncoding("utf-8"); %>


<!-- id는 식별자(참조명), class에는 패키지명을 포함해서 적는다.  -->
<%-- jsp:useBean id="dto" class="com.hanul.study.MemberDTO" 
     ▶ MemberDTO dto = new MemberDTO();  같은 역할을 함. --%>
<!-- 액션 태그 내에선 자동 완성 기능이 지원하지 않으므로 
	액션 태그 밖에서 자동 완성을 시킴 (java 코드) -->     

<%-- 모든 파라미터를 받기 위해 와일드 카드 문자(*)를 사용함. --%>	
<%-- 전달받은 모든(*) 매개변수를 setter 함 --%>
<jsp:useBean id="dto" class="com.hanul.study.MemberDTO">
	<%-- <jsp:setProperty property="name" name="dto" />
	<jsp:setProperty property="id" name="dto" /> --%>
	
	<jsp:setProperty property="*" name="dto" />
</jsp:useBean>

<!-- 2. 비지니스 로직 : DB 연동 → 회원가입 처리 ▶ DAO Class-->

<jsp:useBean id="dao" class="com.hanul.study.MemberDAO"/>
<% int succ = dao.insertMember(dto);  %>

<!-- 3. 프리젠테이션 로직 -->
<%
if (succ > 0) {
	out.println("<script>alert('회원 가입 성공!')");
	out.println("location.href='jspMemberMain.html';</script>");
} else {
	out.println("<script>alert('회원 가입 실패!')");
	out.println("location.href='jspMemberMain.html';</script>");
}
%>












