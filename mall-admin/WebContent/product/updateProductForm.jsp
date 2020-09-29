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
	ArrayList<String> list = categoryDao.selectCategoryName();

	%>
	<br>
	<h1>상품 수정하기</h1>
	<form method="post" action="<%=request.getContextPath()%>/product/updateProductAction.jsp">
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
				<td><select class="form-control" name = "categoryName">
					<%
						for(String s : list){
							if(categoryName.equals(s)){
					%>
								<option value="<%=s %>" selected="selected"><%=s %></option>
					<%				
							}else{
					%>
								<option value="<%=s %>"><%=s %></option>
					<%			
							}
						
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<td>product_name</td>
				<td><input class="form-control" type="text" name="productName" value="<%=cap.getProduct().getProductName() %>"></td>
			</tr>
			<tr>
				<td>product_price</td>
				<td><input class="form-control" type="text" name="productPrice" value="<%=cap.getProduct().getProductPrice() %>"></td>
			</tr>
			<tr>
				<td>product_content</td>
				<td><textarea class="form-control" rows="5" cols="80" name = "productContent" ><%=cap.getProduct().getProductContent()%></textarea></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><button class="btn btn-outline-secondary" style=float:right;>수정 완료</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>