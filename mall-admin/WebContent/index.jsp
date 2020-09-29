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
	
</head>
<body>
	<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div><br>
	<h1>관리자 메인 페이지</h1>
	<p><%=session.getAttribute("loginAdminId") %>님 반갑습니다.</p>
	쇼핑몰의 관리자가 로그인하여 접속하며 상품카테고리와 상품,공지,회원 관리를 할 수 있는 페이지 입니다.<br>
	네비바는 inc의 메뉴에서 관리하며 category에서는 상품카테고리를 등록, 수정, 삭제를 할 수 있다. <br>
	product 에서는 상품의 이름, 가격, 품절여부를 확인하고 상품을 추가,수정,삭제 할 수 있으며<br>
	 전체목록과 카테고리별로 분류가 가능합니다.<br>
	 notice 또한 공지사항 등록, 수정, 삭제가 가능하고 member에서 회원정보를 삭제할수 있습니다.
	 </div>
	<h4>사용한 프로그램</h4>
		<table class ="table-sm table-bordered">
			<tr>
				<td>java - eclipse</td> 
			</tr>
			<tr>
				<td>tomcat v8.5</td>
			</tr>
			<tr>
				<td>mariadb v10.3</td>
			</tr>
			<tr>
				<td>mariadb-java-client-2.5.4</td>
			</tr>
		</table>
	 </div>
</body>
</html>