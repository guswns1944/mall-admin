package dao;
import java.util.*;

import commons.DBUtil;
import vo.*;
import java.sql.*;
public class ProductDao {
	// 상품 내용 변경
	public void updateProduct(CategoryAndProduct cap) throws Exception {
		String sql = "update product p ,category c set c.category_name = ?, p.product_name = ?, p.product_price = ?, p.product_Content = ? where c.category_id = p.category_id and p.product_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cap.getCategory().getCategoryName());
		stmt.setString(2, cap.getProduct().getProductName());
		stmt.setInt(3, cap.getProduct().getProductPrice());
		stmt.setString(4, cap.getProduct().getProductContent());
		stmt.setInt(5, cap.getProduct().getProductId());
		stmt.executeUpdate();
	}
	//상품 사진 변경
	public void updateProductPic(Product product) throws Exception{
		String sql = "update product set product_pic = ? where product_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, product.getProductPic());
		stmt.setInt(2, product.getProductId());
		stmt.executeUpdate();
		conn.close();
		}
	//카테고리삭제를 위한 카테고리별 상품 존재 여부 확인
	public String selectProductCk(int categoryId) throws Exception {
		String Ck = null;
		String sql = "select product_name from product where category_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			Ck = rs.getNString("product_name");
		}
		conn.close();
		return Ck;
	}
	//상품 삭제
	public void deleteProduct(int productId) throws Exception {
		String sql = "delete from product where product_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		stmt.executeUpdate();
		conn.close();
	}
	//품절 표시 변경
	public void updateProductSoldout(int productId, String productSoldout) throws Exception{
		String sql = "update product set product_soldout = ? where product_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		if(productSoldout.equals("Y")) {
			stmt.setString(1, "N");
		}else {
			stmt.setString(1, "Y");
		}
		stmt.setInt(2, productId);
		stmt.executeUpdate();
		conn.close();
	}
	// 상품 상세보기 category_id는 이름으로 보이도록 조인
	public CategoryAndProduct selectProductOne(int productId) throws Exception{
		CategoryAndProduct cap = null;
		String sql = "select p.product_id, c.category_name, p.product_name, p.product_price, p.product_content, p.product_soldout, p.product_pic from product p, category c where c.category_id = p.category_id and product_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cap = new CategoryAndProduct();
			cap.setCategory(new Category());
			cap.setProduct(new Product());		
			cap.getCategory().setCategoryName(rs.getString("category_name"));
			cap.getProduct().setProductId(rs.getInt("product_id"));
			cap.getProduct().setProductName(rs.getString("product_name"));
			cap.getProduct().setProductPrice(rs.getInt("product_price"));
			cap.getProduct().setProductContent(rs.getString("product_content"));
			cap.getProduct().setProductSoldout(rs.getString("product_soldout"));
			cap.getProduct().setProductPic(rs.getString("product_pic"));
			
		}
		conn.close();
		return cap;
	}
	// 상품 등록
	public void insertProduct(Product product) throws Exception {
		String sql = "insert into product(category_id, product_name, product_price, product_content, product_soldout) values (?,?,?,?,?)";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setInt(3, product.getProductPrice());
		stmt.setString(4, product.getProductContent());
		stmt.setString(5, product.getProductSoldout());
		stmt.executeUpdate();
		conn.close();
	
	}
	// 전체상품 목록
	public ArrayList<Product> selectProductList(int currentPage, int rowPerPage) throws Exception {
		ArrayList<Product> list = new ArrayList<Product>();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout from product limit ?,? ";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, (currentPage-1)*10);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getNString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getNString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	// 카테고리별 상품 목록
	public ArrayList<Product> selectProductListByCategoryId(int categoryId, int currentPage, int rowPerPage) throws Exception {
		ArrayList<Product> list = new ArrayList<Product>();
		String sql = "select product_id, category_id, product_name, product_price, product_soldout from product where category_id = ? limit ?,?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		stmt.setInt(2, (currentPage-1)*10);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductName(rs.getNString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductSoldout(rs.getNString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	//페이징을 위한 전체 count
		public int count() throws Exception{
			String sql = "select count(*) as cnt from product";
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			//게시글 수 구하기
			int count = 0;
			if(rs.next()) {
				count=rs.getInt("cnt");
			}
			conn.close();
			return count;
		}
}
