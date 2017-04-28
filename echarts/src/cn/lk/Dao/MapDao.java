package cn.lk.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.Map;

public class MapDao {
	public List<Map> getMapData(){
		Connection conn = DBUtil.getConnection();
		String sql = "select name,value from emap;";
		ResultSet set = null;
		Statement stmt = null;
		List<Map> list = new ArrayList<Map>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				Map bean = new Map();
				bean.setName(set.getString("name"));
				bean.setValue(set.getFloat("value"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	public List<Map> getMap1Data(){
		Connection conn = DBUtil.getConnection();
		String sql = "select name,value from emap1;";
		ResultSet set = null;
		Statement stmt = null;
		List<Map> list = new ArrayList<Map>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				Map bean = new Map();
				bean.setName(set.getString("name"));
				bean.setValue(set.getFloat("value"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	public List<Map> getMap2Data(){
		Connection conn = DBUtil.getConnection();
		String sql = "select name,value from emap2;";
		ResultSet set = null;
		Statement stmt = null;
		List<Map> list = new ArrayList<Map>();
		try {
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while (set.next()) {
				Map bean = new Map();
				bean.setName(set.getString("name"));
				bean.setValue(set.getFloat("value"));
				list.add(bean);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
}
