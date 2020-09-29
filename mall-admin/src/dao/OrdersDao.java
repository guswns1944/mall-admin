package dao;
import java.util.*;

import commons.DBUtil;
import vo.*;
import java.sql.*;

public class OrdersDao {
	//주문 목록 페이징
	public int count() throws Exception{
		String sql = "select count(*) as cnt from orders";
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
	//주문상태 리스트 
	public ArrayList<String> selectOrdersStateList() throws Exception {
		ArrayList<String> list = new  ArrayList<String>();
		String sql = "select distinct orders_state from orders ";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {		
			list.add(rs.getNString("orders_state"));
		}
		conn.close();
		return list;
	}
	//전체 주문의 리스트
	public ArrayList<OrdersAndProduct> selectOrdersList(int currentPage, int rowPerPage) throws Exception {
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		String sql = "select o.orders_id, o.product_id, p.product_name, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date from orders o inner join product p on o.product_id = p.product_id order by o.orders_id desc limit ?,?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, (currentPage-1)*10);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.setOrders(new Orders());
			oap.setProduct(new Product());
			oap.getOrders().setOrdersId(rs.getInt("orders_id"));
			oap.getOrders().setProductId(rs.getInt("product_id"));
			oap.getProduct().setProductName(rs.getString("product_name"));
			oap.getOrders().setOrdersAmount(rs.getInt("orders_amount"));
			oap.getOrders().setOrdersPrice(rs.getInt("orders_price"));
			oap.getOrders().setMemberEmail(rs.getString("member_email"));
			oap.getOrders().setOrdersAddr(rs.getString("orders_addr"));
			oap.getOrders().setOrdersState(rs.getString("orders_state"));
			oap.getOrders().setOrdersDate(rs.getString("orders_date"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
	//ordersState별 리스트 
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState, int currentPage, int rowPerPage) throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		String sql = "select o.orders_id, o.product_id, p.product_name, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date from orders o inner join product p on o.product_id = p.product_id where orders_state = ? order by o.orders_id desc limit ?,?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		stmt.setInt(2, (currentPage-1)*10);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.setOrders(new Orders());
			oap.setProduct(new Product());
			oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
			oap.getOrders().setProductId(rs.getInt("o.product_id"));
			oap.getProduct().setProductName(rs.getString("product_name"));
			oap.getOrders().setOrdersAmount(rs.getInt("orders_amount"));
			oap.getOrders().setOrdersPrice(rs.getInt("orders_price"));
			oap.getOrders().setMemberEmail(rs.getString("member_email"));
			oap.getOrders().setOrdersAddr(rs.getString("orders_addr"));
			oap.getOrders().setOrdersState(rs.getString("orders_state"));
			oap.getOrders().setOrdersDate(rs.getString("orders_date"));
			list.add(oap);
		}
		conn.close();
		return list;
	}
	//주문 상태 수정
	public void updateOrdersState(Orders orders) throws Exception {
		String sql = "update orders set orders_state = ? where orders_id = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getOrdersState());
		stmt.setInt(2, orders.getOrdersId());
		stmt.executeUpdate();
		conn.close();
	}
	
}
