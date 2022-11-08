<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- JSTL Core(기본) 라이브러리 선언 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- JSTL Function(함수) 라이브러리 선언 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="str" value="   How   are   You?   "/>
○ 입력 문자열 : ${str } <br />
○ 공백 문자열 : How&nbsp;&nbsp;&nbsp;are&nbsp;&nbsp;&nbsp;You? <br />
<%-- JSTL function(함수) 라이브러리 (fn 태그)를 활용
	EL 문법 내에서 사용 --%>
○ 대문자로 출력 : ${ fn:toUpperCase(str) } <br />
○ 소문자로 출력 : ${ fn:toLowerCase(str) } <br />
○ 문자열의 길이 : ${ fn:length(str) } <br />
○ 좌우 공백을 제거하여 출력 : ${ fn:trim(str) } <br />
○ 좌우 공백을 제거한 후 문자열의 길이 : ${ fn:length(fn:trim(str))  }<br />
○ 좌우 공백을 제거한 후 문자열의 길이 : ${ fn:trim(str).length()  }<br />
○ A 문자의 위치 : ${fn:indexOf(str, "A") } <br />
○ a 문자의 위치 : ${fn:indexOf(str, "a") } <br />
○ are를 were로 변경 : ${fn:replace(str, "are", "were") } <br />
</body>
</html>











