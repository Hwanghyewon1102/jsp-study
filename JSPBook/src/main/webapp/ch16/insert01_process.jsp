<%@page import="java.sql.Statement"%>
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

	<%@ include file="dbconn.jsp"%>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		Statement stmt = null;
	
		try {
			String sql = "INSERT INTO member (id, passwd, name)"
								 +  " VALUES ('" + id + "', '" + passwd + "', '" + name +"')";
			stmt = conn.createStatement(); // 정적인 쿼리에 사용하는 Statement 객체 생성
			stmt.executeUpdate(sql); // INSERT문 실행
			out.println("member 테이블 삽입이 성공했습니다.");			
		} catch (SQLException e){
			out.println("member 테이블 삽입이 실패했습니다.");
			out.println("SQLException: " + e.getMessage());

		} finally {
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
	
	%>

</body>
</html>