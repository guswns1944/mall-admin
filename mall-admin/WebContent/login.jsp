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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			if($("#adminId").val().length<1){
				alert("아이디 확인");
				return;
			}else if($("#adminPw").val().length<1){
				alert("비밀번호 확인");
				return;
			}
			$("#loginForm").submit();
		});
	});
</script>
<style>
	#table{margin: 300px;}
</style>	
</head>
<body>
	<div class="container">
	
	<form method="post" action="/mall-admin/loginAction.jsp" id="loginForm">
	
		<table id="table" class="table-md ">
			<tr>
				<th><h1>관리자 로그인</h1></th>
			</tr>
			<tr>
				<th>관리자 ID :
				<input type="text" name="adminId" value="admin" id="adminId"></th>
			</tr>
			<tr>
				<th>관리자 PW :
				<input type="password" name="adminPw" value=1234 id= "adminPw"></th>
			</tr>
			<tr>
			<th ><button class="btn btn-secondary" style=float:right; id="btn" type="button">로그인</button></th>
			</tr>
		</table>
		
	</form>
	</div>
</body>
</html>