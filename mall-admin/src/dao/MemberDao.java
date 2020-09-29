package dao;
import java.util.*;
import java.sql.*;
import vo.*;
import commons.*;
public class MemberDao {
	//회원정보 삭제
	public void deleteMemberList(String memberEmail) throws Exception {
		String sql = "delete from member where member_email = ?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		stmt.executeUpdate();
		conn.close();
		
	}
	//회원정보를 검색
	public ArrayList<Member> selectMemberList(int currentPage, int rowPerPage ) throws Exception {
		ArrayList<Member> list = new ArrayList<Member>();
		String sql = "select member_email, member_pw, member_name, member_date from member limit ?,?";
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, (currentPage-1)*10);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Member member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberPw(rs.getString("member_pw"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
			list.add(member);
		}
		conn.close();
		return list;
	}
	//페이징을 위한 전체 count
	public int count() throws Exception{
		String sql = "select count(*) as cnt from member";
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
