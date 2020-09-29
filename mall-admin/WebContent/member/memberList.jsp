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
	ArrayList<Member> list = new ArrayList<Member>();
	MemberDao memberDao = new MemberDao();
	list = memberDao.selectMemberList(currentPage,rowPerPage);
	int count = memberDao.count();
	//마지막 페이지 구하기
	int lastPage = count/rowPerPage;
	if(count%rowPerPage!=0){
		lastPage +=1;
	}
%>
<br>
	<h1>회원 목록</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>member_email</th>
				<th>member_pw</th>
				<th>member_name</th>
				<th>member_date</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Member m : list){
			%>
				<tr>
					<td><%=m.getMemberEmail() %></td>
					<td><%=m.getMemberPw() %></td>
					<td><%=m.getMemberName() %></td>
					<td><%=m.getMemberDate() %></td>
					<td><a class="btn btn-secondary btn-sm" href="<%=request.getContextPath()%>/member/memberDeleteAction.jsp?memberEmail=<%=m.getMemberEmail()%>">삭제</a></td>
				</tr>
			<%		
				}
			%>
		</tbody>
	</table>
		<%
	
		if(currentPage>1){
		%>
			<a class="btn btn-secondary btn-sm" href="./memberList.jsp?currentPage=1">처음으로</a>
		<%
			}
		if(currentPage > 1){
		%>
			<a class="btn btn-secondary btn-sm" href="./memberList.jsp?currentPage=<%=currentPage-1 %>">이전</a>
		<%		
			}
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./memberList.jsp?currentPage=<%=currentPage+1 %>">다음</a>
		<%		
			}
		%>
		<%
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./memberList.jsp?currentPage=<%=lastPage %>">끝으로</a>
		<%
			}
		%>
</div>
</body>
</html>