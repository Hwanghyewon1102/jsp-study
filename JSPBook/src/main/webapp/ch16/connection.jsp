<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<!-- JDBC API로 데이터베이스 접속하기 -->
	<%
		Connection conn = null;
	
		try {
			String url = "jdbc:mysql://127.0.0.1:3306/jspbookdb";
			String user = "root";
			String password = "12341234";
			
			// JDBC 드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// Connection 객체 얻기(JDBC 드라이버 -> DB 연결)
			conn = DriverManager.getConnection(url, user, password);
			out.println("데이터베이스 연결이 성공했습니다.");
			
		} catch (SQLException e){
			out.println("데이터 베이스 연결이 실패했습니다.");
			out.println("SQLException" + e.getMessage());
		}finally{
			if(conn != null) conn.close();
			out.println("<br>데이터베이스 연결을 종료했습니다.");
		}
	
	
	
	
	
	%>
</body>
</html>