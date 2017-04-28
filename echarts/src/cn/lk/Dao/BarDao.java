package cn.lk.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.Bar;

public class BarDao {
	public List<Bar> getBarData(){
		Connection conn = DBUtil.getConnection();
		String sql = "select time,waterin,waterout from bar;";
		ResultSet set = null;
		Statement stmt = null;
		List<Bar> list = new ArrayList<Bar>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				Bar bean = new Bar();
				bean.setTime(set.getString("time"));
				bean.setWaterin(set.getInt("waterin"));
				bean.setWaterout(set.getInt("waterout"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	
}
