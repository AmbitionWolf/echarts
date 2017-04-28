package cn.lk.Dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import cn.lk.DBUtil.DBUtil;
import cn.lk.VO.Map1;

public class Map1Dao {
	ResultSet set = null;
	Statement stmt = null;
	Connection conn = null;
	
	public List<Map1> getToNameData(){
		conn = DBUtil.getConnection();
		String sql = "select toName,value from toName;";
		List<Map1> list = new ArrayList<Map1>();
		try{
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				Map1 m = new Map1();
				m.setToName(set.getString(1));
				m.setValue(set.getInt(2));
				list.add(m);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Map1> getFromNameData(){
		conn = DBUtil.getConnection();
		String sql = "select fromName from fromName;";
		List<Map1> list = new ArrayList<Map1>();
		try{
			stmt = (Statement) conn.createStatement();
			set = stmt.executeQuery(sql);
			while(set.next()){
				Map1 m = new Map1();
				m.setFromName(set.getString(1));
				list.add(m);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
}
