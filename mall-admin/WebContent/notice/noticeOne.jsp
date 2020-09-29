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
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeId);
%>
	<h1>공지 상세보기</h1>
		<table class="table table-hover">
			<tr>
				<td>notice_id</td>
				<td><input type="text" name="noticeId" class="form-control" value="<%=notice.getNoticeId()%>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td><input type="text" name="noticeTitle" class="form-control" value="<%=notice.getNoticeTitle()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>notice_Content</td>
				<td><textarea class="form-control" rows="5" cols="80" name = "noticeContent" readonly="readonly"><%=notice.getNoticeContent()%></textarea></td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td><input type="text" name="noticeDate" class="form-control" value="<%=notice.getNoticeDate()%>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><a class="btn btn-outline-secondary" style=float:right; href="<%=request.getContextPath()%>/notice/noticeDeleteAction.jsp?noticeId=<%=notice.getNoticeId()%>">삭제</a>
				<a class="btn btn-outline-secondary" style=float:right; href="<%=request.getContextPath()%>/notice/noticeUpdateForm.jsp?noticeId=<%=notice.getNoticeId()%>">수정</a></td>
			</tr>
		</table>
</div>
</body>
</html>