<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				$("#addForm").submit();
			});
		});
	</script>
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div><br>
	<h1>카테고리 입력</h1>
	<form method="post" action="/mall-admin/category/addCategoryAction.jsp" id="addForm">
		<table class="table-sm">
			<tr>
			<td>category_name : <td>
			<td><input type="text" class="form-control"name="categoryName" id="categoryName"></td>
			</tr>
		</table>
		<div><button class="btn btn-outline-secondary" id="btn" type="button">카테고리 추가</button></div>
	</form>
</div>
</body>
</html>