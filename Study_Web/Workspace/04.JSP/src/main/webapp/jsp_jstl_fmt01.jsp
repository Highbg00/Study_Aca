<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="now" value="<%=new Date() %>"/>
<h3>날짜와 시간의 기본표시(JSTL _formatting 라이브러리)</h3>
○ JSTL 기본 형식 : ${now } <br /> 
○ 오늘의 날짜 : <fmt:formatDate value="${now }" type="date"/><br />
○ 현재의 시각 : <fmt:formatDate value="${now }" type="time"/><br />
○ 날짜와 시각 : <fmt:formatDate value="${now }" type="both"/><br />
○ short : <fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="short"/><br />
○ medium : <fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium"/> <br />
○ long : <fmt:formatDate value="${now }" type="both" dateStyle="long" timeStyle="long"/> <br />
○ full : <fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/> <br />
○ pattern 1 : <fmt:formatDate value="${now }" type="both" pattern="yyyy년 MM월 dd일 (E)" /> <br />
○ pattern 2 : <fmt:formatDate value="${now }" type="both" pattern="(a) hh시 mm분"/> <br />
<br />

<c:set value="123456789" var="num" />
<h3>숫자 형식(포맷) : ${num }</h3>
○ 형식 1 : <fmt:formatNumber value="${num }" groupingUsed="true"/> <br />
○ 형식 2 : <fmt:formatNumber value="${num }" groupingUsed="false"/> <br />
○ 형식 3 : <fmt:formatNumber value="${num }" pattern="#,##0" /> <br />
<br />

<h3>기타 포맷 : 통화기호, 백분율</h3>
○ 금액 1 : <fmt:formatNumber value="${num }" type="currency" currencySymbol="￦"/> <br />
○ 금액 2 : <fmt:formatNumber value="${num }" type="currency" currencySymbol="$"/> <br />
○ 금액 3 : <fmt:formatNumber value="${num }" pattern="￦#,##0" /><br />

○ 백분율 1 : <fmt:formatNumber value="0.123" type="percent" /> <br />
○ 백분율 2 : <fmt:formatNumber value="0.123" pattern="0.00%" /> 
</body>
</html>









