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
	 * @param gno
	 * @param applicant
	 * @param leader
	 * @return
	 */
	public int insertApply(int gno,String gname,String applicant){
		int rs = 0;
		Connection conn=null;
		try{
			String sql = "insert into apply(GNo,Gname,Applicant,Status) values(?,?,?,?);";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, gno);
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
	
	public int updatetApplyStatus(int gno,String gname,String applicant,int old_s,int new_s){
		int rs = 0;
		Connection conn=null;
		try{
			String sql = "update apply set Status=? where GNo=? and Gname=? and Applicant=? and Status=?;";
			conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, new_s);
			pst.setInt(2, gno);
			pst.setString(3, gname);
			pst.setString(4, applicant);
			pst.setInt(5, new_s);
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
	public Apply queryApply(String gname,String applicant_sno,int status){
		Apply apply=null;
		Connection conn = null;
		try{
			String sql = "select * from apply where Gname=? and Applicant=? and Status=?";
			conn=new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, gname);
			ResultSet rs = pst.executeQuery();
			Student applicant=null;
			if(rs.next()){
				int ano=rs.getInt("ANo");
				int gno = rs.getInt("GNo");
				DaoStu querybyid = new DaoStu();
				applicant = querybyid.querybyid(applicant_sno);
				apply=new Apply(ano,gno,gname,applicant,status);
			}
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
