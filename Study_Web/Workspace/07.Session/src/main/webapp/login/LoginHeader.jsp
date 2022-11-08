<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--  --%>

<header style="border-bottom: 1px solid #ccc; padding: 15px 0; text-align: left;">
<div id='header' style="margin-left: 200px">
	<ul>
		<li><a href="#">HOME</a></li>
		<li><a href="#">JOIN</a></li>
		<li><a href="#">Site Map</a></li>
		<li><a href="#">Others..</a></li>
	</ul>
</div>

<form action="Login.jsp" method="post">
	<ul>
		<c:if test="${ not empty id }">
			<li>${id } 님 방문을 환영합니다. <a href='Logout.jsp'>로그아웃</a></li>		
		</c:if>
	
		<c:if test="${ empty id }">
			<li>
				아이디 : <input type="text" name='id' />
				비밀번호 : <input type="password" name='pw' />
				<input type="submit" value="로그인" />
			</li>
		</c:if>		
	</ul>
</form>
</header>
<style>
	header ul, header ul li {
		margin: 0px; padding: 0px;
		display: inline;
	}
</style>