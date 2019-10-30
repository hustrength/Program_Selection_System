package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pss.conn.Conn;
import com.pss.user.Student;
import com.pss.user.Teacher;

public class DaoTea {
	
	/**
	 * 根据id查询是否有此教师
	 * @param id
	 * @return
	 */
	public Teacher querybyid(String id){
		Teacher tea=null;
		Connection conn = null;
		try{
			String sql = "select * from teacher where TNo=?;";
			conn=new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				tea = new Teacher(rs.getString("TNo"),rs.getString("Tname"),rs.getString("Tpassword"));
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return tea;
	}

}
