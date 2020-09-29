<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div>	
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="container">
		<br>
			
 		<h1>주문 목록</h1>	 
 		<%
 			request.setCharacterEncoding("utf-8");
 			int ordersId = Integer.parseInt(request.getParameter("ordersId"));
 			String ordersState = request.getParameter("ordersState");
 		%>
 		<form method="post" action="/mall-admin/orders/modifyOrdersStateAction.jsp">
		 	<table class="table table-sm">
		 		<tr>
		 			<td>주문 번호</td>
		 			<td><input type ="text" class="form-control" name = "ordersId"value="<%=ordersId %>" readonly="readonly"></td>	
		 		</tr>		
		 		<tr>
		 			<td>주문 상태</td>
		 			<td><select class="form-control" name = "ordersState">
		 			<%
						if (ordersState.equals("결제완료")) {
					%>
							<option value="결제완료" selected="selected">결제완료</option>
					<%
						} else {
					%>
							<option value="결제완료">결제완료</option>
					<%
						}	
						if (ordersState.equals("배송준비중")) {
					%>
							<option value="배송준비중" selected="selected">배송준비중</option>
					<%
						} else {
					%>
							<option value="배송준비중">배송준비중</option>
					<%
						}
						
						if (ordersState.equals("배송완료")) {
					%>
							<option value="배송완료" selected="selected">배송완료</option>
					<%
						} else {
					%>
							<option value="배송완료">배송완료</option>
					<%
						}
						
						if (ordersState.equals("주문취소")) {
					%>
							<option value="주문취소" selected="selected">주문취소</option>
					<%
						} else {
					%>
							<option value="주문취소">주문취소</option>
					<%
						}
					%>
		 			</select>
		 			</td>
		 		</tr>
		 		<tr>
		 		<td><button class="btn btn-outline-secondary" type="submit">수정 완료</button></td>
		 		</tr>
		 	</table>		 
		 </form>
	</div>
</body>
</html>