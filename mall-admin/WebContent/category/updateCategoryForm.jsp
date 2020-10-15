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
				if($("#categoryName").val().length<1){
					alert("카테고리 이름 확인");
					return;
				}
				$("#updateForm").submit();
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
	String categoryName = request.getParameter("categoryName");
	int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
%>
<br>
	<h1>카테고리 리스트 변경</h1>
		<form method = "post" action="/mall-admin/category/updateCategoryAction.jsp" id="updateForm">
			<table class="table-sm">
				<tr>
					<td><input type="hidden" class="form-control" name = "categoryNo" value =<%=categoryNo %>></td>
					<td>category_name :</td>
					<td><input type="text" class="form-control" name = "categoryName" id="categoryName" value=<%=categoryName %>></td>
					<td><button class="btn btn-outline-secondary" id="btn" type="button">변경</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>