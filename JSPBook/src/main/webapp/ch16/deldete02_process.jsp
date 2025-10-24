<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	<!-- Statement 객체를 이용하여 SELECT 쿼리문 실행 결과 값 가져오기 -->
	<%@ include file="dbconn.jsp"%>

		<%
				String id = request.getParameter("id");
				String passwd = request.getParameter("passwd");
				
			ResultSet rs = null;
			PreparedStatement pstmt = null; // 권장

				try {
					String sql = "SELECT id, passwd FROM member WHERE id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					
					
					
					if(!rs.next()){
						out.println("member 테이블에 일치하는 아이디가 없습니다.");
					} else{
						String dbpasswd = rs.getString("passwd");
						
						if(passwd.equals(dbpasswd)){
						sql = "DELETE FROM member WHERE id = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						out.println("회원정보가 삭제되었습니다.");
						// 사용자가 입력한 비밀번호가 일치할 때만 이름을 수정
					}else{						
						out.println("비밀번호 또는 아이디가 일치하지 않습니다.");
					}
				}
					
			} catch (SQLException e){
				out.println("member 테이블 호출이 실패했습니다.<br>");
				out.println();
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
	%>

</body>
</html>