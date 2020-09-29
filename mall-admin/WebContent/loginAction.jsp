<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	
	Admin paramAdmin = new Admin();
	paramAdmin.setAdminId(adminId);
	paramAdmin.setAdminPw(adminPw);
	AdminDao adminDao = new AdminDao();
	Admin loginAdmin = adminDao.login(paramAdmin);
	if(loginAdmin==null){
		System.out.println("로그인 실패");
	}else{
		System.out.println("로그인 성공");
		// 로그인 정보를 session에 저장 (page < request < session < application)
		session.setAttribute("loginAdminId", loginAdmin.getAdminId());
		response.sendRedirect("/mall-admin/index.jsp");
	}
%>