package cn.lk.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.Pie;

public class PieDao {
	public List<Pie> getPieData(){
		Connection conn = DBUtil.getConnection();
		String sql = "select gender,num from pie;";
		ResultSet set = null;
		Statement stmt = null;
		List<Pie> list = new ArrayList<Pie>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				Pie bean = new Pie();
				bean.setGender(set.getString("gender"));
				bean.setNum(set.getInt("num"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	
}
