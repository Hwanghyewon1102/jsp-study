<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>
	<!-- page 디렉티브 태그에 Date 클래스를 이용하여 현재 날짜 출력하기 -->
	Today is <%= new Date() %><br>
	Today is <%= LocalDate.now() %>
</body>
</html>