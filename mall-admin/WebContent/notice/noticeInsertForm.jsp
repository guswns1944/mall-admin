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

<br>
	<h1>공지사항 등록</h1>
	<form method="post" action="<%=request.getContextPath()%>/notice/noticeInsertAction.jsp">
		<table class="table table-hover">
			<tr>
				<td>notice_title</td>
				<td><input type="text" name="noticeTitle" class="form-control" ></td>
			</tr>
			<tr>
				<td>notice_Content</td>
				<td><textarea class="form-control" rows="5" cols="80" name = "noticeContent" ></textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			<td><button class="btn btn-outline-secondary" style=float:right;>등록 완료</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>