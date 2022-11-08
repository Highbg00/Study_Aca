<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h3>[구구단 출력]</h3>
<table border="1">
	<tr bgcolor="silver">
		<% for(int i=2; i <= 9; i++) { %> 
			<th><font color="red"><%=i %>단</font></th>
		<%} %>
	<tr>	
	<%	for (int i = 1; i <=9; i++) {
			if (i % 2 == 0) { %>
				<tr align="center" bgcolor="pink">
			<%} else{ %>
				<tr align="center" bgcolor="yellow">
			<%} %>
			<% for (int j = 2; j <=9; j++) {  %>
				
				<% if (i * j < 10) { %>
					<td><%=j %> * <%=i %> = 0<%=(i * j) %></td>
				<%} else { %>
					<td><%=j %> * <%=i %> = <%=(i * j) %></td>
				<%} %>
			<%} %>			
		<%} %>
</table>
</div>
</body>
</html>