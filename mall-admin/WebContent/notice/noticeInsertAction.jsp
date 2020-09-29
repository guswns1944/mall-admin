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
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	Notice notice = new Notice();
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
	
%>