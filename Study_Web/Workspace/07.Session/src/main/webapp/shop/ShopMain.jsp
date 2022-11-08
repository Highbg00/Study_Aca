<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String[] img = {"apple1.jpg", "apple2.jpg", "apple3.jpg"
			, "banana1.jpg", "banana2.jpg", "banana3.jpg", "pear1.jpg", "pear2.jpg", "pear3.jpg" };
	String[] name = {"사과1", "사과2", "사과3", "바나나1", "바나나2", "바나나3", "배1", "배2", "배3" };
	String[] price = {"1,500", "1,600", "1,700", "3,000", "3,500", "4,000", "5,000", "6,000", "7,000" };
	
	request.setAttribute("img", img);
	request.setAttribute("name", name);
	request.setAttribute("price", price);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnCart( name, price ) {
	// alert("과일명 : " + name + " 단가 : " + price);
	if ( confirm('장바구니에 담겠습니까?')) {
		location.href='CartProcess.jsp?name=' + name + '&price=' + price;
	}
}

function fnView() {
	if ( confirm('장바구니 내용을 확인하시겠습니까?')) {
		location.href='CartView.jsp'
	}
	return false;
}


</script>


</head>
<body>
<div align="center">
<table border="1">
	<tr align="center">
		<td colspan="3">
			<input type="button" value="장바구니 보기" onclick="fnView()" />
		</td>
	</tr>
	
	<!-- JSTL 을 이용 -->
	
	<c:forEach items="${img }"  var="i" varStatus="status">
		<c:if test="${status.index % 3 == 0 }"> <!-- 나머지를 구해 3줄 생성 -->
			<tr>		
		</c:if>
			<td>
				<table>
					<tr align="center">
						<td>
							<img src="../images/${i }" />
						</td>
					</tr>
					<tr align="center">
						<td>
							${name[status.index] }
						</td>
					</tr>
					<tr align="center">
						<td>
							￦${price[status.index] }원
						</td>
					</tr>
					<tr align="center">
						<td>
							<input type="button" value="장바구니 담기" 
							onclick='fnCart("${name[status.index]}", "${price[status.index] }")' />
						</td>
					</tr>
				</table>
			</td>
		<c:if test="${status.index % 3 == 2 }">
			</tr>
		</c:if>
	</c:forEach>
	
	<!-- JAVA 코드를 이용 -->
<%--
	<%
		for(int i = 0; i < img.length; i++) {
			if ( i % 3 == 0) {
				out.println("<tr>");
			}
			out.println("<td>");
				out.println("<table>");
				out.println("<tr align='center'>");
				out.println("<td>");
				out.println("<img src='../images/" + img[i] + "'/>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr align='center'>");
				out.println("<td>");
				out.println(name[i]);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr align='center'>");
				out.println("<td>");
				out.println(price[i]);
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr align='center'>");
				out.println("<td>");
				out.println("<input type='button' value='장바구니 담기' onclick='' />");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				
			out.println("</td>");
			if ( i % 3 == 2) {
				out.println("</tr>");
			}				
		}

	%>
--%>	
	
</table>


</div>



</body>
</html>