<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
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
			if($("#categoryName").val().length<1){
				alert("카테고리 이름 확인");
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
			}else{
				$("#updateProductForm").submit();
			}
		
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
	int productId = Integer.parseInt(request.getParameter("productId"));
	String categoryName = request.getParameter("categoryName");
	System.out.println(productId+"<-productId");
	CategoryAndProduct cap = new ProductDao().selectProductOne(productId);
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<Category> list = categoryDao.selectCategoryList();

	%>
	<br>
	<h1>상품 수정하기</h1>
	<form id="updateProductForm"method="post" action="<%=request.getContextPath()%>/product/updateProductAction.jsp">
		<table class="table-sm table-bordered">
			<tr>
				<td>product_pic</td>
				<td><img src="/mall-admin/images/<%=cap.getProduct().getProductPic()%>" width="300px" height="300px">
				</td>
			</tr>
			<tr>
				<td>product_id</td>
				<td><input class="form-control" type="text" name="productId" value="<%=cap.getProduct().getProductId() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>category_name</td>
				<td><select class="form-control" name = "categoryId" id="categoryName">
					<%
						for(Category s : list){
							if(categoryName.equals(s.getCategoryName())){
					%>
								<option value="<%=s.getCategoryId() %>" selected="selected"><%=s.getCategoryName() %></option>
					<%				
							}else{
					%>
								<option value="<%=s.getCategoryId() %>"><%=s.getCategoryName() %></option>
					<%			
							}
						
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input class="form-control" type="text" name="productName" id="productName"value="<%=cap.getProduct().getProductName() %>"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input class="form-control" type="text" name="productPrice" id="productPrice"value="<%=cap.getProduct().getProductPrice() %>"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><textarea class="form-control" rows="5" cols="80" name = "productContent" id="productContent"><%=cap.getProduct().getProductContent()%></textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><button class="btn btn-outline-secondary" style=float:right; id="btn" type="button">수정 완료</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>