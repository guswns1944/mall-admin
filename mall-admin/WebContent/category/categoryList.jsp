<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
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
	<title>categoryList</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
</head>
<body>
	<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<br>
	<h1>categoryList</h1>
	
	
	<%
		request.setCharacterEncoding("utf-8");
		CategoryDao categoryDao = new CategoryDao();
		int currentPage =1;
		if(request.getParameter("currentPage")!=null){
			currentPage =Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		ArrayList<Category> list = categoryDao.selectCategoryList(currentPage, rowPerPage);
		int count = categoryDao.count();
		//마지막 페이지 구하기
		int lastPage = count/rowPerPage;
		if(count%rowPerPage!=0){
			lastPage +=1;
		}
	%>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>category_no</th>
				<th>category_name</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%
			for(Category c : list){
		%>
				<tr>
					<td><%=c.getCategoryId() %></td>
					<td><%=c.getCategoryName() %></td>
					<td><a class="btn btn-secondary btn-sm" href="/mall-admin/category/updateCategoryForm.jsp?categoryNo=<%=c.getCategoryId()  %>&categoryName=<%=c.getCategoryName() %>">수정</a></td>
					<td><a class="btn btn-secondary btn-sm" href="/mall-admin/category/deleteCategoryAction.jsp?categoryNo=<%=c.getCategoryId() %>">삭제</a></td>
				</tr>
		<%		
			}
		%>
			
		</tbody>
	</table>
			<div>
				<a class="btn btn-secondary" style=float:right; href="/mall-admin/category/addCategory.jsp">상품 카테고리 추가</a>
			</div>
	<%
	
		if(currentPage>1){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=1">처음으로</a>
		<%
			}
		if(currentPage > 1){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=<%=currentPage-1 %>">이전</a>
		<%		
			}
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=<%=currentPage+1 %>">다음</a>
		<%		
			}
		%>
		<%
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./categoryList.jsp?currentPage=<%=lastPage %>">끝으로</a>
		<%
			}
		%>
	</div>
</body>
</html>