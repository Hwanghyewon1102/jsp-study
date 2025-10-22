<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	 <%@ include file="header.jsp" %>
	 
	 현재 시간: <%= LocalDateTime.now() %>
</body>
</html>