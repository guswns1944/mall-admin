<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
	String categoryName = request.getParameter("categoryName");
	Category category = new Category();
	category.setCategoryId(categoryNo);
	category.setCategoryName(categoryName);
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
%>