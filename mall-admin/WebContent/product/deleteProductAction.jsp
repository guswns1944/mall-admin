<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%

	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	productDao.deleteProduct(productId);
	response.sendRedirect(request.getContextPath()+"/product/productList.jsp");
	
%>