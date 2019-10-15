package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.pss.conn.Conn;
import com.pss.user.GPS;
import com.pss.user.Project;
import com.pss.user.Student;


public class DaoPro {
	
	/**
	 * 根据课题编号查询课题对象
	 * @param pno
	 * @return
	 */
	public Project querybypno(int pno){
		Project pro=null;
		Connection conn = null;
		try{
			String sql_querybypno = "select * from project where PNo=?";
			conn=new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_querybypno);
			pst.setInt(1, pno);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				pro=new Project(rs.getInt("PNo"),rs.getString("Pname"),rs.getInt("Pmaxnum"),rs.getInt("Pselected"),rs.getInt("Pavailable"));
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return pro;
	}
	
	/**
	 * 查询列出所有课题
	 * @return
	 */
	public List<Project> listAllProject(){
		Connection conn = null;
		Project pro=null;
		List<Project> list  = new ArrayList<Project>();
		try{
			
			String sql = "select* from project";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				pro=new Project(rs.getInt("PNo"),rs.getString("Pname"),rs.getInt("Pmaxnum"),rs.getInt("Pselected"),rs.getInt("Pavailable"));
				list.add(pro);
				
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return list;
	}
}
