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
	ProductDao productDao = new ProductDao();
	// 상품 목록이 없을때 삭제 
	String Ck = productDao.selectProductCk(categoryNo);
	if(Ck == null){
	Category category = new Category();
	category.setCategoryId(categoryNo);
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.deleteCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");
	}else{ // 상품 목록이 있다면 경고창
%>	
	<script>
		alert("상품 목록이 남아있어 카테고리를 삭제할 수 없습니다.");
		history.back();
	</script>
<%	
	}
%>