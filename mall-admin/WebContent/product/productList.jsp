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
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		
		int categoryId = 0;
		if(request.getParameter("categoryId")!=null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		//System.out.print(categoryId);
		ProductDao productDao = new ProductDao();
		ArrayList<Product> list = null;
		if(categoryId ==0){
			list = productDao.selectProductList(currentPage,rowPerPage);
		}else{
			list = productDao.selectProductListByCategoryId(categoryId,currentPage,rowPerPage);
		}
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
		int categoryCount = categoryDao.count(categoryId);
		System.out.print(categoryCount);
		int count = productDao.count();
		//마지막 페이지 구하기
		int lastPage;
		if(categoryId==0){
			lastPage = count/rowPerPage;
			if(count%rowPerPage!=0){
				lastPage +=1;
			}
		}else{
			lastPage = categoryCount/rowPerPage;
			if(categoryCount/rowPerPage!=0){
				lastPage +=1;
			}
		}
		
		System.out.print(lastPage);
	%>
	<br>
	<h1>상품 목록</h1>
	<div>
		<%
			for(Category c : categoryList){
		%>
				<a class="btn btn-secondary" href="/mall-admin/product/productList.jsp?categoryId=<%=c.getCategoryId() %>"><%=c.getCategoryName() %></a>
		<%		
			}
		%>
		<a class="btn btn-secondary" href="/mall-admin/product/productList.jsp?categoryId=0">모든 목록보기</a>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>product_id</th>
				<th>category_id</th>
				<th>pruduct_name</th>
				<th>product_price</th>
				<th>product_soldout</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : list){
					if(p.getProductSoldout().equals("Y")){
			%>
					<tr>
						<td><a class="btn btn-secondary btn-sm" href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId() %></a></td>
						<td><%=p.getCategoryId() %></td>
						<td><del><%=p.getProductName() %></del></td>
						<td><del><%=p.getProductPrice() %></del></td>
						<td>품절</td>
					</tr>
			<%			
					}else{		
			%>
					<tr>
						<td><a class="btn btn-secondary btn-sm" href="/mall-admin/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductId() %></a></td>
						<td><%=p.getCategoryId() %></td>
						<td><%=p.getProductName() %></td>
						<td><%=p.getProductPrice() %></td>
						<td><%=p.getProductSoldout() %></td>
					</tr>
			<%	
					}
				}
			%>
		</tbody>
	</table>
	<div>
		<a class="btn btn-secondary" style=float:right; href="/mall-admin/product/addProduct.jsp">상품 추가</a>
	</div><br><br><br>
	<%
	
		if(currentPage>1){
		%>
			<a class="btn btn-secondary btn-sm" href="./productList.jsp?currentPage=1&categoryId=<%=categoryId %>">처음으로</a>
		<%
			}
		if(currentPage > 1){
		%>
			<a class="btn btn-secondary btn-sm" href="./productList.jsp?currentPage=<%=currentPage-1 %>&categoryId=<%=categoryId %>">이전</a>
		<%		
			}
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./productList.jsp?currentPage=<%=currentPage+1 %>&categoryId=<%=categoryId %>">다음</a>
		<%		
			}
		%>
		<%
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./productList.jsp?currentPage=<%=lastPage %>&categoryId=<%=categoryId %>">끝으로</a>
		<%
			}
		%>
	</div>
</body>
</html>