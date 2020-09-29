<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%

	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	request.setCharacterEncoding("utf-8");
	int productId = Integer.parseInt(request.getParameter("productId"));
	String categoryName = request.getParameter("categoryName");
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	CategoryAndProduct cap = new CategoryAndProduct();
	cap.setCategory(new Category());
	cap.setProduct(new Product());
	cap.getCategory().setCategoryName(categoryName);
	cap.getProduct().setProductId(productId);
	cap.getProduct().setProductName(productName);
	cap.getProduct().setProductPrice(productPrice);
	cap.getProduct().setProductContent(productContent);
	
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(cap);
	response.sendRedirect(request.getContextPath()+"/product/productOne.jsp?productId="+productId);
%>