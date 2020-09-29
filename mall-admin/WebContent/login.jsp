<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") !=null){
		System.out.println("이미 로그인 되어 있는 상태입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	#table{margin: 300px;}
</style>	
</head>
<body>
	<div class="container">
	
	<form method="post" action="/mall-admin/loginAction.jsp">
	
		<table id="table" class="table-md ">
			<tr>
				<th><h1>관리자 로그인</h1></th>
			</tr>
			<tr>
				<th>관리자 ID :
				<input type="text" name="adminId"></th>
			</tr>
			<tr>
				<th>관리자 PW :
				<input type="password" name="adminPw"></th>
			</tr>
			<tr>
			<th ><button class="btn btn-secondary" style=float:right; type="submit">로그인</button></th>
			</tr>
		</table>
		
	</form>
	</div>
</body>
</html>