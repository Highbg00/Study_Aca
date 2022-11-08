<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- JSTL core 변수를 선언하고 초기화 한 후, jsp_jstl_core03.jsp에 값을 넘기자 
: forward() --%>
<c:set var="code" value="abc001" scope="request" />
<c:set var="name" value="Computer" scope="request" />
<c:set var="price" value="500000" scope="request" />

<jsp:forward page="jsp_jstl_core03.jsp" />
</body>
</html>