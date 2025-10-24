<%@page import="java.net.URLDecoder"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 정보</title>
	
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 주문 정보 확인 페이지 작성하기 -->
	<%
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName	= "";
		
		// Quiz: 요청에 담긴 모든 쿠키 가져와서 변수에 저장하기
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				switch (cookie.getName()) {
					case "Shipping_cartId":
						shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
					case "Shipping_name":
						shipping_name = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
					case "Shipping_shippingDate":
						shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
					case "Shipping_country":
						shipping_country = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
					case "Shipping_zipCode":
						shipping_zipCode = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
					case "Shipping_addressName":
						shipping_addressName = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
				}
			}
		}
	%>
	
	<div class="container py-4">
		<%@ include file="menu.jsp" %>

	 	<jsp:include page="title.jsp">
			<jsp:param value="주문 정보" name="title"/>
			<jsp:param value="Order Info" name="sub"/>
		</jsp:include>

    <div class="row align-items-md-stretch alert alert-info">
    	<div class="text-center">
				<h1>영수증</h1>
			</div>
			
			<!-- Quiz: 얻어온 쿠키 정보 중에서 성명, 우편번호, 주소, 국가, 배송일 출력 -->
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<strong>배송 주소</strong><br>
					성명: <%= shipping_name %><br> 
					우편번호: <%=	shipping_zipCode %><br> 
					주소: <%= shipping_country %>(<%= shipping_addressName %>)<br>
				</div>
				<div class="col-4" align="right">
					<p><em>배송일: <%= shipping_shippingDate %></em></p>
				</div>
			</div>
			<div class=" py-5">
				<table class="table table-hover">
					<tr>
						<th class="text-center">도서</th>
						<th class="text-center">#</th>
						<th class="text-center">가격</th>
						<th class="text-center">소계</th>
					</tr>
					<%
						// Quiz
						// 세션에 저장된 장바구니 정보 가져오기
						
						ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					
						if(cartList == null){
							cartList = new ArrayList<Book>();
 						}
						int sum = 0;
						for(Book book : cartList){
							int total = book.getUnitPrice() * book.getQuantity();
							sum += total;
					%>
					<tr>
						<td class="text-center"><em><%= book.getBookId() %> - <%= book.getName() %></em></td>
						<td class="text-center"><%= book.getUnitPrice() %></td>
						<td class="text-center"><%= book.getQuantity() %>원</td>
						<td class="text-center"><%= total %>원</td>
					</tr>
					<%
						} // 반복문 종료
					%>
					<tr>
						<td></td>
						<td></td>
						<td class="text-right"><strong>총액: </strong></td>
						<td class="text-center text-danger"><strong><%= sum %></strong></td>
					</tr>
				</table>
				<a href="./shippingInfo.jsp?cartId=<%= shipping_cartId %>" class="btn btn-secondary" role="button">이전</a>
				<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button">취소</a>			
			</div>
    	
    
    	
 		</div>

    <%@ include file="footer.jsp" %>
  </div>
</body>
</html>