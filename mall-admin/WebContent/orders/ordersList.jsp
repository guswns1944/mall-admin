<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
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
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<%
			request.setCharacterEncoding("utf-8");
				int currentPage =1;
				if(request.getParameter("currentPage")!=null){
			currentPage =Integer.parseInt(request.getParameter("currentPage"));
				}
				int rowPerPage = 10;
				String ordersState= "";
				if(request.getParameter("ordersState")!= null){
			ordersState = request.getParameter("ordersState");
				}
				OrdersDao ordersDao = new OrdersDao();
				ArrayList<OrdersAndProduct> list = null;
				ArrayList<String> list2 = ordersDao.selectOrdersStateList();
				if(ordersState.equals("")){
			list = ordersDao.selectOrdersList(currentPage, rowPerPage);
				}else{
			list = ordersDao.selectOrdersListByState(ordersState, currentPage, rowPerPage);
				}
				int count = ordersDao.count();
				//마지막 페이지 구하기
				int lastPage = count/rowPerPage;
				if(count%rowPerPage!=0){
			lastPage +=1;
				}
		%>
	<h1>주문 목록</h1>
	<form method="post" action="/mall-admin/orders/ordersList.jsp">
		<select name="ordersState">
			<option value="">선택</option>
			<%
				for(String s : list2){
						if(ordersState.equals(s)){
			%>			
						<option value="<%=s%>" selected="selected"><%=s%></option>
			<%
				}else{
			%>
						<option value="<%=s%>"><%=s%></option>
			<%
				}
			%>
				
			<%
								}
							%>
		
		</select>
		<button type="submit">주문상태별로 보기</button>
	<table class="table">
		<thead>
			<tr>
				<td>orders_id</td>
				<td>product_id</td>
				<td>product_name</td>
				<td>orders_amount</td>
				<td>orders_price</td>
				<td>member_email</td>
				<td>orders_addr</td>
				<td>orders_state</td>
				<td>orders_date</td>
				<td>orders_state 수정</td>
			</tr>
		</thead>
		<tbody>
		<%
			for(OrdersAndProduct o : list){
		%>
			<tr>
				<td><%=o.getOrders().getOrdersId() %></td>
				<td><%=o.getOrders().getProductId() %></td>
				<td><%=o.getProduct().getProductName() %></td>
				<td><%=o.getOrders().getOrdersAmount() %></td>
				<td><%=o.getOrders().getOrdersPrice() %></td>
				<td><%=o.getOrders().getMemberEmail() %></td>
				<td><%=o.getOrders().getOrdersAddr() %></td>
				<td><%=o.getOrders().getOrdersState() %></td>
				<td><%=o.getOrders().getOrdersDate() %></td>
				<td><a href="/mall-admin/orders/modifyOrdersState.jsp?ordersId=<%=o.getOrders().getOrdersId()%>&ordersState=<%=o.getOrders().getOrdersState()%>"> 수정</a></td>
			</tr>
		<%	
			}
		%>
			
		</tbody>
	</table>
	</form>
		<%
	
		if(currentPage>1){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=1">처음으로</a>
		<%
			}
		if(currentPage > 1){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=<%=currentPage-1 %>">이전</a>
		<%		
			}
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=<%=currentPage+1 %>">다음</a>
		<%		
			}
		%>
		<%
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=<%=lastPage %>">끝으로</a>
		<%
			}
		%>
</div>
</body>
</html>