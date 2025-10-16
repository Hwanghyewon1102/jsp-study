<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<p>Current Time: <%= Calendar.getInstance().getTime() %></p>
	<p>Current Time: <%= LocalDateTime.now() %></p>
</body>
</html>