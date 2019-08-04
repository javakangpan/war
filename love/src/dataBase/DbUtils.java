package dataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DbUtils {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		//Class.forName(DataBaseConfig.CLASS_NAME);
		//return DriverManager.getConnection(DataBaseConfig.URL, DataBaseConfig.USER, DataBaseConfig.PASSWORD);
		 return DataSourceConfig.getDataSource().getConnection();
	}

	public static int execUpdate(PreparedStatement ps) throws SQLException {	
		return ps.executeUpdate();
	}
	
	public static ResultSet execQuery(PreparedStatement ps) throws SQLException {
		return ps.executeQuery();
	}

	public static int execQueryCount(PreparedStatement ps) throws SQLException {
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) throws SQLException {
		if(null != rs) {
			rs.close();
		}
		if(null != ps) {
			ps.close();
		}
		if(null != conn) {
			conn.close();
		}		
	}
	public static void close(Connection conn, PreparedStatement ps) throws SQLException {
		if(null != ps) {
			ps.close();
		}
		if(null != conn) {
			conn.close();
		}		
	}
	public static void main (String[] args) throws Exception {
		Connection db = DbUtils.getConnection();
		System.out.println(db);
	}
}
