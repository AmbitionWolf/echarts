package cn.lk.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.Radar;

public class RadarDao {
	public List<Radar> getRadarData(){
		Connection conn = DBUtil.getConnection();
		String sql = "select budget,spending from radar;";
		ResultSet set = null;
		Statement stmt = null;
		List<Radar> list = new ArrayList<Radar>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				Radar bean = new Radar();
				bean.setBudget(set.getInt("budget"));
				bean.setSpending(set.getInt("spending"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
}
