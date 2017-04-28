package cn.lk.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.pie1;

public class Pie1Dao {
	public List<pie1> getPieData(){
		Connection conn = DBUtil.getConnection();
		String sql = "select range_1,num from pie1;";
		ResultSet set = null;
		Statement stmt = null;
		List<pie1> list = new ArrayList<pie1>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				pie1 bean = new pie1();
				bean.setRange(set.getString("range_1"));
				bean.setNum(set.getString("num"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		System.out.println(list.size());
		return list;
	}
	
}
