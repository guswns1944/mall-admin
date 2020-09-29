<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMemberList(memberEmail);
	response.sendRedirect(request.getContextPath()+"/member/memberList.jsp");
%>
