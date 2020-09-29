<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	//1. 상품 id와 이미지파일을 받아온다
	//2. 이미지파일을 서버 /images폴더에 새로운 이름으로 저장한다
	//3. 저장된 이미지의 이름을 상품 테이블에서 수정한다. ex) default.jpg -> 새로 생성된 이름으로 변경
	/*
	String productId = request.getParameter("productId"); // 방식은 기존방식 사용불가
	String productPic = request.getParameter("productPic");
	System.out.println(productId+"<-productId");
	System.out.println(productId+"<-productPic");
	*/
	// cos.jar 외부 라이브러리 사용( 내부 라이브러리 사용도 가능하지만 사용방법이 복잡)
	int size = 1024*1024*100; //100MB
	// D:\javawork\mall-admin\WebContent\images
	String path = application.getRealPath("images"); 
	//파일 이름을 만들어주는 객체
	DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy();
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", dfp);
	int productId = Integer.parseInt(multi.getParameter("productId"));
	String productPic = multi.getFilesystemName("productPic");
	System.out.println(productId+"<-productId");
	System.out.println(path+"<-path");
	System.out.println(productPic+"<-productPic");
	
	//String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getOriginalFileName("productPic")+"<-기존파일이름");
	System.out.println(multi.getFilesystemName("productPic")+"<-새로 생성된 파일이름");
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	ProductDao productDao = new ProductDao();
	productDao.updateProductPic(product);
	
	response.sendRedirect("/mall-admin/product/productOne.jsp?productId="+productId);
%>