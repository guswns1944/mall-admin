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
	int productId = Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+"<-productId");
	CategoryAndProduct cap = new ProductDao().selectProductOne(productId);
%>
<br>
	<h1>상품 상세보기</h1>
	<table class="table-sm table-bordered">
		<tr>
			<td>product_pic</td>
			<td><img src="/mall-admin/images/<%=cap.getProduct().getProductPic()%>" width="300px" height="300px">
			</td>
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=cap.getProduct().getProductId() %></td>
		</tr>
		<tr>
			<td>category_name</td>
			<td><%=cap.getCategory().getCategoryName() %></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=cap.getProduct().getProductName() %></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=cap.getProduct().getProductPrice() %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=cap.getProduct().getProductContent() %></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td>
				<%
					if(cap.getProduct().getProductSoldout().equals("Y")){
				%>
						<a class="btn btn-outline-secondary btn-sm" href="/mall-admin/product/modifyProductSoldoutAction.jsp?productSoldout=<%=cap.getProduct().getProductSoldout()%>&productId=<%=cap.getProduct().getProductId()%>">품절</a>
				<%		
					}else{
				%>
						<a class="btn btn-outline-secondary btn-sm" href="/mall-admin/product/modifyProductSoldoutAction.jsp?productSoldout=<%=cap.getProduct().getProductSoldout()%>&productId=<%=cap.getProduct().getProductId()%>">판매중</a>
				<%		
					}
				%>
			</td>
		</tr>
		<tr>
			<td><a class="btn btn-secondary btn-sm" href="/mall-admin/product/productList.jsp">목록</a></td>
			<td><a class="btn btn-secondary btn-sm" href="/mall-admin/product/modifyProductPic.jsp?productId=<%=cap.getProduct().getProductId()%>">이미지 수정</a>
			<a class="btn btn-secondary btn-sm" href="/mall-admin/product/updateProductForm.jsp?productId=<%=cap.getProduct().getProductId()%>&categoryName=<%=cap.getCategory().getCategoryName() %>">상품 수정</a>
			<a class="btn btn-secondary btn-sm" style=float:right; href="<%=request.getContextPath()%>/product/deleteProductAction.jsp?productId=<%=cap.getProduct().getProductId()%>">삭제</a></td>
		</tr>
	</table>
	</div>
</body>
</html>