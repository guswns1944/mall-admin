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
	int currentPage =1;
	if(request.getParameter("currentPage")!=null){
		currentPage =Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 10;
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> list = noticeDao.selectNoticeList(currentPage,rowPerPage);
	int count = noticeDao.count();
	//마지막 페이지 구하기
	int lastPage = count/rowPerPage;
	if(count%rowPerPage!=0){
		lastPage +=1;
	}
%>
<br>
	<h1>공지 목록</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Notice n : list){
			%>
				<tr>
					<td><%=n.getNoticeId() %></td>
					<td><a class="btn btn-link btn-sm" href ="<%=request.getContextPath() %>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle() %></a></td>
				</tr>
			<%		
				}
			%>
			
		</tbody>
	</table>
		<a class="btn btn-outline-secondary" style=float:right; href="<%=request.getContextPath() %>/notice/noticeInsertForm.jsp">공지사항 등록</a>
	<div>
		<%
	
		if(currentPage>1){
		%>
			<a class="btn btn-secondary btn-sm" href="./noticeList.jsp?currentPage=1">처음으로</a>
		<%
			}
		if(currentPage > 1){
		%>
			<a class="btn btn-secondary btn-sm" href="./noticeList.jsp?currentPage=<%=currentPage-1 %>">이전</a>
		<%		
			}
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./noticeList.jsp?currentPage=<%=currentPage+1 %>">다음</a>
		<%		
			}
		%>
		<%
		if(currentPage < lastPage){
		%>
			<a class="btn btn-secondary btn-sm" href="./noticeList.jsp?currentPage=<%=lastPage %>">끝으로</a>
		<%
			}
		%>
	</div>
</div>
</body>
</html>