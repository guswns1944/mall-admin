package commons;
import java.sql.*;
public class DBUtil {
	public Connection getConnection() throws Exception {
		// DB의 연결을 위한 util 각각 선언할 경우 정보가 바뀌면 하나하나 수정을 해줘야 하지만 
		// 호출하여 사용하면 이부분만 수정하여 사용하면 모두 적용이 가능하기 때문에 만듬
		String driver = "org.mariadb.jdbc.Driver";
		String dbaddr = "jdbc:mariadb://localhost:3307/mall";
		String dbid = "root";
		String dbpw = "java1004";
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		return conn;
	}
}
