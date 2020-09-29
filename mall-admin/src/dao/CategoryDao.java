package dao;
import java.util.*;

import commons.DBUtil;
import vo.Category;
import java.sql.*;
public class CategoryDao {
	//category 이름 리스트
	public ArrayList<String> selectCategoryName() throws Exception {
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select category_name from category ";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			list.add(rs.getString("category_name"));
		}
		conn.close();
		return list;
	}
	//category를 추가하는 코드
	public void insertCategory(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setNString(1, category.getCategoryName());
		stmt.executeLargeUpdate();
		conn.close();
	}
	//category를 삭제하는 코드
	public void deleteCategory(Category category) throws Exception{
		String sql = "delete from category where category_id= ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, category.getCategoryId());
		stmt.executeLargeUpdate();
		conn.close();
	}
	//category를 수정하는 코드
	public void updateCategory(Category category) throws Exception{
		String sql = "update category set category_name= ? where category_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setInt(2, category.getCategoryId());
		stmt.executeLargeUpdate();
		conn.close();
	}
	//category를 검색하는 코드
	public ArrayList<Category> selectCategoryList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		String sql = "select category_id, category_name from category";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getNString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	//category를 검색하는 코드 10개씩
	public ArrayList<Category> selectCategoryList(int currentPage, int rowPerPage) throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		String sql = "select category_id, category_name from category limit ?,?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, (currentPage-1)*10);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getNString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	//페이징을 위한 전체 count
	public int count() throws Exception{
		String sql = "select count(*) as cnt from category";
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
	//카테고리별 페이징을 위한 count
	public int count(int categoryId) throws Exception{
		String sql = "select count(*) as cnt from product where category_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,categoryId);
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
