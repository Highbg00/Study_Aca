<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int num1 = Integer.parseInt(request.getParameter("num1")) ;
	int num2 = Integer.parseInt(request.getParameter("num2")) ;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jsp_el_operator_out.jsp?num1=20&num2=10 -->
num1의 값(JSP) : <%=num1  %> <br />
num2의 값(JSP) : <%=num2 %><br />
num1의 값(EL) : ${param.num1 }<br />
num2의 값(EL) : ${param.num2 }<br />
<br />
★ EL 산술연산 <br />
num1 + num2 : ${param.num1 } + ${param.num2 } <br />
num1 + num2 : ${param.num1 + param.num2 } <br /> <!-- EL 표현식 블럭에서 계산식 처리 -->
num1 - num2 : ${param.num1 - param.num2 }<br />
num1 * num2 : ${param.num1 * param.num2 }<br />
num1 / num2 : ${param.num1 / param.num2 }<br />
num1 % num2 : ${param.num1 % param.num2 }<br />
<br />
★ EL 비교 연산 <br />
num1이 더 크나요? ${param.num1 - param.num2 > 0 } <br />
num1이 더 크나요? ${param.num1 - param.num2 gt 0 } <br />
num1이 더 크나요? ${param.num1 > param.num2 }<br />
num1이 더 크나요? ${param.num1 gt param.num2 }<br />

★ EL 3항 연산 <br />
num1이 더 크나요? ${param.num1 gt param.num2 ? "예" : "아니다" }<br />


<!-- 비교 연산자 표기법
	> : gt ,	>= : ge,	< : lt , 	<= : le
	== : eq ,	!= : ne 
 -->
</body>
</html>