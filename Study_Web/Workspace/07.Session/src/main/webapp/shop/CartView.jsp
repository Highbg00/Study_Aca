<%@page import="com.hanul.cart.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<CartDTO> cart = null;
	Object obj = session.getAttribute("cart");

	if ( obj == null) {	// 장바구니가 비어있으면
		cart = new ArrayList<CartDTO>();		
	} else {
		cart = (ArrayList<CartDTO>) obj;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function fnClear() {
	if (confirm("장바구니를 비우시겠습니까?")) {
		location.href='CartClean.jsp';
	}
	return false;
}

</script>


</head>
<body>
<div align="center">
<h3>[ 장바구니 보기 ]</h3>
<table border="1"> 
	<tr>
		<th>번호</th>
		<th>과일명</th>
		<th>단가</th>
		<th>주문수량</th>
		<th>가격</th>
	</tr>
	<c:if test="${ empty cart }">
		<tr align="center">
			<td colspan="5">
			주문하신 내역이 없습니다		
			</td>
		</tr>
	</c:if>
	
	<c:if test="${ ! empty cart }">
		<c:forEach items="${ cart }" var="dto" varStatus="status">
			<tr align="center">
				<td>${status.index +1 }</td>	
				<td>${dto.name }</td>	
				<td><fmt:formatNumber value="${dto.price }" pattern="￦#,##0" /></td>	
				<td>${dto.cnt }</td>
				<c:set var="totalSum" value="${dto.price * dto.cnt }" />
<%-- 				<td><fmt:formatNumber value="${dto.price * dto.cnt }" pattern="￦#,##0" /></td>	 --%>
				<td><fmt:formatNumber value="${totalSum}" pattern="￦#,##0" /></td>	
			</tr>
		</c:forEach>
	</c:if>
	
	<tr>
		<td colspan="5">
			<input type="button" value="주문 계속하기" onclick="location.href='ShopMain.jsp'"/>
			<input type="button" value="장바구니 비우기" onclick='fnClear()' />
												<!-- fnClear() 동작 이후 CartClean.jsp 로 이동 -->
			<input type="button" value="결제하기" />
		</td>
	</tr>	
	
</table>


</div>




</body>
</html>