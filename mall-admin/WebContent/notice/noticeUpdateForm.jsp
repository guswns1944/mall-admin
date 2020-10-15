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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#noticeTitle").val().length<1){
				alert("공지사항 제목 확인");
				return;
			}else if($("#noticeContent").val().length<1){
				alert("공지사항 내용 확인");
				return;
			}
			$("#noticeForm").submit();
		});
	});
</script>
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	request.setCharacterEncoding("utf-8");
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.selectNoticeOne(noticeId);
%>
	<h1>공지 상세보기</h1>
	<form method="post" action="<%=request.getContextPath()%>/notice/noticeUpdateAction.jsp" id="noticeForm">
		<table class="table table-hover">
			<tr>
				<td>notice_id</td>
				<td><input type="text" name="noticeId" class="form-control" value="<%=notice.getNoticeId()%>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td><input type="text" name="noticeTitle" class="form-control" id="noticeTitle" value="<%=notice.getNoticeTitle()%>" ></td>
			</tr>
			<tr>
				<td>notice_Content</td>
				<td><textarea class="form-control" rows="5" cols="80" name = "noticeContent" id="noticeContent"><%=notice.getNoticeContent()%></textarea></td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td><input type="text" name="noticeDate" class="form-control" value="<%=notice.getNoticeDate()%>"readonly="readonly"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			<td><button class="btn btn-outline-secondary" style=float:right; type="button" id="btn">수정 완료</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>