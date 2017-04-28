package cn.lk.DBUtil;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DBUtil {
	private static final String DBDriver="org.gjt.mm.mysql.Driver";
	private static final String DBURl="jdbc:mysql://localhost:3306/testecharts";
	private static final String DBUser="root";
	private static final String DBPassword="123456";
	private static Connection conn=null;
	static{
		try {
			Class.forName(DBDriver);
			conn=(Connection) DriverManager.getConnection(DBURl,DBUser,DBPassword);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void labManageDButil(){
	}
	public static Connection getConnection(){
		return conn;
	}
	public void close(){
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
