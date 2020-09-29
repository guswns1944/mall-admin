<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*"%>
<%@ page import="dao.*"%>
<%

	if(session.getAttribute("loginAdminId")==null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}

	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNotice(noticeId);
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
	
%>