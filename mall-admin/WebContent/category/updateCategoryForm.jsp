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
	request.setCharacterEncoding("utf-8");
	String categoryName = request.getParameter("categoryName");
	int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
%>
<br>
	<h1>카테고리 리스트 변경</h1>
		<form method = "post" action="/mall-admin/category/updateCategoryAction.jsp">
			<table class="table-sm">
				<tr>
					<td><input type="hidden" class="form-control" name = "categoryNo" value =<%=categoryNo %>></td>
					<td>category_name :</td>
					<td><input type="text" class="form-control" name = "categoryName" value=<%=categoryName %>></td>
					<td><button class="btn btn-outline-secondary" type="submit">변경</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>