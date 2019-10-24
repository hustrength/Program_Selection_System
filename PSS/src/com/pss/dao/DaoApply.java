/**
 * 
 */
package com.pss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pss.conn.Conn;
import com.pss.user.GPS;
import com.pss.user.Apply;
import com.pss.user.Student;

public class DaoApply {
	/**
	 * 插入一个申请单
	 * @param gps
	 * @return
	 */
	public int insertApply(Apply apply){
		int rs = 0;
		Connection conn=null;
		try{
			String applicant,gname;
			applicant=apply.getApplicant().getSNo();
			gname=apply.getGname();
			String sql_insert = "insert into apply(GNo,Gname,Applicant,Status) values(?,?,?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql_insert);
			pst.setInt(1, apply.getGNo());
			pst.setString(2, gname);
			pst.setString(3, applicant);
			pst.setInt(4, 0);
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("insert over!");
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	/**
	 * 插入一个申请单
	 * @param gno
	 * @param applicant
	 * @param leader
	 * @return
	 */
	public int insertApply(int gno,String applicant,String leader){
		int rs = 0;
		Connection conn=null;
		try{
			String sql = "insert into apply(GNo,Applicant,Leader,Status) values(?,?,?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, gno);
			pst.setString(2, applicant);
			pst.setString(3, leader);
			pst.setInt(4, 0);
			rs = pst.executeUpdate();
			if(rs!=0){
				System.out.println("insert over!");
			}
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return rs;
	}
	
	/**
	 * 查询申请单
	 * @param applicant
	 * @param leader
	 * @return
	 */
	public Apply queryApply(String gname,String applicant,int status){
		Apply apply=null;
		Connection conn = null;
		try{
			String sql = "select * from apply where Gname=? and Applicant=? and Status=?";
			conn=new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, gname);
			ResultSet rs = pst.executeQuery();
		}catch(Exception e){e.printStackTrace();}
		finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return apply;
	}
	
	
	/**
	 * 遍历申请单
	 * @param sno
	 * @return
	 */
	public List<Apply> listApplybyGname(String gname){
		Connection conn = null;
		Apply apply=null;
		List<Apply> list  = new ArrayList<Apply>();
		try{
			String sql = "select* from apply where Gname=?";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, gname);
			ResultSet rs = pst.executeQuery();
			Student applicant;
			DaoStu querybyid = new DaoStu();
			System.out.println(gname);
			while(rs.next()){
				int ano=rs.getInt("ANo");
				int gno = rs.getInt("GNo");
				int status = rs.getInt("Status");
				String applicant_no = rs.getString("Applicant");
				System.out.println(applicant_no);
				applicant=querybyid.querybyid(applicant_no);
				apply=new Apply(ano,gno,gname,applicant,status);
				list.add(apply);
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
