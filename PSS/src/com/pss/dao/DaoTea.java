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
	 * ����id��ѯ�Ƿ��д˽�ʦ
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
	/**
	 * ������ʦ��Ϣ
	 * @param stu
	 * @return
	 */
	public int updateTea(Teacher tea){
		int rs = 0;
		try{
			String sql_update = "update teacher set Tname=?,Tpassword=? where TNo=?;";//�޸�һ��ѧ����Ϣ
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_update);
			pst.setString(1, tea.getTname());
			pst.setString(2, tea.getTpassword());
			pst.setString(3, tea.getTNo());
			
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("update over!");
			}
		}catch(Exception e){e.printStackTrace();}
		return rs;
	}
}
