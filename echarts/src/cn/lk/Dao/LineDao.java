package cn.lk.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.line;

public class LineDao {
	public List<line> getLineData(){
		Connection conn = DBUtil.getConnection();
		String sql = "select time,high,low from line;";
		ResultSet set = null;
		Statement stmt = null;
		List<line> list = new ArrayList<line>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				line bean = new line();
				bean.setTime(set.getString("time"));
				bean.setHigh(set.getInt("high"));
				bean.setLow(set.getInt("low"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	
}
