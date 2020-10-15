<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
			if($("#categoryId").val().length<1){
				alert("카테고리 확인");
				return;
			}else if($("#productName").val().length<1){
				alert("제품이름 확인");
				return;
			}else if($("#productPrice").val().length<1){
				alert("제품가격 확인");
				return;
			}else if($("#productContent").val().length<1){
				alert("제품설명 확인");
				return;
			}else if($(".soldOut:checked").val().length<1){
				alert("품절여부 확인");
				return;
			}
			
			$("#addProductForm").submit();
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
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
	%>
	<br>
	<h1>상품 추가</h1>
	<form method="post" action="/mall-admin/product/addProductAction.jsp" id="addProductForm">
		<table class="table table-hover">
			<tr>
				<td>category_id</td>
				<td>
					<select class="form-control" name="categoryId" id="categoryId">
						<option value="">카테고리선택</option>
						<%
							for(Category c : categoryList){
						%>
							<option value="<%=c.getCategoryId() %>"><%=c.getCategoryName() %></option>
						<%		
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td>
					<input  type = "text" class="form-control"name = "productName" id="productName">
				</td>
			</tr>
			<tr>
				<td>product_price</td>
				<td>
					<input class="form-control" type = "text" name = "productPrice" id="productPrice">
				</td>
			</tr>
			<tr>
				<td>product_content</td>
				<td>
					<textarea class="form-control" rows="5" cols="80" name = "productContent" id="productContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>product_soldout</td>
				<td>
					<input class="form-check-inline" type="radio" name="productSoldout" value="N" class="soldOut">품절아님
					<input class="form-check-inline" type="radio" name="productSoldout" value="Y" class="soldOut">품절
				</td>
			</tr>
		</table>
		<button class="btn btn-secondary" style=float:right; type="button" id="btn">추가</button>
	</form>
	</div>
</body>
</html>