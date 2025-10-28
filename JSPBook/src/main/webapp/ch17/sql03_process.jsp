<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%-- <sql:query> 태그로 SELECT 쿼리문 실행하기 --%>
	
	<!-- DB 연결 정보를 설정하고, JSTL 내부적으로 사용할 DataSourece 객체를 생성 -->
	<!-- DataSource란? DB 연결을 관리하는 객체(Connection을 생성/재사용) -->
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://127.0.0.1:3306/jspbookdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="12341234"	/>
	
	<sql:update var="result" dataSource="${dataSource}">
		UPDATE member SET name = ? WHERE id = ? AND passwd = ?
    
		<sql:param value="${param.name}" />
		<sql:param value="${param.id}" />
		<sql:param value="${param.passwd}" />
	</sql:update>
	
	결과: <c:out value="${result}" />
	
	<!-- JSTL 버전의 동적 include: 해당 JSP의 실행 결과(HTML)를 가져와 붙음 -->
	<%-- <c:import url="sql01.jsp" /> --%> <!-- 바로 출력됨 -->
	<c:import var="content" url="sql01.jsp" /> <!-- 출력되지 않고 변수에 저장됨 -->
	${content}
	
</body>
</html>