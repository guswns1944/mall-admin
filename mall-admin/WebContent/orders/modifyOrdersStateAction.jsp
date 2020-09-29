<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	String ordersState = request.getParameter("ordersState");
	Orders orders = new Orders();
	orders.setOrdersId(ordersId);
	orders.setOrdersState(ordersState);
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersState(orders);
	response.sendRedirect("/mall-admin/orders/ordersList.jsp");
%>
