package cn.lk.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.Cloud;

public class CloudDao {
	public List<Cloud> getCloudData(){
		Connection conn = DBUtil.getConnection();
		String sql = "select word,count from WordCloud;";
		ResultSet set = null;
		Statement stmt = null;
		List<Cloud> list = new ArrayList<Cloud>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				Cloud bean = new Cloud();
				bean.setWord(set.getString("word"));
				bean.setCount(set.getInt("count"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		System.out.println(list.size());
		return list;
	}
}
