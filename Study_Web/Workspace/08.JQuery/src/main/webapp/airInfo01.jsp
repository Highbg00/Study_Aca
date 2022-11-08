<%@page import="com.hanul.study.AirQualityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	AirQualityDAO dao = new AirQualityDAO();
	String json =  dao.makeJson();

	/* json 문자열 내 '[' 의 위치와 ']'의 위치를 찾아 
	   json 문자열을 잘라내고자 함. */
	int beginIndex = json.indexOf("[");
	int endIndex = json.indexOf("]");
//	int end = json.lastIndexOf("]");
	json = json.substring(beginIndex, endIndex +1);	
%>

<%= json %>